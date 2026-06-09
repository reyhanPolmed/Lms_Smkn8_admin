<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (DB::getDriverName() !== 'pgsql') {
            return;
        }

        // The backend Prisma migration is the database source of truth.
        // This migration only bootstraps an empty shared PostgreSQL database.
        if (Schema::hasTable('users')) {
            return;
        }

        $schemaPath = base_path('../backend/prisma/migrations/20260428224500_init/migration.sql');

        if (! is_file($schemaPath)) {
            throw new RuntimeException("Backend Prisma schema SQL not found: {$schemaPath}");
        }

        DB::unprepared(file_get_contents($schemaPath));
    }

    public function down(): void
    {
        // Rollbacks for the shared backend database are owned by Prisma.
    }
};
