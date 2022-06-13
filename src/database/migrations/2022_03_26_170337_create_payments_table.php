<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->string('paypal_id');
            $table->string('intent')->nullable();
            $table->string('status')->nullable();
            $table->decimal('amount', 10, 2);
            $table->string('currency_code')->nullable();
            $table->dateTime('payment_on');
            $table->string('payer_name');
            $table->string('payer_email');
            $table->string('payer_country_code');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();
        
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
