<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusEnum;
use App\Http\Controllers\Controller;
use App\Models\GeneralSetting;
use App\Models\Visitor;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Illuminate\Http\JsonResponse;

class SecurityController extends Controller
{


    public function dos() :View{

        return view('admin.security.dos',[
            'title'        => 'Dos Security',
        ]);
    }

    public function dosUpdate(Request $request) :RedirectResponse{



        $request->validate([
            "site_settings"                        => ['required',"array"],
            "site_settings.dos_attempts"           => ['required',"numeric","min:1","max:10000"],
            "site_settings.dos_attempts_in_second" => ['required',"numeric","min:1","max:10000"],
        ]);

        $general = GeneralSetting::first();

        $general->security_settings = json_encode($request->input('site_settings',[]));
        $general->save();


        return back()->with(response_status('Updated Successfully'));
    }


   

    /**
     * Visitor ip list
     *
     * @return View
     */
    public function ipList() :View{

        return view('admin.security.ip_list',[

            'title'        => 'Manage Ip',
            'ip_lists'     => Visitor::latest()
                                ->when(request()->ip_address,function($query) {
                                    return $query->where('ip_address',request()->ip_address);
                                })->paginate(20)->appends(request()->all())

        ]);
    }




    /**
     * Update a specific ip status
     *
     * @param Request $request
     * @return string
     */
    public function ipStatus(Request $request) :string {
        

        $modelInfo = [
            'table'  => (new Visitor())->getTable(),
            'key'    => "id",
            'values' => StatusEnum::toArray()
        ];

        validateModelStatus($request,$modelInfo);

        $visitor                =  Visitor::where('id',$request->data['id'])->firstOrfail();
        $visitor->is_blocked    =  $request->data['status'];
        $visitor->save();

        $response['status']      = true;
        $response['reload']      = true;
        $response['message']     = translate('Status Updated Successfully');

        return json_encode([$response]);


    }


    public function ipStore(Request $request) :RedirectResponse{
    
        $request->validate([
            'ip_address' => ['required','ip',"max:155"],
        ]);

        Visitor::create([
            "ip_address" => $request->input('ip_address'),
        ]);

        return  back()->with(response_status('Ip created successfully'));

    }




    public function ipDestroy(string | int $id) :RedirectResponse{

        Visitor::where('id',$id)->delete();
        return  back()->with(response_status('Item deleted succesfully'));
    }
    

 

}
