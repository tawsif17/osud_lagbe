<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\OrderStatus;
use Carbon\Carbon;

class SellerProductOrderController extends Controller
{
    public function __construct()
    {
        $this->middleware(['permissions:view_order']);
    }

    public function index()
    {
        $title = "Seller orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->search()->date()->sellerOrder()->physicalOrder()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function placed()
    {
        $title = "Seller placed orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->sellerOrder()->search()->date()->physicalOrder()->placed()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function confirmed()
    {
        $title = "Seller confirmed orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->sellerOrder()->physicalOrder()->search()->date()->confirmed()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function processing()
    {
        $title = "Seller processing orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->sellerOrder()->physicalOrder()->search()->date()->processing()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function shipped()
    {
        $title = "Seller shipped orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->sellerOrder()->physicalOrder()->shipped()->search()->date()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function delivered()
    {
        $title = "Seller delivered orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->sellerOrder()->physicalOrder()->delivered()->search()->date()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function cancel()
    {
        $title = "Seller cancel orders";
        $orders = Order::with(['orderDetails','orderDetails.product','customer','shipping'])->sellerOrder()->physicalOrder()->cancel()->search()->date()->orderBy('id', 'DESC')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders'));
    }

    public function details($id)
    {
        $title = "Seller order details";
        $order = Order::sellerOrder()->physicalOrder()->where('id', $id)->firstOrFail();
        $orderDeatils = OrderDetails::with(['product', 'product.seller'])->where('order_id', $order->id)->sellerOrderProduct()->get();
        $orderStatus  = OrderStatus::where('order_id', $id)->latest()->get();

        return view('admin.order.details', compact('title', 'order', 'orderDeatils','orderStatus'));
    }

    public function search(Request $request, $scope)
    {
        $request->validate([
            'searchFilter'=>'required',
        ]);

        if($request->option_value == 'Select Menu'){
    
            return back()->with('error',translate("Please Select A Value Form Select Box"));
        }

        $search = $request->searchFilter;
        $title = "Seller order search by -" . $search;
        $orders = Order::sellerOrder()->physicalOrder();

        if($request->option_value == 'order_number'){
            $orders->Where('order_id', 'like', "%$search%");
        }
        if($request->option_value == 'customer'){
            $orders->whereHas('customer', function($q) use ($search){
                    $q->where('name','like',"%$search%");
                });
        }
        if($request->option_value == 'Amount'){
            $orders->Where('amount', 'like', "%$search%");
        }

        if ($scope == 'placed') {
            $orders = $orders->placed();
        }elseif($scope == 'confirmed'){
            $orders = $orders->confirmed();
        }elseif($scope == 'processing'){
            $orders = $orders->processing();
        }elseif($scope == 'shipped'){
            $orders = $orders->shipped();
        }elseif($scope == 'delivered'){
            $orders = $orders->delivered();
        }elseif($scope == 'cancel'){
            $orders = $orders->cancel();
        }
        $orders = $orders->orderBy('id','desc')->paginate(paginate_number());
        return view('admin.seller_order.index', compact('title', 'orders', 'search'));
    }

    public function dateSearch(Request $request, $scope)
    {
        $this->validate($request, [
            'date' => 'required',
        ]);
        $searchDate = explode('-',$request->date);
        $firstDate = $searchDate[0];
        $lastDate = $searchDate[1];
        $matchDate = "/\d{2}\/\d{2}\/\d{4}/";
        if ($firstDate && !preg_match($matchDate,$firstDate)) {
            return back()->with('error',translate("Invalid order search date format"));
        }
        if ($lastDate && !preg_match($matchDate,$lastDate)) {
            return back()->with('error',translate("Invalid order search date format"));
        }
        if ($firstDate) {
            $orders = Order::sellerOrder()->physicalOrder()->whereDate('created_at',Carbon::parse($firstDate));
        }
        if($lastDate){
            $orders = Order::sellerOrder()->physicalOrder()->whereDate('created_at','>=',Carbon::parse($firstDate))->whereDate('created_at','<=',Carbon::parse($lastDate));
        }
        if ($scope == 'placed') {
            $orders = $orders->placed();
        }elseif($scope == 'confirmed'){
            $orders = $orders->confirmed();
        }elseif($scope == 'processing'){
            $orders = $orders->processing();
        }elseif($scope == 'shipped'){
            $orders = $orders->shipped();
        }elseif($scope == 'delivered'){
            $orders = $orders->delivered();
        }elseif($scope == 'cancel'){
            $orders = $orders->cancel();
        }
        $orders = $orders->orderBy('id','desc')->paginate(paginate_number());
        $searchDate = $request->date;
        $title = 'Orders search by ' . $searchDate;
        return view('admin.seller_order.index', compact('title','orders','searchDate'));
    }
}
