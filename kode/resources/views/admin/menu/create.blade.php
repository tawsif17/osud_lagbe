@extends('admin.layouts.app')
@section('main_content')
    <div class="page-content">
        <div class="container-fluid">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">
                    {{translate('Create  Menu')}}
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">
                            {{translate('Home')}}
                        </a></li>
                        <li class="breadcrumb-item"><a href="{{route('admin.menu.index')}}">
                            {{translate('Menus')}}
                        </a></li>
                        <li class="breadcrumb-item active">
                            {{translate('Create')}}
                        </li>
                    </ol>
                </div>
            </div>

            <div class="card">
                <div class="card-header border-bottom-dashed">
                    <div class="row g-4 align-items-center">
                        <div class="col-sm">
                            <h5 class="card-title mb-0">
                                {{translate('Create Menu')}}
                            </h5>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <form action="{{route('admin.menu.store')}}" method="POST"  enctype="multipart/form-data">
                        @csrf
                        <div class="row g-3">
                            <div class="col-lg-6">
                                <div >
                                    <label for="name" class="form-label">
                                        {{translate('Name')}} <span  class="text-danger">*</span>
                                    </label>
									<input type="text"  value="{{old('name')}}" class="form-control" id="name" name="name" placeholder="Enter Name" required>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div >
                                    <label for="url" class="form-label">  {{translate('URL')}}
                                    <span  class="text-danger"  >*</span>
                                    </label>
                                    <input type="text" class="form-control" id="url" value="{{old('url')}}" name="url" placeholder="{{translate('Enter Url')}}" required>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div>
                                    <label for="image" class="form-label">
                                        {{translate('Image')}}  <span class="text-danger"> *
                                            ({{file_path()['menu']['size'] }})
                                        </span>
                                    </label>
                                    <input data-size ="{{file_path()['menu']['size']}}" type="file" id="image" class="preview form-control w-100"
                                        name="image">
                                </div>
                                <div id="image-preview-section">

                                </div>
                            </div>
                        </div>

                        <div class="text-start mt-4">
                            <button type="submit" class="btn btn-success">
                                {{translate('Add')}}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection








