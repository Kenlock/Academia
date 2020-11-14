<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuizzesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quizzes', function (Blueprint $table) {
          $table->increments('id');
          $table->integer('instructor_id')->unsigned();
          $table->integer('category_id')->unsigned();
          $table->string('quiz_title');
          $table->string('quiz_slug');
          $table->text('keywords')->nullable();
          $table->string('quiz_image')->nullable();
          $table->string('thumb_image')->nullable();
          $table->string('duration')->nullable();
          $table->decimal('price', 8, 2)->nullable();

          $table->boolean('is_active');
          $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('quizzes');
    }
}
