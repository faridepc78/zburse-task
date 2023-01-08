<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Item extends Model
{
    protected $table = 'items';

    protected $guarded =
        [
            'id',
            'created_at',
            'updated_at'
        ];

    protected $fillable =
        [
            'product_id',
            'quantity',
            'itemable_type',
            'itemable_id'
        ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id')->withDefault();
    }

    public function itemable(): MorphTo
    {
        return $this->morphTo();
    }
}
