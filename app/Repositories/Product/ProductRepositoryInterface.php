<?php

namespace App\Repositories\Product;

use App\Repositories\Contracts\BaseRepositoryInterface;

interface ProductRepositoryInterface extends BaseRepositoryInterface
{
    public function getAll($status = null);
}
