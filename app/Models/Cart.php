<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class Cart extends Model
{
    protected $table = 'carts';

    protected $guarded =
        [
            'id',
            'created_at',
            'updated_at'
        ];

    protected $fillable =
        [
            'user_id',
            'status'
        ];

    protected $appends =
        [
            'total_price'
        ];

    const IN_CART = 'in_cart';
    const IN_ORDER = 'in_order';

    static array $statuses =
        [
            self::IN_CART,
            self::IN_ORDER
        ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id')->withDefault();
    }

    public function items(): MorphMany
    {
        return $this->morphMany(Item::class, 'itemable');
    }

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'items',
            'itemable_id', 'product_id')
            ->withPivot('quantity');
    }

    public function getTotalPriceAttribute()
    {
        return $this->products->sum(function ($products) {
            return $products->pivot->quantity * $products->final_price;
        });
    }
}
