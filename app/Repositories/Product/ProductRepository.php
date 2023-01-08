<?php

namespace App\Repositories\Product;

use App\Models\Product;
use App\Repositories\Contracts\BaseRepository;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

class ProductRepository extends BaseRepository implements ProductRepositoryInterface
{
    public Model $model;

    public function __construct(Product $model)
    {
        $this->model = $model;
    }

    public function getAll($status = null): Collection|array
    {
        if ($status != null)
            return $this->model::query()
                ->where('status', '=', $status)
                ->get();
        else
            return $this->all();
    }
}
