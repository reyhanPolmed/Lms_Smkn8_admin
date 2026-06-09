<?php

namespace App\Support;

use App\Models\User;
use Illuminate\Http\Client\ConnectionException;
use Illuminate\Http\Client\RequestException;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use RuntimeException;

class TeacherAuthCredentialSync
{
    public static function sync(User $user, ?string $plainPassword = null): void
    {
        if (! filled($user->email)) {
            return;
        }

        try {
            Http::timeout(10)
                ->withHeaders([
                    'X-Internal-Auth-Secret' => self::resolveInternalSecret(),
                    'Accept' => 'application/json',
                ])
                ->post(self::resolveBackendUrl() . '/api/internal/teacher-credentials/sync', [
                    'userId' => (string) $user->id,
                    'email' => Str::lower((string) $user->email),
                    'password' => $plainPassword,
                ])
                ->throw();
        } catch (ConnectionException|RequestException $exception) {
            throw new RuntimeException('Gagal sinkronisasi credential login guru ke backend auth service.', previous: $exception);
        }
    }

    private static function resolveBackendUrl(): string
    {
        return rtrim((string) (env('AKARA_BACKEND_URL') ?: 'http://127.0.0.1:3001'), '/');
    }

    private static function resolveInternalSecret(): string
    {
        $secret = (string) env('AKARA_INTERNAL_AUTH_SECRET', '');

        if ($secret !== '') {
            return $secret;
        }

        $backendEnvPath = base_path('../backend/.env');

        if (is_file($backendEnvPath)) {
            $contents = file_get_contents($backendEnvPath) ?: '';

            if (preg_match('/^BETTER_AUTH_SECRET=(.*)$/m', $contents, $matches) === 1) {
                return trim($matches[1], " \t\n\r\0\x0B\"'");
            }
        }

        throw new RuntimeException('BETTER_AUTH_SECRET backend tidak ditemukan untuk sinkronisasi credential guru.');
    }
}
