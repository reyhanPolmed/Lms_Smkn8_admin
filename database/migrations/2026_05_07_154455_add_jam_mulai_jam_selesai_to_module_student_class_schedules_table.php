<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('module_student_class_schedules', function (Blueprint $table) {
            if (!Schema::hasColumn('module_student_class_schedules', 'jam_mulai')) {
               $table->time('jam_mulai')->nullable();
            }
            if (!Schema::hasColumn('module_student_class_schedules', 'jam_selesai')) {
               $table->time('jam_selesai')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('module_student_class_schedules', function (Blueprint $table) {
            if (Schema::hasColumn('module_student_class_schedules', 'jam_mulai')) {
                $table->dropColumn('jam_mulai');
            }
            if (Schema::hasColumn('module_student_class_schedules', 'jam_selesai')) {
                $table->dropColumn('jam_selesai');
            }
        });
    }
};
