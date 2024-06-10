<?php

namespace App\Http\Controllers;

use App\Enums\StatusEnum;

use App\Http\Controllers\Controller;

use App\Models\GeneralSetting;

use Gregwar\Captcha\CaptchaBuilder;
use Illuminate\Support\Facades\Session;
use Gregwar\Captcha\PhraseBuilder;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Closure;
use Illuminate\Support\Arr;
use Illuminate\Http\Response;

class CoreController extends Controller
{
    
  


      
     /**
     * genarate default cpatcha code
     *
     * @return void
     */
    public function defaultCaptcha(int | string $randCode){
        
        $phrase   = new PhraseBuilder;
        $code     = $phrase->build(4);
        $builder  = new CaptchaBuilder($code, $phrase);
        $builder->setBackgroundColor(220, 210, 230);
        $builder->setMaxAngle(25);
        $builder->setMaxBehindLines(0);
        $builder->setMaxFrontLines(0);
        $builder->build($width = 100, $height = 40, $font = null);
        $phrase   = $builder->getPhrase();

        if(Session::has('gcaptcha_code')) {
            Session::forget('gcaptcha_code');
        }
        Session::put('gcaptcha_code', $phrase);
        header("Cache-Control: no-cache, must-revalidate");
        header("Content-Type:image/jpeg");
        $builder->output();
    }




    public function aiContent(Request $request) : array{

        if(!$request->input('custom_prompt')){
            return [
                "status"  => false,
                "message" => 'Content Field is Required'
            ];
        }

        try {
            $general     = GeneralSetting::first();
            $openAi      = $general->open_ai_setting ? json_decode($general->open_ai_setting) : null;
            $apiKey      = $openAi->key;
            if(@$openAi->status  == 2){
                return [
                    "status"  => false,
                    "message" => translate("Ai Module is Currently of Now"),
                ];
            }
    
            $prompt = '';
    
            $option = Arr::get(get_ai_option(),$request->input('ai_option'),null);
            $tone   = Arr::get(get_ai_tone(),$request->input('ai_tone'),null);
           
    
            $prompt .= strip_tags($request->input('custom_prompt'))."\n".  Arr::get(@$tone?? [] ,'prompt') . Arr::get(@$option ?? [] ,'prompt');

            if($request->input("language")){
                $prompt = strip_tags($request->input('custom_prompt'))."\n".'Write the Abovbe message in ' . $request->input("language") . ' language and Do not write translations.';
            }


            
    
            $client      = \OpenAI::client($apiKey);
    
            $result = $client->chat()->create([
                'model' => 'gpt-3.5-turbo',
                'messages' => [
                    [
                        "role"     => "user",
                        "content"  =>  $prompt 
                    ]
                ],
            ]);
    
            if(isset($result['choices'][0]['message']['content'])){
                $realContent                   = $result['choices'][0]['message']['content'];
    
    
                return [
                    "status"  => true,
                    "message" => strip_tags(str_replace(["\r\n", "\r", "\n"] ,"<br>",$realContent))
                ];
            }
    
            return [
                "status"  => false,
                "message" => 'No Result Found!!'
            ];
    
        } catch (\Exception $ex) {
            return [
                "status"  => false,
                "message" => strip_tags($ex->getMessage())
            ];
        }
     
   

    
    }
    


        /**
         * generate ai reply for ticket
         * 
         */
      public  function aiResult($request){


        $general = GeneralSetting::first();

        $openAi      = $general->open_ai_setting ? json_decode($general->open_ai_setting) : null;
        $apiKey      =  $openAi->key;

        $client      = \OpenAI::client($apiKey);

        $max_results = (int) $request->number_of_result;
        $max_tokens  = (int) $request->max_result_length;
      
        return  $client->completions()->create([

            'model'        => 'gpt-3.5-turbo-instruct',
            "temperature"  => (float)$request->ai_creativity_level,
            'prompt'       => $request->question,
            'max_tokens'   => $max_tokens,
            'n'            => $max_results,

        ]);

     }



     public  function maintenanceMode() :View | RedirectResponse{

        $general = GeneralSetting::first();
        if($general->maintenance_mode == 2 ){
            return redirect()->route('home');
        }
        
        $title = 'Maintenance Mode';
        return view('maintenance_mode' ,compact('title'));

     }



     
    public function security() :View{
        
        $general =  GeneralSetting::first();
        $security = $general->security_settings ? json_decode($general->security_settings)  : null;
        if(@$security->dos_prevent == StatusEnum::true->status() && session()->has('security_captcha')){

            return view('dos_security',[
                "title"    =>  translate('Too many request')
            ]);
        }
        abort(403);
    }


    public function securityVerify(Request $request) :RedirectResponse {

    
        $request->validate([
            "captcha" =>   ['required' , function (string $attribute, mixed $value, Closure $fail) {
                if (strtolower($value) != strtolower(session()->get('gcaptcha_code'))) {
                    $fail(translate("Invalid captcha code"));
                }
            }]
        ]);

        session()->forget('gcaptcha_code');
        session()->forget('security_captcha');
        session()->forget('dos_captcha');

        $route = 'home';
        if(session()->has('requested_route')){
            $route = session()->get('requested_route');
        }
        return redirect()->route($route);
    }


    public function acceptCookie(Request $request) :Response
    {
        $cookie_consent = cookie()->forever('cookie_consent', 'accepted', null, null, null, true); 
        $accepted_at = cookie()->forever('accepted_at', now(), null, null, null, true); 
        $response = new Response(["message" => 'Cookie accepted']);
        $response->withCookie($cookie_consent);
        $response->withCookie($accepted_at);
        session()->put("cookie_consent",true);
        return $response;
        
    }

    
  
}
