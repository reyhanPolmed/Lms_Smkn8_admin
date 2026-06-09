<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // First, update the new columns with data from rentang_jam_id via rentang_jams table
        DB::table('module_student_class_schedules')
            ->join('rentang_jams', 'module_student_class_schedules.rentang_jam_id', '=', 'rentang_jams.id')
            ->update([
                'module_student_class_schedules.jam_mulai' => DB::raw('rentang_jams.jam_mulai'),
                'module_student_class_schedules.jam_selesai' => DB::raw('rentang_jams.jam_selesai'),
            ]);

        // Now drop the foreign key constraint and the column
        Schema::table('module_student_class_schedules', function (Blueprint $table) {
            $table->dropForeign('module_student_class_schedules_ibfk_3');
            $table->dropColumn('rentang_jam_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Add back the column and foreign key (note: data in jam_mulai and jam_selesai will be lost)
        Schema::table('module_student_class_schedules', function (Blueprint $table) {
            $table->foreignId('rentang_jam_id')->constrained()->onDelete('cascade');
        });

        // Note: We cannot recover the rentang_jam_id from the time columns without a lookup table,
        // so we leave the new columns as is (they will be orphaned). In a real rollback, you might
        // want to map the times back to the nearest rentang_jam, but for simplicity we skip.
    }
};
