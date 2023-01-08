<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    protected $guarded =
        [
            'id',
            'created_at',
            'updated_at'
        ];

    protected $fillable =
        [
            'name',
            'slug',
            'price',
            'discount',
            'quantity',
            'status'
        ];

    protected $appends =
        [
            'final_price'
        ];

    const ACTIVE = 'active';
    const INACTIVE = 'inactive';
    const UNAVAILABLE = 'unavailable';
    static array $statuses =
        [
            self::ACTIVE,
            self::INACTIVE,
            self::UNAVAILABLE
        ];

    public function getFinalPriceAttribute()
    {
        if ($this->discount != null)
            return round($this->price - ($this->price * ($this->discount / 100)));

        return $this->price;
    }
}
