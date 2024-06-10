@extends('seller.layouts.app')

@push('style-include')

   <link href="{{asset('assets/backend/css/summnernote.css')}}" rel="stylesheet" type="text/css" />

@endpush

@section('main_content')
    <div class="page-content">
        <div class="container-fluid">

            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">
                    {{translate("Create Product")}}
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="{{route('seller.dashboard')}}">
                            {{translate("Home")}}
                        </a></li>
                        <li class="breadcrumb-item">
                            <a href="{{route('seller.digital.product.index')}}">
                            {{translate("Digital Products")}}
                        </a>
                        </li>
                        <li class="breadcrumb-item active">

                            {{translate("Create Product")}}
                        </li>
                    </ol>
                </div>

            </div>

            <form  id="createproduct-form" autocomplete="off" class="needs-validation"  action="{{route('seller.digital.product.store')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0">
                                    {{translate('Product Basic Information')}}
                                </h5>
                            </div>

                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div>
                                            <label class="form-label" for="name">
                                                {{translate("Product Title")}} <span class="text-danger" >*</span>
                                            </label>

                                            <input  name="name" id="name" type="text" class="form-control"  value="{{old('name')}}"
                                                placeholder="Enter product title" required>

                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="description">
                                            {{translate("Product Description")}} <span class="text-danger" >*</span>
                                        </label>

                                        <textarea class="form-control text-editor" name="description" rows="5"
                                        id="description" placeholder="{{translate('Enter Description')}}" required>{{old('description')}}</textarea>
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
                                <div>
                                    <div>
                                        <label for="featured_image" class="form-label">{{translate('Thumbnail Image')}} <span class="text-danger" >*</span></label>
                                        <input type="file" name="featured_image" id="featured_image"
                                            class="form-control" required>
                                        <div  class="text-danger">{{translate('Image Size Should Be')}}
                                            {{file_path()['digital_product']['featured']['size']}}
                                        </div>
                                    </div>
                                    <div class="digital_featured_img">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0">
                                  {{translate("Product Stock")}}
                                </h5>
                            </div>

                            <div class="card-body pb-3">
                                <div>
                                    <a href="javascript:void(0)" class="btn btn-primary btn-sm  border-0 rounded newattribute"><i class="las la-plus"></i>{{translate('Add New Attribute')}}</a>
                                    <div class="newdataadd"></div>
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
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div>
                                            <label class="form-label" for="meta_title">
                                                {{translate("Meta
                                                title")}}
                                            </label>
                                            <input type="text" name="meta_title" id="meta_title"  class="form-control"
                                            value="{{old('meta_title')}}"    placeholder="Enter meta title">
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div>
                                            <label for="meta_keyword" class="form-label">{{translate('Meta Keywords')}}</label>
                                            <select
                                                name="meta_keywords[]" id="meta_keyword" class="form-select keywords"
                                                multiple>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div>
                                            <label for="meta_description" class="form-label">{{translate('Meta Description')}}</label>
                                            <textarea class="form-control" rows="3" name="meta_description" id="meta_description" placeholder="{{translate('Enter Meta Description')}}">{{old('meta_description')}}</textarea>
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
                                        <option  {{old('category_id') == $category->id ? "selected" : ''}}   value="{{$category->id}}" data-subcategory="{{$category->parent}}">
                                            {{(get_translation($category->name))}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-3">
                                    <label for="subcategory_id" class="form-label">{{translate('Sub Category')}}</label>
                                    <select name="subcategory_id" id="subcategory_id" class="form-select" >
                                        <option value="">{{translate('--Select One--')}}</option>
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
		let file = e.target.files[0];
		$(`.digital_featured_img`).html('')
		$(`.digital_featured_img`).append(
			`<img alt='${file.type}'class='mt-2' src='${URL.createObjectURL(file)}'>`
		);
	});


	$('.newattribute').on('click', function(){
        var html = `
        <div class="row newdata my-2">
            <div class="mb-3 col-lg-5">
                <input type="text" class="form-control" name="attribute_option[name][]" placeholder="Attribute name">
            </div>

            <div class="mb-3 col-lg-5">
                <input type="number" class="form-control" name="attribute_option[price][]" placeholder="Attribute price">
            </div>

            <div class="col-lg-2 col-md-12 mt-md-0 mt-2 text-right">
                <span class="input-group-btn">
                    <button class="btn btn-danger btn-md removeBtn " type="button">
                        <i class="ri-close-fill"></i>
                    </button>
                </span>
            </div>
        </div>`;
        $('.newdataadd').append(html);
        $(".removeBtn").on('click', function(){
            $(this).closest('.newdata').remove();
        });
    });
</script>
@endpush






