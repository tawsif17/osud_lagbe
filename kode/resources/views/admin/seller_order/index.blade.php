@extends('admin.layouts.app')
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
                        {{translate('Home')}}
                    </a></li>
                    <li class="breadcrumb-item active">
                        {{translate("Seller Orders")}}
                    </li>
                </ol>
            </div>
        </div>

        <div class="card" id="orderList">
            <div class="card-header border-0">
                <div class="row g-4 align-items-center">
                    <div class="col-sm">
                        <div>
                            <h5 class="card-title mb-0">
                                {{translate('Order List')}}
                            </h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body  border border-dashed border-end-0 border-start-0">
                <form action="{{route(Route::currentRouteName(),Route::current()->parameters())}}" method="get">
                    <div class="row g-3">
                        <div class="col-xl-4 col-sm-6">
                            <div class="search-box">
                                <input type="text" name="search" value="{{request()->input('search')}}" class="form-control search"
                                    placeholder="Search for order ID, customer">
                                <i class="ri-search-line search-icon"></i>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="search-box">
                                <input type="text" id="datePicker" name="date" value="{{request()->input('date')}}" class="form-control search"
                                    placeholder="{{translate('Search by date')}}">
                                <i class="ri-time-line search-icon"></i>

                            </div>
                        </div>

                        <div class="col-xl-2 col-sm-3 col-6">
                            <div>
                                <button type="submit" class="btn btn-primary w-100 waves ripple-light"> <i
                                        class="ri-equalizer-fill me-1 align-bottom"></i>
                                    {{translate('Search')}}
                                </button>
                            </div>
                        </div>

                        <div class="col-xl-2 col-sm-3 col-6">
                            <div>
                                <a href="{{route(Route::currentRouteName(),Route::current()->parameters())}}" class="btn btn-danger w-100 waves ripple-light"> <i
                                        class="ri-refresh-line me-1 align-bottom"></i>
                                    {{translate('Reset')}}
                                </a>
                            </div>
                        </div>
                    </div>

                </form>
            </div>

            <div class="card-body pt-0">
                    <ul class="nav nav-tabs nav-tabs-custom nav-primary mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link {{request()->routeIs("admin.seller.order.index") ? "active" :"" }} All py-3"  id="All"
                                href="{{route('admin.seller.order.index')}}" >
                                <i class="ri-luggage-cart-line me-1 align-bottom"></i>
                                {{translate('All
                                Orders')}}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{request()->routeIs("admin.seller.order.placed") ? "active" :""}}  Placed py-3"  id="Placed"
                                href="{{route('admin.seller.order.placed')}}" >
                                <i class="ri-map-pin-line me-1 align-bottom"></i>
                                {{translate('Placed
                                Orders')}}


                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{request()->routeIs("admin.seller.order.confirmed") ? "active" :""}} Confirmed py-3"  id="Confirmed"
                                href="{{route('admin.seller.order.confirmed')}}" >
                                <i class="ri-rocket-line me-1 align-bottom"></i>
                                {{translate("Confirmed Order")}}

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link Processing {{request()->routeIs("admin.seller.order.processing") ? "active" :""}}   py-3"  id="Processing"
                                href="{{route('admin.seller.order.processing')}}" >
                                <i class="ri-refresh-line me-1 align-bottom"></i>
                                {{translate('Processing')}}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link Processing {{request()->routeIs("admin.seller.order.shipped") ? "active" :""}}   py-3"  id="shipped"
                                href="{{route('admin.seller.order.shipped')}}" >
                                <i class="ri-ship-line me-1 align-bottom"></i>
                                {{translate('Shipped')}}
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link py-3 {{request()->routeIs("admin.seller.order.delivered") ? "active" :""}}   Delivered"  id="Delivered"
                                href="{{route('admin.seller.order.delivered')}}">
                                <i class="ri-checkbox-circle-line me-1 align-bottom"></i>

                                    {{translate('Delivered')}}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{request()->routeIs("admin.seller.order.cancel") ? "active" :""}}   py-3 Returns"  id="Returns"
                                href="{{route('admin.seller.order.cancel')}}">
                                <i class="ri-close-circle-line me-1 align-bottom"></i>

                                {{translate('Canceled Order')}}
                            </a>
                        </li>
                    </ul>

                    <div class="table-responsive table-card">
                        <table class="table table-hover table-nowrap align-middle mb-0" >
                            <thead class="text-muted table-light">
                                <tr class="text-uppercase">
                                    <th>
                                        {{translate(
                                            "Order ID"
                                        )}}
                                    </th>
                                    <th>
                                        {{translate('Qty')}}
                                    </th>
                                    <th  >{{translate('Time')}}
                                    </th>
                                    <th>
                                        {{translate('Customer Info')}}
                                    </th>
                                    <th>
                                        {{translate('Product Details')}}
                                    </th>
                                    <th >
                                        {{translate('Amount')}}
                                    </th>
                                    <th >
                                        {{translate('Delivery')}}
                                    </th>
                                    <th >
                                        {{translate('Action')}}
                                    </th>
                                </tr>
                            </thead>

                            <tbody class="list form-check-all">
                                    @forelse($orders as $order)
                                        <tr>
                                            <td data-label="{{translate('Order Number')}}">
                       
                                                <a  href="{{route('admin.seller.order.details', $order->id)}}" class="text-primary fw-bold" data-bs-toggle="tooltip" data-bs-placement="top" title="Order Number">
                                                    {{$order->order_id}}
                                                </a>
                                            </td>
                                            <td data-label="{{translate('Qty')}}">
                                                <span>{{$order->qty}}</span><br>
                                            </td>
                                            <td data-label="{{translate('Time')}}">
                                                <span class="fw-bold">{{diff_for_humans($order->created_at)}}</span><br>
                                                {{get_date_time($order->created_at)}}
                                            </td>

                                            <td data-label="{{translate('Customer Info')}}" class="text-align-left">
                                                <span>{{translate("Name")}}: {{@$order->customer->name ?? @$order->billing_information->first_name}}</span><br>
                                                <span>{{translate('Phone')}}: {{@$order->customer->phone ??@$order->billing_information->phone}}</span> <br>
                                                @if($order->customer_id)
                                                    <a href="{{route('admin.customer.details', $order->customer_id)}}" class="fw-bold text-dark">
                                                        <span>
                                                            {{translate('Email')}}
                                                            : {{@$order->customer->email ?? "N\A"}}</span>
                                                    </a>
                                                @else
                                                <span>
                                                    {{translate('Email')}}
                                                    : {{@$order->billing_information->email ?? "N\A"}}</span>
                                                @endif
                                                <br>
                                                <span>
                                                    {{translate('City')}}
                                                    : {{@$order->billing_information->city ?? "N\A"}}</span> <br>
                                                <span>
                                                    {{translate('Address')}}
                                                    : {{@$order->billing_information->address ? limit_words(@$order->billing_information->address,4) : "N\A"}}
                                                </span> <br>
                                                <span class="badge bg-primary">{{translate("Shipping Method")}}: {{@$order->shipping->method->name ?? "N\A"}}</span> <br>
                                            </td>

                                            <td data-label="{{translate('Product Details')}}" class="tex-align-left">

                                                <button data-details ="{{$order->orderDetails}}" class="ms-2  order-btn btn btn-info btn-sm custom-toggle active" data-bs-toggle="modal" id="order-btn" data-bs-target="#orderDetails">{{translate('view All')}} ({{$order->orderDetails->count()}})</button>

                                            </td>

                                            <td data-label="{{translate('Amount')}}">
                                                <span class="fw-bold">
                                                    {{(show_currency())}}{{round(short_amount($order->amount))}}</span><br>
                                                    @if($order->payment_status == App\Models\Order::UNPAID)
                                                           <span class="badge badge-soft-danger">{{translate('Unpaid')}}</span>
                                                        @elseif($order->payment_status == App\Models\Order::PAID)
                                                           <span class="badge badge-soft-success">{{translate('Paid')}}</span>
                                                    @endif
                                            </td>

                                            <td data-label="{{translate('Delivery Status')}}">
                                                @if($order->status == App\Models\Order::PLACED)
                                                <span class="badge badge-soft-primary">{{translate('Placed')}}</span>
                                                @elseif($order->status == App\Models\Order::CONFIRMED)
                                                <span class="badge badge-soft-info">{{translate('Confirmed')}}</span>
                                                @elseif($order->status == App\Models\Order::PROCESSING)
                                                <span class="badge badge-soft-secondary">{{translate('Processing')}}</span>
                                                @elseif($order->status == App\Models\Order::SHIPPED)
                                                <span class="badge badge-soft-warning">{{translate('Shipped')}}</span>
                                                @elseif($order->status == App\Models\Order::DELIVERED)
                                                <span class="badge badge-soft-success">{{translate('Delivered')}}</span>
                                                @elseif($order->status == App\Models\Order::CANCEL)
                                                <span class="badge badge-soft-danger">{{translate('Cancel')}}</span>
                                                @endif
                                            </td>

                                            <td data-label="{{translate('Action')}}">
                                                <div class="hstack justify-content-center gap-3">
                                                    <a title="Details" data-bs-toggle="tooltip" data-bs-placement="top"  href="{{route('admin.seller.order.details', $order->id)}}"
                                                        class="link-info fs-18"><i class="ri-list-check"></i></a>
                                                    <a  title="Print" data-bs-toggle="tooltip" data-bs-placement="top" href="{{route('admin.inhouse.order.print', [$order->id, 'seller'])}}"
                                                        class="link-success fs-18">
                                                        <i class="ri-printer-line"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td class="border-bottom-0" colspan="100">
                                                @include('admin.partials.not_found')
                                            </td>
                                        </tr>
                                    @endforelse
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-end mt-4">
                        {{$orders->appends(request()->all())->links()}}
                    </div>
            </div>
        </div>
    </div>
</div>



<div  class="modal fade" id="orderDetails" tabindex="-1" aria-labelledby="orderDetails" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered  modal-dialog-scrollable">
        <div class="modal-content">
			<div class="modal-header bg-light p-3">
				<h5 class="modal-title" >{{translate('Product Info')}}
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" id="close-modal"></button>
			</div>

	            <div class="modal-body">
                    <div class="card-body">
                        <div class="table-responsive table-card">
                            <table class="table table-hover table-centered align-middle table-nowrap">
                                <tbody id="product-info">

                                </tbody>
                            </table>
                        </div>

                    </div>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-md btn-danger " data-bs-dismiss="modal">{{translate('Cancel')}}</button>
	            </div>

        </div>
    </div>
</div>


@endsection

@push('script-push')
<script>
	(function($){
       	"use strict";

        $('.order-btn').on('click', function(){
            var modal = $('#orderDetails');
            var order_details = $(this).attr('data-details')

            order_details =JSON.parse(order_details);
            var html = ''
            for(var i  in order_details ){

                if(order_details[i].product){
                var url =  "{{route('product.details',[":slug",":id"])}}"
                            url = (url.replace(':slug',convertSlug(order_details[i].product.name))).replace(':id', order_details[i].product.id)
                html += `  <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm bg-light rounded p-1 me-2">
                                            <img onerror="this.onerror=null;this.src='{{route('default.image','200x200')}}';" src="{{ asset('/assets/images/backend/product/featured')}}/${order_details[i].product.featured_image}" alt="${order_details[i].product.featured_image}" class="img-fluid d-block">
                                        </div>
                                        <div>
                                            <h5 class="fs-14 my-1"><a href="${url}" class="text-reset">${order_details[i].product.name}</a></h5>
                                            <span class="text-muted">
                                            </span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5 class="fs-14 my-1 fw-normal">
                                        <span class='badge badge-soft-info'> ${order_details[i].attribute} </span>
                                    </h5>
                                    <span class="text-muted">
                                        {{translate("Attribute")}}
                                    </span>
                                </td>

                                <td>
                                    <h5 class="fs-14 my-1 fw-normal">{{show_currency()}}${Math.round(order_details[i].total_price)} </h5>
                                    <span class="text-muted">{{translate('Amount')}}</span>
                                </td>
                            </tr>`
                        }
            }
                $('#product-info').html(html)
            modal.modal('show');
        });

        //convert string to slug start
        function convertSlug(Text) {
            return Text.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
        }


	})(jQuery);
</script>
@endpush
