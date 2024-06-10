@extends('seller.layouts.app')
@section('main_content')
<div class="page-content">
    <div class="container-fluid">

        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">
                {{translate("Product Details")}}
            </h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="{{route('seller.dashboard')}}">
                        {{translate('Home')}}
                    </a></li>
                    <li class="breadcrumb-item"><a href="{{route('seller.product.index')}}">
                        {{translate('Products')}}
                    </a></li>
                    <li class="breadcrumb-item active">
                        {{translate("Details")}}
                    </li>
                </ol>
            </div>
        </div>

		<div class="row">
			<div class="col-xxl-3 col-xl-4 col-lg-5">
				<div class="card">
					<div class="card-header border-bottom-dashed">
						<div class="d-flex align-items-center">
							<h5 class="card-title mb-0 flex-grow-1">
								{{translate('Product Details')}}
							</h5>
						</div>
					</div>

					 <div class="card-body">
                        <div class="px-3">
                            <div class="profile-section-image">
                                <img src="{{show_image(file_path()['product']['featured']['path'].'/'.$product->featured_image,file_path()['product']['featured']['size'])}}" alt="{{$product->featured_image}}" class=" w-100 img-thumbnail">
                            </div>

                            <div class="mt-3">
                                <h6 class="mb-0">{{($product->name)}}</h6>
                                <p>{{translate('Date')}} : {{get_date_time($product->created_at,'d M, Y h:i A')}}</p>
                            </div>
                        </div>

                        <div class="p-3 bg-body rounded">
                            <h6 class="mb-3 fw-bold">{{translate('Product information')}}</h6>

                            <ul class="list-group">

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Categories')}}
                                    </span>

                                    <div>
                                        <span >{{(get_translation($product->category->name))}}</span>

                                    </div>
                                </li>
                                @if($product->sub_category_id)
                                    <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                        <span class="fw-semibold">
                                            {{translate('Sub Category')}}
                                        </span>

                                        <div>
                                            <span >{{(get_translation($product->subCategory->name))}}</span>

                                        </div>
                                    </li>
                                @endif

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Brand')}}
                                    </span>
                                    <span>{{($product->brand ? get_translation($product->brand->name) : 'N/A')}}</span>
                                </li>

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Price')}}
                                    </span>
                                    <span>{{show_currency()}}{{short_amount($product->price)}}</span>
                                </li>

                                @if($product->shippingDelivery->isNotEmpty())
                                    <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                        <span class="fw-semibold">
                                            {{translate('Shipping Country')}}
                                        </span>
                                        <div>
                                            @foreach($product->shippingDelivery as $shipping)
                                                <span class="badge  text-dark">{{$shipping->shippingDelivery->name}}</span>
                                            @endforeach
                                        </div>
                                    </li>
                                @endif

                                <li class=" d-flex justify-content-between align-items-center  flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Status')}}
                                    </span>
                                    @if($product->status == 1)
                                        <span class="badge badge-soft-success">{{translate('Published')}}</span>
                                    @elseif($product->status == 2)
                                        <span class="badge badge-soft-warning">{{translate('Inactive')}}</span>
                                    @else
                                        <span class="badge badge-soft-primary">{{translate('New')}}</span>
                                    @endif
                                </li>

                            </ul>

                            <ul class="mt-4 list-group">

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Number Of Orders')}}
                                    </span>
                                    <span class="font-weight-bold">{{$product->order->count()}}</span>
                                </li>

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Order Amount')}}
                                    </span>
                                    <span class="font-weight-bold">{{$product->order->sum('amount')}}{{$general->currency_name}}</span>
                                </li>

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">
                                        {{translate('Total Item Wishlist')}}
                                    </span>

                                    <span class="font-weight-bold">{{$product->wishlist->count()}}</span>
                                </li>

                                <li class=" d-flex justify-content-between align-items-center flex-wrap gap-2 list-group-item">
                                    <span class="fw-semibold">{{translate('Total Products reviewed')}}</span>

                                    <span class="font-weight-bold">{{$product->rating()->count()}}</span>
                                </li>
                            </ul>
                        </div>
					 </div>
				</div>
			</div>

			<div class="col-xxl-9 col-xl-8 col-lg-7">
				<div class="card">
					<div class="card-header border-bottom-dashed">
						<div class="d-flex align-items-center">
							<h5 class="card-title mb-0 flex-grow-1">
								{{translate('latest product order')}}
							</h5>
						</div>
					</div>

				     <div class="card-body">
						<div>
							<h5 class="fw-bold mb-3 fs-14">{{translate('New order list')}}</h5>
							<div class="row">
								<div class="col-xxl-4 col-xl-6">
									<div class="card card-animate bg-soft-gray">
                                        <div class="card-body">
                                            <div class="d-flex align-items-start justify-content-between">
                                                <div class="flex-shrink-0">
                                                    <span class="overview-icon">
                                                       <i class="ri-disc-line text-primary"></i>
                                                    </span>
                                                </div>

                                                <div class="text-end">
                                                    <h4 class="fs-22 fw-bold ff-secondary mb-2">
                                                        <span
															class="counter-value" data-target = "{{$product->order->count()}}" >{{$product->order->count()}}
                                                        </span>
                                                    </h4>

                                                    <p class="text-uppercase fw-medium text-muted mb-3">
                                                        {{translate('Total orders')}}
                                                    </p>

                                                    <a href="{{route('seller.product.single.all.order', $product->id)}}" class="d-flex align-items-center justify-content-end gap-1">
                                                        {{translate('View All')}}
                                                        <i class="ri-arrow-right-line"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
									</div>
								</div>

								<div class="col-xxl-4 col-xl-6">
									<div class="card card-animate bg-soft-orange">
                                        <div class="card-body">
                                            <div class="d-flex align-items-start justify-content-between">
                                                <div class="flex-shrink-0">
                                                    <span class="overview-icon">
                                                      <i class="las la-shopping-cart text-danger"></i>
                                                    </span>
                                                </div>

                                                <div class="text-end">
                                                    <h4 class="fs-22 fw-bold ff-secondary mb-2">
                                                        <span
															class="counter-value" data-target = "{{$product->order->where('status', App\Models\Order::PLACED)->count()}}">{{$product->order->where('status', App\Models\Order::PLACED)->count()}}
                                                        </span>
                                                    </h4>

                                                    <p class="text-uppercase fw-medium text-muted mb-3">
                                                       {{translate('Placed orders')}}
                                                    </p>

                                                    <a href="{{route('seller.product.single.placed.order', $product->id)}}" class="d-flex align-items-center justify-content-end gap-1">
                                                        {{translate('View All')}}
                                                        <i class="ri-arrow-right-line"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
									</div>
								</div>

								<div class="col-xxl-4 col-xl-6">
									<div class="card card-animate bg-soft-green">
                                        <div class="card-body">
                                            <div class="d-flex align-items-start justify-content-between">
                                                <div class="flex-shrink-0">
                                                    <span class="overview-icon">
                                                     <i class="las la-wallet text-success"></i>
                                                    </span>
                                                </div>

                                                <div class="text-end">
                                                    <h4 class="fs-22 fw-bold ff-secondary mb-2">
                                                       <span data-target ="{{$product->order->where('status', App\Models\Order::DELIVERED)->count()}}"
															class="counter-value">{{$product->order->where('status', App\Models\Order::DELIVERED)->count()}}
                                                        </span>
                                                    </h4>

                                                    <p class="text-uppercase fw-medium text-muted mb-3">
                                                       {{translate('Delivered orders')}}
                                                    </p>

                                                    <a href="{{route('seller.product.single.delivered.order', $product->id)}}" class="d-flex align-items-center justify-content-end gap-1">
                                                        {{translate('View All')}}
                                                        <i class="ri-arrow-right-line"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
									</div>
								</div>
							</div>
						</div>

						<div class="my-4">
							<h5 class="fw-bold mb-3 fs-14">{{translate('Product Description')}}</h5>

							<div>
								<div class="text-muted border p-3 rounded">
									<h6 class="fs-14">{{translate('Short Description')}}</h6>
									<p>{!!($product->short_description)!!}</p>
								</div>

								<div class="mt-3 text-muted border p-3 rounded">
									<h6 class="fs-14">{{translate('Long Description')}}</h6>
									<div>
										@php echo $product->description @endphp
									</div>
								</div>

								@if($product->warranty_policy)
								<div class="mt-3 text-muted border p-3 rounded">
									<h6 class="fs-14">{{translate('Warranty Policy')}}</h6>
									<div>
										@php echo $product->warranty_policy @endphp
									</div>
								</div>
								@endif
							</div>
						</div>

						<div>
							  <h5 class="fw-bold mb-3 fs-14">{{translate('Product Gallery')}}</h5>

                              <div class="mt-3">
                                <section class="gallery-container">
                                    <div class="row g-3 gallary popup-gallery">
                                        @foreach($product->gallery as $gallery)
                                        <div class="col-md-3 col-6">
                                            <img class="img-fluid img-thumbnail" src="{{show_image(file_path()['product']['gallery']['path'].'/'.$gallery->image)}}" alt="{{$gallery->image}}">
                                        </div>

                                        @endforeach
                                    </div>
                                </section>
                              </div>

						</div>
					 </div>
				</div>
			</div>
		</div>
    </div>
</div>
@endsection
