<x-filament::page>

    @php
    $record = $department;
    $registeredClassIds = $record->classes->pluck('id')->toArray();
    @endphp

    <div class="space-y-8">

        {{-- ============ 1. HERO SECTION (FOTO & INFO UTAMA) ============ --}}
        <div class="relative group">
            {{-- Background Gradient Banner --}}
            <div class="h-48 w-full rounded-3xl bg-gradient-to-br from-indigo-600 via-purple-600 to-pink-500 shadow-lg overflow-hidden relative">
                <div class="absolute inset-0 bg-white/10 opacity-30 pattern-grid-lg"></div> {{-- Optional Pattern --}}

                {{-- Stats Overlay (Pojok Kanan Atas) --}}
                <div class="absolute top-6 right-6 flex gap-3">
                    <div class="bg-white/20 backdrop-blur-md border border-white/30 text-white px-4 py-2 rounded-xl flex flex-col items-center">
                        <span class="text-2xl font-bold leading-none">{{ $record->classes->sum(fn($class) => $class->students->count()) }}</span>
                        <span class="text-[10px] uppercase tracking-wider opacity-80">Total Siswa</span>
                    </div>
                </div>
            </div>

            {{-- Profile Container --}}
            <div class="max-w-7xl mx-auto px-6 sm:px-8 relative -mt-16 flex flex-col md:flex-row items-end gap-6">

                {{-- Foto Wrapper (Dengan Fungsi Upload) --}}
                <div class="relative flex-shrink-0">
                    <div class="w-32 h-32 rounded-3xl border-4 border-white dark:border-gray-900 shadow-2xl overflow-hidden bg-white relative z-10 group/photo">
                        @if($record->thumbnail)
                        <img src="{{ $record->thumbnail? $record->thumbnail : asset('placeholder.svg') }}">
                        @else
                        <div class="w-full h-full flex items-center justify-center bg-gray-100 text-gray-400">
                            <x-heroicon-o-photo class="w-12 h-12" />
                        </div>
                        @endif

                        {{-- Overlay Upload --}}
                        <label class="absolute inset-0 bg-black/50 flex flex-col items-center justify-center text-white opacity-0 group-hover/photo:opacity-100 transition-all duration-300 cursor-pointer">
                            <x-heroicon-o-camera class="w-8 h-8 mb-1" />
                            <span class="text-[10px] font-bold uppercase">Ganti Foto</span>
                            <input type="file" wire:model="foto" class="hidden" accept="image/*">
                        </label>

                        {{-- Loading State --}}
                        <div wire:loading wire:target="foto" class="absolute inset-0 bg-white/90 flex items-center justify-center z-20">
                            <svg class="animate-spin h-8 w-8 text-indigo-600" fill="none" viewBox="0 0 24 24">
                                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                {{-- Judul & Deskripsi --}}
                <div class="flex-grow pb-2 text-center md:text-left">
                    <h1 class="text-3xl font-black text-gray-900 dark:text-white tracking-tight mb-1 mt-2">
                        {{ $record->title ?? 'Nama Jurusan' }}
                    </h1>
                    <p class="text-gray-500 dark:text-gray-400 text-sm max-w-2xl line-clamp-2">
                        {{ $record->description ?? 'Tidak ada deskripsi jurusan.' }}
                    </p>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

            {{-- ============ 2. KOLOM KIRI: FORM EDIT ============ --}}
            <div class="lg:col-span-1">
                {{-- Card Container --}}
                <div class="bg-white dark:bg-gray-900 rounded-3xl shadow-[0_8px_30px_rgb(0,0,0,0.04)] border border-gray-100 dark:border-gray-800 p-1 sticky top-24 overflow-hidden group">

                    {{-- Decorative Gradient Line Top --}}
                    <div class="h-1.5 w-full bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 rounded-t-3xl"></div>

                    <div class="p-6">
                        {{-- Header --}}
                        <div class="flex items-center justify-between mb-8">
                            <div>
                                <h2 class="text-xl font-black tracking-tight text-gray-900 dark:text-white">
                                    Edit Detail
                                </h2>
                                <p class="text-xs text-gray-400 mt-1 font-medium">Perbarui informasi jurusan</p>
                            </div>
                            <div class="w-10 h-10 rounded-2xl bg-indigo-50 dark:bg-indigo-900/20 flex items-center justify-center text-indigo-600 dark:text-indigo-400 shadow-sm rotate-3 group-hover:rotate-6 transition-transform duration-300">
                                <x-heroicon-m-pencil-square class="w-5 h-5" />
                            </div>
                        </div>

                        <div class="space-y-6">

                            {{-- Input Nama Jurusan (Style: Modern Filled) --}}
                            <div class="group relative">
                                <label class="block text-xs font-bold text-gray-500 uppercase tracking-widest mb-2 ml-1 group-focus-within:text-indigo-600 transition-colors">
                                    Nama Jurusan
                                </label>
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                        <x-heroicon-m-tag class="w-4 h-4" />
                                    </div>
                                    <input
                                        type="text"
                                        wire:model="jurusanName"
                                        class="block w-full pl-10 pr-4 py-3 bg-gray-50 dark:bg-gray-800 border-none rounded-xl text-gray-900 dark:text-white text-sm font-semibold placeholder-gray-400 focus:ring-2 focus:ring-indigo-500/20 focus:bg-white dark:focus:bg-gray-900 transition-all duration-300 shadow-sm"
                                        placeholder="Contoh: Teknik Komputer">
                                </div>
                            </div>

                            {{-- Textarea Deskripsi (Style: Modern Filled) --}}
                            <div class="group relative">
                                <label class="block text-xs font-bold text-gray-500 uppercase tracking-widest mb-2 ml-1 group-focus-within:text-indigo-600 transition-colors">
                                    Deskripsi Singkat
                                </label>
                                <div class="relative">
                                    <div class="absolute top-3 left-3 pointer-events-none text-gray-400">
                                        <x-heroicon-m-document-text class="w-4 h-4" />
                                    </div>
                                    <textarea
                                        rows="4"
                                        wire:model="description"
                                        class="block w-full pl-10 pr-4 py-3 bg-gray-50 dark:bg-gray-800 border-none rounded-xl text-gray-900 dark:text-white text-sm leading-relaxed placeholder-gray-400 focus:ring-2 focus:ring-indigo-500/20 focus:bg-white dark:focus:bg-gray-900 transition-all duration-300 resize-none shadow-sm"
                                        placeholder="Tuliskan deskripsi singkat mengenai jurusan ini..."></textarea>
                                </div>
                            </div>

                            {{-- Action Button --}}
                            <div class="pt-2">
                                <button
                                    wire:click="save"
                                    class="relative w-full group/btn overflow-hidden rounded-xl bg-gradient-to-r from-indigo-500 to-purple-500 dark:bg-indigo-600 text-white shadow-lg shadow-gray-900/20 dark:shadow-indigo-600/30 transition-all duration-300 hover:-translate-y-0.5 hover:shadow-xl">
                                    <div class="absolute inset-0 w-full h-full bg-gradient-to-r from-indigo-500 to-purple-500 opacity-0 group-hover/btn:opacity-100 transition-opacity duration-300"></div>
                                    <div class="relative flex items-center justify-center gap-2 py-3.5 px-4">
                                        <span class="text-sm font-bold tracking-wide">Simpan Perubahan</span>
                                        <x-heroicon-m-check class="w-4 h-4" />
                                    </div>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            {{-- ============ 3. KOLOM KANAN: DAFTAR KELAS (TABLE) ============ --}}
            <div class="lg:col-span-2">
                <div class="bg-white dark:bg-gray-900 rounded-2xl shadow-sm border border-gray-200 dark:border-gray-800 flex flex-col h-full">

                    {{-- Header Table --}}
                    <div class="p-6 border-b border-gray-100 dark:border-gray-800 flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                        <div>
                            <h2 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                                <x-heroicon-m-academic-cap class="w-5 h-5 text-gray-400" />
                                Manajemen Kelas
                            </h2>
                            <p class="text-sm text-gray-500">Atur kelas yang masuk dalam jurusan ini.</p>
                        </div>

                        {{-- Filter / Legend (Visual Only) --}}
                        <div class="flex items-center gap-1 bg-gray-100 dark:bg-gray-800 p-1 rounded-lg">
                            <span class="px-3 py-1 text-xs font-bold text-gray-600 dark:text-gray-300 rounded-md bg-white dark:bg-gray-700 shadow-sm">Semua</span>
                            <span class="px-3 py-1 text-xs font-medium text-gray-500">Terpilih: {{ count($registeredClassIds) }}</span>
                        </div>
                    </div>

                    {{-- Content Table --}}
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead class="bg-gray-50/50 dark:bg-gray-800/50 text-xs uppercase text-gray-400 font-bold tracking-wider">
                                <tr>
                                    <th class="px-6 py-4 pl-8">Info Kelas</th>
                                    <th class="px-6 py-4">Wali Kelas</th>
                                    <th class="px-6 py-4 text-center">Jumlah Siswa</th>
                                    <th class="px-6 py-4 text-right pr-8">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                                @foreach($allClasses as $class)
                                @php $isAttached = in_array($class->id, $registeredClassIds); @endphp

                                <tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors duration-200">
                                    {{-- Kolom Nama Kelas --}}
                                    <td class="px-6 py-4 pl-8">
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 rounded-lg flex items-center justify-center text-sm font-bold shadow-sm transition-all
                                                {{ $isAttached ? 'bg-indigo-100 text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400' : 'bg-gray-100 text-gray-400 grayscale' }}">
                                                {{ substr($class->name, 0, 2) }}
                                            </div>
                                            <div>
                                                <div class="font-bold text-gray-900 dark:text-white text-sm">{{ $class->name }}</div>
                                                <div class="text-[10px] text-gray-400">ID: #{{ $class->id }}</div>
                                            </div>
                                        </div>
                                    </td>

                                    {{-- Kolom Wali Kelas --}}
                                    <td class="px-6 py-4">
                                        @if($class->homeroomTeacher)
                                        <div class="flex items-center gap-2">
                                            <div class="w-6 h-6 rounded-full bg-gradient-to-tr from-gray-200 to-gray-100 flex items-center justify-center text-[10px] font-bold text-gray-600 ring-1 ring-white">
                                                {{ substr($class->homeroomTeacher->name, 0, 1) }}
                                            </div>
                                            <span class="text-xs font-medium text-gray-600 dark:text-gray-300">{{ $class->homeroomTeacher->name }}</span>
                                        </div>
                                        @else
                                        <span class="inline-flex items-center gap-1 text-[10px] text-orange-500 font-medium bg-orange-50 px-2 py-0.5 rounded-md">
                                            <x-heroicon-s-exclamation-triangle class="w-3 h-3" /> Kosong
                                        </span>
                                        @endif
                                    </td>

                                    {{-- Kolom Siswa --}}
                                    <td class="px-6 py-4 text-center">
                                        <span class="text-sm font-semibold text-gray-700 dark:text-gray-300">{{ $class->students->count() }}</span>
                                    </td>

                                    {{-- Kolom Aksi Toggle --}}
                                    <td class="px-6 py-4 text-right pr-8">
                                        @if($isAttached)
                                        <button wire:click="detachClass({{ $class->id }})"
                                            class="relative inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-green-50 text-green-700 border border-green-200 text-xs font-bold hover:bg-red-50 hover:text-red-600 hover:border-red-200 hover:shadow-sm transition-all group/btn">
                                            <span class="w-1.5 h-1.5 rounded-full bg-green-500 group-hover/btn:bg-red-500"></span>
                                            <span class="group-hover/btn:hidden">Terhubung</span>
                                            <span class="hidden group-hover/btn:inline">Lepaskan</span>
                                        </button>
                                        @else
                                        <button wire:click="attachClass({{ $class->id }})"
                                            class="inline-flex items-center gap-1.5 px-4 py-1.5 rounded-full bg-white border border-gray-300 text-gray-600 text-xs font-bold hover:border-indigo-500 hover:text-indigo-600 hover:shadow-md transition-all">
                                            <x-heroicon-m-plus class="w-3.5 h-3.5" />
                                            <span>Tambah</span>
                                        </button>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-filament::page>