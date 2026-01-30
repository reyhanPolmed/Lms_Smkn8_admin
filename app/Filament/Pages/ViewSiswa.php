<?php

namespace App\Filament\Pages;


use Illuminate\Support\Facades\Response;
use Illuminate\Support\Str;

use Filament\Pages\Page;
use App\Models\Student;
use App\Models\StudentClass;

class ViewSiswa extends Page
{
    protected string $view = 'filament.pages.view-siswa';

    protected static ?string $title = ' ';

    public $classId;
    // Pastikan import ini ada

    public function downloadCsv()
    {
        // 1. Ambil data siswa (sesuaikan query dengan kebutuhan Anda)
        // Asumsi: $this->students adalah data yang sama dengan yang dikirim ke view
        $data = $this->students;

        $kelas = StudentClass::find($this->classId); 
        
        // B. Buat Slug Nama Kelas (agar spasi jadi strip, huruf kecil semua)
        // Jika kelas tidak ditemukan, default ke 'semua-siswa'
        $namaKelasClean = $kelas ? Str::slug($kelas->name) : 'semua-siswa';

        // 2. Buat nama file
        $fileName = 'daftar-siswa_' . $namaKelasClean . '_' . date('Y-m-d_H-i-s') . '.csv';


        // 3. Define Header CSV
        $headers = [
            "Content-type"        => "text/csv",
            "Content-Disposition" => "attachment; filename=$fileName",
            "Pragma"              => "no-cache",
            "Cache-Control"       => "must-revalidate, post-check=0, pre-check=0",
            "Expires"             => "0"
        ];

        // 4. Define kolom-kolom yang ingin di-export
        $columns = ['ID', 'Nama Lengkap', 'Status', 'Kelas/Tingkat', 'Tanggal Dibuat'];

        // 5. Callback untuk menulis stream
        $callback = function () use ($data, $columns) {
            $file = fopen('php://output', 'w');

            // Tulis Header
            fputcsv($file, $columns);

            // Tulis Data Baris per Baris
            foreach ($data as $row) {
                fputcsv($file, [
                    $row->id,
                    $row->name,
                    $row->status,
                    $row->tingkat->name ?? '-', // Handle relasi null
                    $row->created_at?->format('d-m-Y') ?? '-',
                ]);
            }

            fclose($file);
        };

        // 6. Return Streamed Response
        return response()->stream($callback, 200, $headers);
    }

    public function getBreadcrumbs(): array
    {
        return [
            '/admin/view-kelas' => 'Kelas',
            '/admin/view-siswa?class=' . $this->classId => 'List',
            '' => $this->classId,
        ];
    }
    protected static bool $shouldRegisterNavigation = false;


    public $students;

    public function mount(): void
    {
        // ambil ?class=2 dari URL
        $this->classId = request()->query('class');

        // kalau tidak ada parameter, kosongkan collection biar aman
        if (!$this->classId) {
            $this->students = collect();
            return;
        }

        // query siswa berdasarkan class_level_id
        $this->students = Student::where('class_level_id', $this->classId)
            ->orderBy('name')
            ->get();
    }
}
