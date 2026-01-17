<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('student_classes', function (Blueprint $table) {

            // Jika ada foreign key
            $table->dropForeign(['department_id']);

            // Hapus kolom
            $table->dropColumn('department_id');
        });
    }

    public function down()
    {
        Schema::table('student_classes', function (Blueprint $table) {

            $table->foreignId('department_id')
                  ->nullable()
                  ->constrained()
                  ->cascadeOnDelete();
        });
    }
};
