<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class PaymentLog extends Model
{
    use HasFactory;

    const PENDING = 1;
    const SUCCESS = 2;
    const CANCEL = 3;

    protected $fillable = [
    	'order_id',
    	'user_id',
    	'method_id',
    	'payment_id',
    	'amount',
        'charge',
        'rate',
    	'final_amount',
    	'trx_number',
    	'status',
        'uid'
    ];

    protected static function booted()
    {
        static::creating(function ($paymentLog) {
            $paymentLog->uid = str_unique();
        });
    }

    public function paymentGateway()
    {
    	return $this->belongsTo(PaymentMethod::class,'method_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }
    
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function scopeApproved($query)
    {
        return $query->where('status', self::SUCCESS);
    }

    public function scopePending($query)
    {
        return $query->where('status', self::PENDING);
    }

    public function scopeCancel($query)
    {
        return $query->where('status', self::CANCEL);
    }


    public function scopeSearch($q)
    {
        return $q->when(request()->input('search'),function($q){
            $searchBy = '%'. request()->input('search').'%';
            return $q->whereHas('paymentGateway',function($q) use($searchBy){
                        return $q->where('name','like',$searchBy);
                      })->orWhereHas('user',function($q) use($searchBy){
                        return $q->where('name','like',$searchBy)
                                  ->orWhere('email','like',$searchBy)
                                  ->orWhere('username','like',$searchBy);
                      });

            });
    }
    
   /**
     * Date Filter
     *
     * @param Builder $query
     * @param string $column
     * @return Builder
     */
    public function scopeDate(Builder $query, string $column = 'created_at') : Builder {

        if (!request()->date) {
            return $query;
        }
        $dateRangeString             = request()->date;
        $start_date                  = $dateRangeString;
        $end_date                    = $dateRangeString;
        if (strpos($dateRangeString, ' to ') !== false) {
            list($start_date, $end_date) = explode(" to ", $dateRangeString);
        } 

        return $query->where(function ($query) use ($start_date, $end_date ,$column ) {
            $query->whereBetween($column , [$start_date, $end_date])
                ->orWhereDate($column , $start_date)
                ->orWhereDate($column , $end_date);
        });

    }
}
