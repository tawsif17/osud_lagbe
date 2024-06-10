@extends('admin.layouts.app')

@push('style-include')

   <link href="{{asset('assets/backend/css/summnernote.css')}}" rel="stylesheet" type="text/css" />

@endpush

@section('main_content')
    <div class="page-content">
        <div class="container-fluid">

            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">
                    {{translate($title)}}
                </h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">
                            {{translate("Home")}}
                        </a></li>
                        <li class="breadcrumb-item">
                            <a href="{{route('admin.digital.product.index')}}">
                            {{translate("Digital Products")}}
                        </a>
                        </li>
                        <li class="breadcrumb-item active">
                            {{translate("Update Product")}}
                        </li>
                    </ol>
                </div>
            </div>

            <form  autocomplete="off"  action="{{route('admin.digital.product.update', $product->id)}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header border-bottom-dashed">
                                <div class="row g-4 align-items-center">
                                    <div class="col-sm">
                                        <div>
                                            <h5 class="card-title mb-0">
                                                {{translate('Product Basic Information')}}
                                            </h5>

                                        </div>
                                    </div>



                                </div>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="name">
                                                {{translate("Product Title")}} <span class="text-danger" >*</span>
                                            </label>

                                            <input  name="name" id="name" type="text" class="form-control"  value="{{$product->name}}"
                                                placeholder="Enter product title" required>
                                            <div class="invalid-feedback">
                                                {{translate("Please Enter a product title")}}
                                                </div>
                                        </div>
                                    </div>
                                    <div class="col-12 text-editor-area">
                                        <label for="p-description">
                                            {{translate("Product Description")}} <span class="text-danger" >*</span>
                                        </label>

                                        <textarea id="p-description" class="form-control text-editor " name="description" rows="5"
                                       placeholder="Enter Description" required>{{$product->description}}</textarea>


                                            @if( $openAi->status == 1)
                                                <button type="button" class="ai-generator-btn mt-3 ai-modal-btn" >
                                                    <span class="ai-icon btn-success waves ripple-light">
                                                            <span class="spinner-border d-none" aria-hidden="true"></span>

                                                            <i class="ri-robot-line"></i>
                                                    </span>

                                                    <span class="ai-text">
                                                        {{translate('Generate With AI')}}
                                                    </span>
                                                </button>
                                            @endif
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card pb-4">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0">
                                    {{translate("Product Gallery")}}
                                </h5>
                            </div>

                            <div class="card-body ">
                                <div class="mb-2">
                                    <div>
                                        <label for="featured_image" class="form-label">{{translate('Thumbnail Image')}} <span class="text-danger" >*</span></label>
                                        <input type="file" name="featured_image" id="featured_image"
                                            class="form-control"  >
                                        <div class="text-danger">{{translate('Image Size Should Be')}}
                                            {{file_path()['digital_product']['featured']['size']}}
                                        </div>
                                    </div>

                                    <div class="digital_featured_img">
                                        <img class="w-25 img-thumbnail" src="{{show_image(file_path()['product']['featured']['path'].'/'.$product->featured_image,file_path()['product']['featured']['size'])}}" alt="{{$product->name}}">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0">
                                   {{translate("Meta Data")}}
                                </h5>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="meta_title">
                                                {{translate("Meta
                                                title")}}
                                            </label>
                                            <input type="text" name="meta_title" id="meta_title"  class="form-control"
                                            value="{{$product->meta_title}}" placeholder="{{translate('Enter meta title')}}" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="meta_keyword" class="form-label">{{translate('Meta Keywords')}}</label>
                                            <select
                                                name="meta_keywords[]" id="meta_keyword" class="form-control keywords"
                                                multiple=multiple>
                                                @if($product->meta_keywords)
                                                    @foreach($product->meta_keywords as $option)
                                                        <option value="{{$option}}" selected>{{translate($option) }}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="meta_description" class="form-label">{{translate('Meta Description')}}</label>
                                            <textarea class="form-control" rows="3" name="meta_description" id="meta_description" placeholder="{{translate('Enter Meta Description')}}">{{$product->meta_description}}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-start mb-3">
                            <button type="submit" class="btn btn-success w-sm waves ripple-light">
                                {{translate("Submit")}}
                            </button>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0">
                                    {{translate("Publish")}}
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="status" class="form-label">{{translate('Product Status')}} <span
                                        class="text-danger">*</span></label>
                                    <select class="form-select" id="status" name="status" required>
                                        <option  value="">{{translate('--Select One--')}}</option>
                                        <option  {{$product->status== 0? 'selected': ''}}    value="0">{{translate('New')}}</option>
                                        <option {{$product->status== 1? 'selected': ''}}     value="1">{{translate('Published')}}</option>
                                        <option {{$product->status== 2? 'selected': ''}}    value="2">{{translate('Inactive')}}</option>
                                    </select>

                                </div>
                            </div>

                        </div>

                        <div class="card">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0">
                                    {{translate("Product Categories")}}
                                </h5>
                            </div>
                            <div class="card-body">
                                <div>
                                    <label for="category_id" class="form-label">{{translate('Category')}} <span
                                            class="text-danger">*</span></label>
                                    <select name="category_id" id="category_id" class="form-select w-100" required>
                                        <option value="">{{translate('--Select One--')}}</option>
                                        @foreach($categories as $category)
                                        <option  {{$product->category_id == $category->id ? "selected" : ''}}   value="{{$category->id}}" data-subcategory="{{$category->parent}}">
                                            {{(get_translation($category->name))}}</option>
                                        @endforeach
                                    </select>
                                </div>


                                @php
                                  $sub_category =  App\Models\Category::where('id',$product->sub_category_id)->first();
                                @endphp

                              <div class="mt-2">
                                  <label for="subcategory_id" class="form-label">{{translate('Sub Category')}}</label>
                                  <select name="subcategory_id" id="subcategory_id" class="form-select selectItem" >

                                      @if( $sub_category)
                                        <option value="{{$product->sub_category_id}}">
                                            {{(get_translation($sub_category->name))}}
                                        </option>
                                      @else
                                        <option value="">{{translate('--Select One--')}}</option>
                                      @endif
                                  </select>
                              </div>
                            </div>

                        </div>
                    </div>
                </div>

            </form>
        </div>

    </div>


@endsection

@push('script-include')
	<script src="{{asset('assets/backend/js/summnernote.js')}}"></script>
	<script src="{{asset('assets/backend/js/editor.init.js')}}"></script>

@endpush

@push('script-push')
<script>
	"use strict";



    $(".select2").select2({
		placeholder:"{{translate('Select Keywords')}}",
	})

    $('select[name=category_id]').on('change', function() {
        $('select[name=subcategory_id]').html('<option value="" selected="" disabled="">{{translate("--Select One--")}}</option>');
        var subcategorys = $('select[name=category_id] :selected').data('subcategory');
        var html = '';
        var lang_code = "{{session()->get('locale')}}"
        subcategorys.forEach(function myFunction(item, index) {

            const x =  `{{old('subcategory_id')}}`;
            html += `<option   value="${item.id}">${JSON.parse(item.name)[lang_code]}</option>`
        });
        $('select[name=subcategory_id]').append(html);
    });

    $('.keywords').select2({
        tags: true,
        tokenSeparators: [','],
        placeholder:"{{translate('Type Keywords')}}",
    });

    $('#select_attributes').select2({
        placeholder:"{{translate('Choose Value')}}",
    });

	$("#featured_image").on("change", function(e) {
		var file = e.target.files[0];
		$(`.digital_featured_img`).html('')
		$(`.digital_featured_img`).append(
			`<img alt='${file.type}'class='mt-2' src='${URL.createObjectURL(file)}'>`
		);
	});



</script>
@endpush






