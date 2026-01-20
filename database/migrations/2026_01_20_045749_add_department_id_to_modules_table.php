<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('modules', function (Blueprint $table) {

            // 1. Tambah kolom department_id (nullable dulu biar aman)
            $table->foreignId('department_id')
                  ->nullable()
                  ->after('id');

            // 2. Tambah foreign key
            $table->foreign('department_id')
                  ->references('id')
                  ->on('departments')
                  ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('modules', function (Blueprint $table) {

            $table->dropForeign(['department_id']);
            $table->dropColumn('department_id');

        });
    }
};
