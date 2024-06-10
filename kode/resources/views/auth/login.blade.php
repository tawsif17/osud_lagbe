@extends('frontend.layouts.app')
@section('content')

<div class="breadcrumb-banner">
    <div class="breadcrumb-banner-img">
        <img src="{{show_image(file_path()['frontend']['path'].'/'.@frontend_section_data($breadcrumb->value,'image'),@frontend_section_data($breadcrumb->value,'image','size'))}}" alt="breadcrumb.jpg">
    </div>  
    <div class="page-Breadcrumb">
        <div class="Container">
            <div class="breadcrumb-container">
                <h1 class="breadcrumb-title">{{($title)}}</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{url('/')}}">
                            {{translate('home')}}
                        </a></li>

                        <li class="breadcrumb-item active" aria-current="page">
                            {{translate($title)}}
                        </li>

                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

@php
            $otpConfiguration = $general->otp_configuration 
                                     ? @json_decode($general->otp_configuration) 
                                     : null;
@endphp

<section class="pb-80">
    <div class="Container">
        <div class="row g-0">
            <div class="col-lg-5">
                <div class="form-wrapper">
                    <div class="login-options">
                        <button class="login-tab login-tab-btn signintab login-option-active">
                            <i class="las la-sign-in-alt"></i>
                            {{translate("Sign in")}}
                        </button>
                        
                        <button class="login-tab login-tab-btn">
                            <i class="las la-user-plus"></i>
                            {{translate("Sign Up")}}
                        </button>
                    </div>

                    <div class="login-form-container">

               
                        <form action="{{route('login.store')}}" method="POST" class="login-form sign-in-form show-form">
                            @csrf

                            <div>
                                <label for="authEmail" class="form-label">
                                    @if(@$otpConfiguration->phone_otp == 1 && @$otpConfiguration->email_otp == 1 )
                                        {{translate('Enter your email or phone')}}
                                    @elseif(@$otpConfiguration->phone_otp == 1)
                                          {{translate('Enter your phone')}}
                                    @elseif(@$otpConfiguration->email_otp == 1)
                                         {{translate('Enter your email')}}
                                    @else
                                          {{translate('Enter your email')}}
                                    @endif
                                </label>
                                <input type="text" name="email"
                                placeholder="{{translate('Type here')}}"   class="form-control" id="authEmail">
                            </div>

                            @if(@$otpConfiguration &&  @$otpConfiguration->login_with_password ==  1)

                                <div>
                                    <label for="authPass" class="form-label">{{translate('Password')}}</label>
                                    <input type="password" name="password" id="authPass"  class="form-control" placeholder="{{translate('Password')}}">
                                </div>

                                <div class="remember-forgot">
                                    <a href="javascript:void(0)" class="forgot-pass login-tab-btn">
                                        {{translate("Forgot Password")}} ?
                                    </a>
                                </div>
                                
                            @endif

    
                            <input type="submit" value="Signin" class="form-submit-btn">
                        </form>

                        <form action="{{route('register.store')}}" class="sign-up-form login-form" method="POST">
                            @csrf

                            <div>
                                <label for="authregEmail" class="form-label">{{translate('Enter your email')}}</label>
                                <input type="email" name="email" id="authregEmail" value="{{old('email')}}"  class="form-control"  aria-describedby="authregEmail" placeholder="Email Address">
                            </div>
                            <div>
                                <label for="phone" class="form-label">{{translate('Enter your phone')}}</label>
                                <input type="text" name="phone" id="phone" value="{{old('phone')}}"  class="form-control"  aria-describedby="phone" placeholder="Phone number">
                            </div>

                            <div>
                                <label for="authregPass" class="form-label">{{translate('Enter your password')}}</label>
                                <input type="password"  value="{{old('password')}}" id="authregPass" name="password" id="password" class="form-control" aria-describedby="authPass" placeholder="Password">
                            </div>

                            <div>
                                <label for="confirmAuthPass" class="form-label">{{translate('Confirmation password')}}</label>
                                <input type="password" value="{{old('password_confirmation')}}" name="password_confirmation" id="confirmAuthPass" class="form-control" aria-describedby="confirmAuthPass" placeholder="Confirm Password">
                            </div>
                          
                              @php
                                   $tc = App\Models\PageSetup::where('status','1')
                                                 ->where(function($q){
                                                    $q->where('uid','1dRR-7BkgK045-kV4k')
                                                    ->orwhere('name','like','%Terms and Conditions%');
                                                 })->first();
                              @endphp
                          
                             @if($tc)
                               <div class="form-check ">
                                  <input required name="t_c" class="form-check-input cursor-pointer" type="checkbox" value="" id="t_c">
                                  <label class="form-check-label" for="t_c">
                                      {{translate('I Accept')}} 
                                  </label>
                                  <a class="text-decoration-underline" href="{{route('pages',[make_slug($tc->name),$tc->id])}}">{{$tc->name}}</a>
                              </div>
                             @endif
                          


                            <input type="submit" value="Signup" class="form-submit-btn">
                        </form>

                        <form action="{{ route('password.email') }}" method="POST" class="reset-password login-form">
                            @csrf
                            <div class="text-center d-flex flex-column gap-3">
                                    <h4 class="fs-16"> {{translate('Forgot Password')}} </h4>
                                    <p class="fs-12 text-muted">
                                        {{translate("Please Enter Your Email")}}
                                    </p>
                            </div>

                            <div>
                                <label for="authregEmail" class="form-label">{{translate('Enter your email')}}</label>
                                <input type="email"  name="email" class="form-control"  aria-describedby="authregEmail" placeholder="{{translate("Email Address")}}">
                            </div>

                            
                            <div class="remember-forgot">
                                <a href="javascript:void(0)" class="login-tab-btn back-login">
                                    {{translate("Login")}}?
                                </a>
                            </div>

                            <input type="submit" value="Contiune" class="form-submit-btn">
                        </form>

                    </div>

                    <div class="login-with-options">
                        <h4>{{translate('Or Sign Up With')}}</h4>
                        <ul class="login-with-option">
                            @if(array_key_exists('g_status',json_decode(($general->s_login_google_info),true)))
                                @if(json_decode(($general->s_login_google_info),true)['g_status'] == 1)
                                    <li>
                                        <a href="{{url('auth/google')}}" class="google-log">
                                            <span class="log-icon"><i class="fa-brands fa-google"></i></span>{{translate('Google')}}
                                        </a>
                                </li>

                                @endif
                            @endif

                            @if(array_key_exists('f_status',json_decode(($general->s_login_facebook_info),true)))
                                @if(json_decode(($general->s_login_facebook_info),true)['f_status'] == 1)
                                    <li>
                                        <a href="{{url('auth/facebook')}}" class="facebook-log">
                                            <span class="log-icon"><i class="fa-brands fa-facebook-f"></i></span>{{translate('Facebook')}}
                                        </a>
                                </li>

                                @endif
                            @endif
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <div class="form-image-wrapper img-adjust login-bg">
                    <div class="swiper testi-two-slider">
                        <div class="swiper-wrapper">
                            @forelse ($testimonials as $testimonial )

                                <div class="swiper-slide">
                                    <div class="testi-single-two">
                                        <p>{{$testimonial->quote}}</p>
                                        <div class="author-area">
                                            <h6>{{$testimonial->author}}</h6>
                                            <span>{{$testimonial->designation}}</span>
                                        </div>
                                    </div>
                                </div>
                                
                            @empty
                            
                            @endforelse

                        </div>
                    </div>
                    <div class="testi-two-pagination pagination-one"></div>
                </div>
            </div>
        </div>
    </div>
</section>


@endsection
