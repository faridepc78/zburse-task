<?php

use App\Models\Order;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('cart_id');
            $table->string('code',10)->unique();
            $table->enum('status', Order::$statuses)->default(Order::PENDING);
            $table->timestamps();

            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('CASCADE')
                ->onDelete('CASCADE');

            $table->foreign('cart_id')
                ->references('id')
                ->on('carts')
                ->onUpdate('CASCADE')
                ->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
