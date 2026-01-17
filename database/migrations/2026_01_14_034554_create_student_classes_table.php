<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('student_classes', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('level');
            $table->timestamps();
                        // Jika ada foreign key
            $table->dropForeign(['department_id']);

            // Hapus kolom
            $table->dropColumn('department_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('student_classes');
    }
};
