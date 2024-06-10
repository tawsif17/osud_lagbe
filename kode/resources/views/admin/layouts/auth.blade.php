<!doctype html>
<html lang="en" data-layout="horizontal" data-topbar="dark" data-sidebar-size="lg" data-sidebar="light" data-sidebar-image="none" data-preloader="disable">
<head>
    <meta charset="utf-8" />
    <title>{{$title}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{show_image('assets/images/backend/logoIcon/'.$general->site_favicon,file_path()['favicon']['size'])}}" type="image/x-icon">
    <link href="{{asset('assets/global/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/icons.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/backend/css/root.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/backend/css/auth.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/global/css/toastr.css')}}" rel="stylesheet" type="text/css" />

</head>

<body>

    <div class="auth-page-content auth--bg">
        @yield('main_content')
    </div>
    <script src="{{asset('assets/global/js/jquery.min.js')}}"></script>
    <script src="{{asset('assets/global/js/bootstrap.bundle.min.js')}}"></script>

    <script src="{{asset('assets/global/js/toastify-js.js')}}"></script>
    <script src="{{asset('assets/global/js/helper.js')}}"></script>
    @include('partials.notify')
    @stack('script-push')
</body>

</html>
