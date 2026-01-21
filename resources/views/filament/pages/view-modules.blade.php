<x-filament::page>

    {{-- ================= HEADER ================= --}}
    <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between mb-6 -mt-17 bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-200 dark:border-gray-800">
        <div>
            <h1 class="text-3xl font-bold text-gray-950 dark:text-white">
                Daftar Mata Pelajaran
            </h1>
            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400 max-w-2xl">
                Halaman ini digunakan untuk mengelola seluruh mata pelajaran yang tersedia di sistem. Admin dapat menambahkan, mengubah, dan menghapus data mata pelajaran, menentukan guru pengampu, serta mengatur kelas yang terkait dengan setiap mata pelajaran.
            </p>
        </div>
    </div>


    {{-- ================= GRID ================= --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @forelse ($this->getDepartments() as $dept)

        @php
        $theme = match($dept->slug) {
        'tata-boga', 'software-engineering' => [
        'bg' => 'bg-blue-50 dark:bg-blue-900/20',
        'border' => 'border-blue-200 dark:border-blue-800',
        'text' => 'text-blue-600 dark:text-blue-400',
        'badge' => 'bg-blue-100 text-blue-700 dark:bg-blue-500/20 dark:text-blue-300',
        'icon' => 'heroicon-o-code-bracket'
        ],
        'tata-kecantikan', 'network-engineering' => [
        'bg' => 'bg-purple-50 dark:bg-purple-900/20',
        'border' => 'border-purple-200 dark:border-purple-800',
        'text' => 'text-purple-600 dark:text-purple-400',
        'badge' => 'bg-purple-100 text-purple-700 dark:bg-purple-500/20 dark:text-purple-300',
        'icon' => 'heroicon-o-wifi'
        ],
        'tata-busana', 'accounting' => [
        'bg' => 'bg-green-50 dark:bg-green-900/20',
        'border' => 'border-green-200 dark:border-green-800',
        'text' => 'text-green-600 dark:text-green-400',
        'badge' => 'bg-green-100 text-green-700 dark:bg-green-500/20 dark:text-green-300',
        'icon' => 'heroicon-o-banknotes'
        ],
        default => [
        'bg' => 'bg-gray-50 dark:bg-gray-800',
        'border' => 'border-gray-200 dark:border-gray-700',
        'text' => 'text-gray-600 dark:text-gray-400',
        'badge' => 'bg-gray-100 text-gray-700 dark:bg-gray-700 dark:text-gray-300',
        'icon' => 'heroicon-o-academic-cap'
        ],
        };
        @endphp

        {{-- Gunakan Div biasa dengan class Filament agar bisa Full Width Image --}}
        <div class="group flex flex-col h-full bg-white dark:bg-gray-900 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden">

            {{-- 1. HEADER IMAGE (Full Bleed) --}}
            <div class="relative h-48 w-full overflow-hidden bg-gray-100">
                <img src="{{ $module->thumbnail? asset('uploads/' . $module->thumbnail): asset('placeholder.svg') }}"
                    class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                    alt="{{ $module->name }}">
                {{-- Floating Icon Badge --}}
                <div class="absolute top-3 right-3 p-2 rounded-lg backdrop-blur-md bg-white/80 dark:bg-black/50 shadow-sm border border-white/20">
                    @svg($theme['icon'], 'w-5 h-5 ' . $theme['text'])
                </div>

                {{-- Gradient Overlay untuk teks agar terbaca (opsional) --}}
                <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-60"></div>

                {{-- Title di atas gambar (bawah kiri) --}}
                <div class="absolute bottom-4 left-4 right-4">
                    <h3 class="text-xl font-bold text-white tracking-wide shadow-black drop-shadow-md">
                        {{ $dept->name }}
                    </h3>
                </div>
            </div>

            {{-- 2. CONTENT BODY --}}
            <div class="p-5 flex flex-col flex-grow">


                {{-- Classes List --}}
                <div class="mb-6 flex-grow">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-xs font-semibold text-gray-500 uppercase">Kelas Aktif</p>
                        <span class="text-xs font-bold {{ $theme['text'] }}">{{ $dept->classes->count() }} Kelas</span>
                    </div>

                    <div class="flex flex-wrap gap-2">
                        @forelse ($dept->classes->take(4) as $class)
                        <span class="px-2 py-1 text-[10px] font-medium rounded-md border {{ $theme['border'] }} {{ $theme['badge'] }}">
                            {{ $class->name }}
                        </span>
                        @empty
                        <span class="text-xs text-gray-400 italic">Belum ada kelas</span>
                        @endforelse

                        @if($dept->classes->count() > 4)
                        <span class="px-2 py-1 text-[10px] font-medium rounded-md bg-gray-100 text-gray-500">
                            +{{ $dept->classes->count() - 4 }}
                        </span>
                        @endif
                    </div>
                </div>

                {{-- Teachers List --}}
                <div class="mb-6 flex-grow">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-xs font-semibold text-gray-500 uppercase">
                            Guru Aktif
                        </p>

                        <span class="text-xs font-bold {{ $theme['text'] }}">
                            {{ $dept->teachers->count() }} Guru
                        </span>
                    </div>

                    <div class="flex flex-wrap gap-2">

                        @forelse ($dept->teachers->take(4) as $teacher)

                        <span class="px-2 py-1 text-[10px] font-medium rounded-md border {{ $theme['border'] }} {{ $theme['badge'] }}">

                            {{ $teacher->name }}

                        </span>

                        @empty
                        <span class="text-xs text-gray-400 italic">
                            Belum ada guru
                        </span>
                        @endforelse

                        @if($dept->teachers->count() > 4)
                        <span class="px-2 py-1 text-[10px] font-medium rounded-md bg-gray-100 text-gray-500">
                            +{{ $dept->teachers->count() - 4 }}
                        </span>
                        @endif

                    </div>
                </div>


                {{-- 3. FOOTER STATS & ACTION --}}
                <div class="mt-auto">
                    {{-- Stats Grid --}}
                    <div class="grid grid-cols-2 divide-x divide-gray-200 dark:divide-gray-700 border-t border-b border-gray-100 dark:border-gray-800 py-3 mb-4">
                        <div class="text-center">
                            <span class="block text-lg font-bold text-gray-900 dark:text-white">
                                {{ $dept->classes->sum(fn($class) => $class->students->count()) }}
                            </span>
                            <span class="text-[10px] text-gray-500 uppercase tracking-wide">Siswa</span>
                        </div>
                        <div class="text-center">
                            <span class="block text-lg font-bold text-gray-900 dark:text-white">
                                {{ $dept->teachers->count() }}
                            </span>
                            <span class="text-[10px] text-gray-500 uppercase tracking-wide">Guru</span>
                        </div>
                    </div>

                    <div class="flex gap-2 w-full">

                        {{-- Tombol Manage --}}
                        <x-filament::button
                            tag="a"
                            color="gray"
                            class="flex-1 justify-center hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors"
                            :href="\App\Filament\Pages\ManageDepartmentClasses::getUrl(['department' => $dept->id])">
                            Kelola Mata Pelajaran
                        </x-filament::button>

                        {{-- Tombol Hapus --}}
                        <x-filament::button
                            color="danger"
                            wire:click="confirmDelete({{ $dept->id }})"
                            title="Hapus Jurusan">

                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>

                        </x-filament::button>
                    </div>

                </div>
            </div>
        </div>

        @empty
        <div class="col-span-full flex flex-col items-center justify-center p-10 bg-white dark:bg-gray-900 rounded-xl border border-dashed border-gray-300">
            <x-heroicon-o-building-office-2 class="w-12 h-12 text-gray-300 mb-2" />
            <p class="text-gray-500 font-medium">Belum ada data jurusan.</p>
        </div>
        @endforelse
        <x-filament::modal id="delete-department">

            <x-slot name="heading">
                Hapus Jurusan
            </x-slot>

            <p class="text-sm text-gray-500">
                Apakah Anda yakin ingin menghapus jurusan ini?
                Data terkait (kelas & guru) akan terlepas dari jurusan.
            </p>

            <x-slot name="footer">
                <div class="flex justify-end gap-2">

                    <x-filament::button
                        color="gray"
                        x-on:click="$dispatch('close-modal', { id: 'delete-department' })">
                        Batal
                    </x-filament::button>

                    <x-filament::button
                        color="danger"
                        wire:click="deleteDepartment">
                        Ya, Hapus
                    </x-filament::button>

                </div>
            </x-slot>

        </x-filament::modal>
    </div>

</x-filament::page>