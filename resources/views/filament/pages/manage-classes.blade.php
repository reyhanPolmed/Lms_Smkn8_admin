<x-filament::page>

    @php
    // Mengambil data dari model yang dikirim (misal: $department)
    $record = $department;
    @endphp

    {{-- ================= HEADER ================= --}}
    {{-- ================= FILTER BAR ================= --}}

    {{-- Menggunakan w-full untuk memastikan grid mengambil seluruh lebar --}}
    <div class="flex lg:flex-row flex-col gap-[25px]">

        {{-- ============ LEFT (Department Info) ============ --}}
        <div class="flex flex-col gap-4 w-[390px]">
            <x-filament::section>
                <div class="flex items-center gap-2 mb-6">
                    <div class="flex items-center justify-center w-8 h-8 rounded-full bg-blue-100">
                        <svg class="w-5 h-5 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v2h8v-2zM2 8a2 2 0 11-4 0 2 2 0 014 0zM6 15a4 4 0 00-8 0v2h8v-2z" />
                        </svg>
                    </div>
                    <h2 class="text-sm font-bold text-gray-900">
                        {{ __('Profil Kursus') }}
                    </h2>
                </div>

                <div class="flex flex-col mb-4">
                    <div class="flex flex-col items-start gap-5 p-4 border border-gray-200 rounded-xl bg-white shadow-sm">
                        <h3 class="text-[10px] font-semibold text-gray-600 uppercase tracking-wide">
                            {{ __('Foto Kursus') }}
                        </h3>
                        {{-- 1. IMAGE CONTAINER --}}
                        <div class="relative shrink-0 group">
                            <div class="w-[200px] h-[160px] rounded-xl overflow-hidden ring-1 ring-gray-900/5 bg-gray-50 flex items-center justify-center">
                                @if($record->foto)
                                <img src="{{ url('/file/' . $record->foto) }}"
                                    class="w-full h-full object-cover border border-gray-400 rounded-xl"
                                    alt="Department Icon" />
                                @else
                                <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                </svg>
                                @endif
                            </div>

                            {{-- Loading Indicator Overlay --}}
                            <div wire:loading wire:target="foto" class="absolute inset-0 flex items-center justify-center bg-white/80 rounded-xl z-10">
                                <svg class="animate-spin h-6 w-6 text-primary-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                            </div>
                        </div>

                        {{-- 2. ACTION & INFO --}}
                        <div class="flex flex-col justify-center">
                            <div class="flex flex-col gap-3">
                                <input type="file"
                                    id="fotoUpload"
                                    wire:model="foto"
                                    class="hidden"
                                    accept="image/png, image/jpeg, image/jpg" />
                                <div class="text-[10px]">
                                    <x-filament::button
                                        size="xs"
                                        color="info"
                                        class="text-[10px]"
                                        onclick="document.getElementById('fotoUpload').click()">
                                        {{ __('Ganti Gambar') }}
                                    </x-filament::button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="space-y-6 w-full">
                    <div class="flex flex-col items-start gap-5 p-4 border border-gray-200 rounded-xl bg-white shadow-sm">

                        <div class="flex flex-col gap-2 w-full">
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Nama Kursus') }}
                            </p>

                            <input
                                type="text"
                                wire:model="name"
                                class="block text-xs w-full rounded-lg outline-0 border border-slate-200 bg-gray-50 focus:shadow-slate-400 px-3 py-2.5 text-sm text-gray-900"
                                placeholder="Nama Kursus..." />
                        </div>

                        <div class="flex flex-col gap-2 w-full">
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Deskripsi') }}
                            </p>

                            <textarea
                                rows="4"
                                wire:model="description"
                                class="block w-full rounded-lg border border-slate-200 outline-0 text-xs focus:shadow-slate-400 p-4"
                                placeholder="Tulis deskripsi lengkap di sini..."></textarea>
                        </div>

                        <div class="text-xs">
                            <x-filament::button
                                size="xs"
                                color="info"
                                class="text-[10px]"
                                wire:click="save">
                                {{ __('Simpan Perubahan') }}
                            </x-filament::button>
                        </div>

                    </div>

                    <!-- nama guru yang masuk -->
                    <div class="flex flex-col items-start gap-5 p-4 border border-gray-200 rounded-xl bg-white shadow-sm">

                        {{-- HEADER --}}
                        <div class="flex flex-col gap-2 w-full">
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Guru yang Masuk') }}
                            </p>
                        </div>

                        {{-- FORM TAMBAH GURU --}}
                        <div class="flex gap-2 w-full">
                            <select
                                wire:model="teacher_id"
                                class="w-full text-xs border rounded-lg px-3 py-2">

                                <option value="">-- Pilih Guru --</option>

                                @foreach($allTeachers as $teacher)
                                <option value="{{ $teacher->id }}">
                                    {{ $teacher->name }} — {{ $teacher->nip }}
                                </option>
                                @endforeach
                            </select>

                            <x-filament::button
                                size="sm"
                                color="primary"
                                wire:click="attachTeacher">
                                +
                            </x-filament::button>
                        </div>

                        {{-- LIST GURU YANG SUDAH MASUK --}}
                        <div class="w-full space-y-2">

                            @forelse($department->teachers as $teacher)
                            <div class="flex items-center justify-between p-2 border rounded-lg">

                                <div class="flex items-center gap-3">
                                    <img
                                        src="{{ $teacher->foto ? url('/file/' . $teacher->foto) : '/placeholder.svg' }}"
                                        class="w-8 h-8 rounded-full object-cover">

                                    <div>
                                        <p class="text-xs font-semibold">
                                            {{ $teacher->name }}
                                        </p>
                                        <p class="text-[10px] text-gray-500">
                                            NIP. {{ $teacher->nip }}
                                        </p>
                                    </div>
                                </div>

                                <button
                                    wire:click="detachTeacher({{ $teacher->id }})"
                                    class="p-2 text-red-500 hover:bg-red-50 rounded-full">

                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M6 18L18 6M6 6l12 12" />
                                    </svg>
                                </button>

                            </div>

                            @empty
                            <p class="text-xs text-gray-400 italic">
                                Belum ada guru di jurusan ini
                            </p>
                            @endforelse

                        </div>
                    </div>



                    <div class="flex flex-col gap-2">
                        <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide mb-1">
                            {{ __('Ketua Kursus') }}
                        </p>

                        @if($record->headOfDepartment)
                        <div class="w-full flex items-center gap-3 p-3 bg-gray-50 rounded-lg border border-gray-200">
                            <img src="{{ $record->headOfDepartment->foto ? url('/file/' . $record->headOfDepartment->foto) : '/placeholder.svg' }}"
                                alt="{{ $record->headOfDepartment->foto }}"
                                class="w-9 h-9 rounded-full object-cover">
                            <div>
                                <p class="text-[9px] font-semibold text-gray-900">
                                    {{ $record->headOfDepartment->name }}
                                </p>
                                <p class="text-[10px] text-gray-500">
                                    NIP. {{ $record->headOfDepartment->nip }}
                                </p>
                            </div>
                        </div>
                        @else
                        <p class="text-sm text-gray-500 italic">
                            {{ __('No head of department assigned') }}
                        </p>
                        @endif
                    </div>
                </div>
            </x-filament::section>

            <x-filament::section>
                <div class="">
                    <h3 class="text-sm font-bold text-gray-900 mb-4">
                        {{ __('Statistik Cepat') }}
                    </h3>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Total Siswa') }}
                            </p>
                            <p class="mt-1 text-lg font-bold text-gray-900">
                                {{-- Menggunakan logika sum dari relasi classes sesuai request --}}
                                {{ $record->classes->sum(fn($class) => $class->students->count()) }}
                            </p>
                        </div>
                        <div>
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Total Guru') }}
                            </p>
                            <p class="mt-1 text-lg font-bold text-gray-900">
                                {{ $record->teachers->count() }}
                            </p>
                        </div>
                    </div>
                </div>
            </x-filament::section>
        </div>

        {{-- ============ RIGHT COLUMN (Class Management) ============ --}}
        <div class="w-full">
            <x-filament::section>

                <div class="flex justify-between items-center mb-5">
                    <div>
                        <h2 class="text-md font-semibold text-gray-900">
                            Manajemen Kelas
                        </h2>
                        <p class="text-xs text-gray-500">
                            Tahun Akademik 2026/2027
                        </p>
                    </div>
                </div>


                {{-- TABLE --}}
                <div class="border border-slate-300 rounded-lg overflow-hidden bg-white">
                    <table class="w-full text-xs">
                        <thead>
                            <tr class="bg-gray-50">
                                <th class="text-left px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    nama kelas
                                </th>
                                <th class="text-left px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Wali Kelas
                                </th>
                                <th class="text-center px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Jumlah Siswa
                                </th>
                                <th class="text-center px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Aksi
                                </th>
                            </tr>
                        </thead>

                        <tbody class="divide-y divide-gray-200">
                            @php
                            // LOGIKA UTAMA:
                            // Ambil ID semua kelas yang SUDAH terdaftar di jurusan ini.
                            // Kita gunakan pluck('id') agar menjadi array sederhana [1, 5, 8, ...]
                            // $record adalah variable $department
                            $registeredClassIds = $record->classes->pluck('id')->toArray();
                            @endphp

                            @foreach($allClasses as $class)
                            <tr class="hover:bg-gray-200 transition">
                                {{-- Nama Kelas --}}
                                <td class="px-4 py-3 text-[10px] font-medium text-gray-900">
                                    {{ $class->name }}
                                </td>

                                {{-- Wali Kelas --}}
                                <td class="px-4 py-3">
                                    @if($class->homeroomTeacher)
                                    <div class="flex items-center gap-2">
                                        {{-- Pastikan source image valid --}}
                                        <img src="{{ $class->homeroomTeacher->foto ? url('/file/' . $class->homeroomTeacher->foto) : '/placeholder.svg' }}"
                                            class="w-8 h-8 rounded-full object-cover">
                                        <span class="text-gray-800">
                                            {{ $class->homeroomTeacher->name }}
                                        </span>
                                    </div>
                                    @else
                                    <span class="text-gray-400 italic">
                                        Not Assigned
                                    </span>
                                    @endif
                                </td>

                                {{-- Jumlah Siswa --}}
                                <td class="px-4 py-3 text-center font-semibold text-gray-900">
                                    {{ $class->students->count() }}
                                </td>

                                {{-- ACTIONS (LOGIKA GANTI ICON) --}}
                                <td class="px-4 py-3">
                                    <div class="flex items-center justify-center gap-1">

                                        @if(in_array($class->id, $registeredClassIds))
                                        {{-- KONDISI 1: Kelas SUDAH terdaftar --}}
                                        {{-- Tampilkan: Hapus (Merah) --}}
                                        {{-- Sembunyikan: Tambah (+) --}}

                                        {{-- Note: Tambahkan wire:click="detachClass({{ $class->id }})" nanti untuk fungsi backendnya --}}
                                        <div class="flex items-center justify-center gap-2">
                                            <span class="px-2 py-1 text-[10px] font-medium text-green-700 bg-green-100 border border-green-200 rounded-md whitespace-nowrap">
                                                Sudah Daftar
                                            </span>

                                            <button wire:click="detachClass({{ $class->id }})"
                                                class="p-2 text-red-500 hover:text-red-700 hover:bg-red-50 rounded-full transition"
                                                title="Hapus dari Jurusan">
                                                <svg class="w-4 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                </svg>
                                            </button>
                                        </div>

                                        @else
                                        {{-- KONDISI 2: Kelas BELUM terdaftar --}}
                                        {{-- Tampilkan: Tambah (Biru/Plus) --}}
                                        {{-- Sembunyikan: Hapus --}}

                                        {{-- Note: Tambahkan wire:click="attachClass({{ $class->id }})" nanti untuk fungsi backendnya --}}
                                        <button wire:click="attachClass({{ $class->id }})" class="p-2 text-blue-500 hover:text-blue-700 hover:bg-blue-50 rounded-full transition" title="Tambahkan ke Jurusan">
                                            <svg class="w-4 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.5v15m7.5-7.5h-15" />
                                            </svg>
                                        </button>
                                        @endif

                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="mt-3 text-xs text-gray-500">
                    Classes are linked to Curriculum 2013 Revision.
                    <a href="#" class="text-primary-600 hover:underline">Change setting</a>
                </div>

            </x-filament::section>
        </div>

    </div>

</x-filament::page>