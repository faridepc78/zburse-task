<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class Order extends Model
{
    protected $table = 'orders';

    protected $guarded =
        [
            'id',
            'created_at',
            'updated_at'
        ];

    protected $fillable =
        [
            'user_id',
            'cart_id',
            'code',
            'status'
        ];

    protected $appends =
        [
            'total_price'
        ];

    const PENDING = 'pending';
    const REJECTED = 'rejected';
    const AWAITING_PAYMENT = 'awaiting_payment';
    const PAYMENT_CONFIRMATION = 'payment_confirmation';
    const PREPARATION = 'preparation';
    const SUBMIT = 'submit';

    static array $statuses =
        [
            self::PENDING,
            self::REJECTED,
            self::AWAITING_PAYMENT,
            self::PAYMENT_CONFIRMATION,
            self::PREPARATION,
            self::SUBMIT
        ];

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'items',
            'itemable_id', 'product_id')
            ->withPivot('quantity');
    }

    public function decrementProductsQuantity()
    {
        return $this->products->sum(function ($products) {
            return $products->decrement('quantity');
        });
    }

    public function getTotalPriceAttribute()
    {
        return $this->products->sum(function ($products) {
            return $products->pivot->quantity * $products->final_price;
        });
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id')->withDefault();
    }

    public function cart(): BelongsTo
    {
        return $this->belongsTo(Cart::class, 'cart_id')->withDefault();
    }

    public function items(): MorphMany
    {
        return $this->morphMany(Item::class, 'itemable');
    }
}
