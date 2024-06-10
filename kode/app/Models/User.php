<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'last_name',
        'password',
        'phone',
        'address',
        'image',
        'google_id',
        'status',
        'billing_address',
        'uid'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'address' => 'object',
        'billing_address' => 'object',
    ];


    public function scopeActive($query)
    {
        return $query->where('status', '1');
    }


    public function scopeBanned($query)
    {
        return $query->where('status', '0');
    }

    public function physicalProductOrder()
    {
        return $this->hasMany(Order::class, 'customer_id')->where('order_type', 102);
    }

    public function digitalProductOrder()
    {
        return $this->hasMany(Order::class, 'customer_id')->where('order_type', 101);;
    }

    public function order()
    {
        return $this->hasMany(Order::class, 'customer_id','id')->orderBy('id', 'DESC');
    }

    public function transaction()
    {
        return $this->hasMany(Transaction::class, 'user_id');
    }

    public function ticket()
    {
        return $this->hasMany(SupportTicket::class, 'user_id');
    }

    public function wishlist()
    {
        return $this->hasMany(WishList::class, 'customer_id')->orderBy('id', 'DESC')->with('product', 'product.brand', 'product.stock');
    }

    public function reviews()
    {
        return $this->hasMany(ProductRating::class, 'user_id')->with('product');
    }

    public function following() {
        return $this->belongsToMany(User::class, 'followers', 'follower_id', 'following_id');
    }

    public function follower()
    {
        return $this->hasMany(Follower::class, 'following_id');
    }
    protected static function booted()
    {
        static::creating(function ($user) {
            $user->uid = str_unique();
        });
    }



    public function scopeSearch($q)
    {
        return $q->when(request()->input('search'),function($q){

             $searchBy = '%'. request()->input('search').'%';
             return  $q->where('name','like',$searchBy)
                        ->orWhere('email',request()->input('search'))
                        ->orWhere('username',request()->input('search'))
                        ->orWhere('phone',request()->input('search'));
            });
    }



}
