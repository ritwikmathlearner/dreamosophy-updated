<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddBioInterestProfilePicToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->text('bio')->default(null)->nullable();
            $table->string('interest')->default(null)->nullable();
            $table->string('profile_pic')->default(null)->nullable();
            $table->string('likes')->default(null)->nullable();
            $table->string('dislikes')->default(null)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('bio');
            $table->dropColumn('interest');
            $table->dropColumn('profile_pic');
            $table->dropColumn('likes');
            $table->dropColumn('dislikes');
        });
    }
}
