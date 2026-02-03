<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use App\Models\Tingkat;

class StudentsPerTingkatChart extends ChartWidget
{
    protected  ?string $heading = 'Distribusi Siswa per Tingkat';

    // Memberikan deskripsi di bawah heading untuk konteks tambahan
    protected  ?string $description = 'Visualisasi jumlah siswa aktif berdasarkan jenjang kelas.';

    protected  string $color = 'info';

    protected int | string | array $columnSpan = 'full';

    protected  ?string $maxHeight = '400px';

    // Menambahkan filter (Contoh: Filter berdasarkan status atau tahun ajaran jika ada)

    protected function getType(): string
    {
        return 'bar';
    }

    protected function getData(): array
    {
        $tingkats = Tingkat::withCount('students')->orderBy('name')->get();

        return [
            'datasets' => [
                [
                    'label' => 'Total Siswa',
                    'data' => $tingkats->pluck('students_count')->toArray(),
                    'backgroundColor' => [
                        'rgba(99, 102, 241, 0.8)',
                        'rgba(129, 140, 248, 0.8)',
                        'rgba(165, 180, 252, 0.8)',
                        'rgba(199, 210, 254, 0.8)',
                        'rgba(79, 70, 229, 0.8)',
                    ],
                    'borderRadius' => 6,
                    // Hapus barThickness statis agar dia bisa fleksibel tapi tetap terkontrol
                    // 'barThickness' => 42, 
                ],
            ],
            'labels' => $tingkats->pluck('name')->toArray(),
        ];
    }

    protected function getOptions(): array
    {
        return [
            'responsive' => true,
            'maintainAspectRatio' => false,
            'datasets' => [
                'bar' => [
                    // Gunakan persentase agar bar melebar mengikuti ruang yang ada
                    'barPercentage' => 0.8, // Mengisi 80% dari kategori
                    'categoryPercentage' => 0.9, // Memberi jarak tipis antar grup bar
                ],
            ],
            'scales' => [
                'x' => [
                    'grid' => ['display' => false],
                    'ticks' => [
                        'autoSkip' => false, // Paksa semua label muncul agar bar tidak tersembunyi
                    ],
                ],
                'y' => [
                    'beginAtZero' => true,
                    'ticks' => ['precision' => 0],
                ],
            ],
            // ... (opsi lainnya tetap sama)
        ];
    }
}
