<x-filament::page>

    {{-- ================= HEADER SECTION ================= --}}
    <div class="relative overflow-hidden bg-white dark:bg-gray-900 rounded-3xl border border-gray-200 dark:border-gray-800 shadow-lg mb-10">
        {{-- Background Blobs --}}
        <div class="absolute top-0 right-0 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/3 pointer-events-none"></div>
        <div class="absolute bottom-0 left-0 w-64 h-64 bg-purple-500/10 rounded-full blur-3xl translate-y-1/3 -translate-x-1/4 pointer-events-none"></div>

        <div class="relative z-10 p-8 sm:p-10">
            <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-6">
                <div>
                    <h1 class="text-3xl sm:text-4xl font-extrabold text-gray-900 dark:text-white tracking-tight">
                        Daftar Jurusan
                    </h1>
                    <p class="mt-3 text-base text-gray-500 dark:text-gray-400 max-w-2xl leading-relaxed">
                        Kelola kompetensi keahlian, pantau statistik kepala program, dan atur mata pelajaran dalam satu tampilan terpusat.
                    </p>
                </div>

                <div class="hidden md:flex flex-col items-end">
                    <div class="flex items-baseline gap-2">
                        <span class="text-5xl font-black text-transparent bg-clip-text bg-gradient-to-br from-primary-500 to-purple-600">
                            {{ $this->getDepartments()?->count() ?? 0 }}
                        </span>
                        <span class="text-sm font-bold text-gray-500 uppercase tracking-widest">Jurusan</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- ================= FILTER BAR ================= --}}
    <div class="flex flex-col sm:flex-row sm:items-center justify-between mb-8 gap-4">

        {{-- Title Section --}}
        <div class="flex items-center gap-3">
            <div class="h-8 w-1.5 rounded-full bg-gradient-to-b from-primary-500 to-primary-600"></div>
            <h2 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                Filter Kelas
            </h2>
        </div>

        {{-- Filter Dropdown --}}
        <div class="relative group min-w-[240px]">
            <div class="absolute -inset-0.5 bg-gradient-to-r from-gray-200 to-gray-100 dark:from-gray-700 dark:to-gray-800 rounded-full blur opacity-50 group-hover:opacity-100 transition duration-200"></div>
            
            <div class="relative flex items-center bg-white dark:bg-gray-900 rounded-full shadow-sm border border-gray-200 dark:border-gray-700 hover:border-primary-400 dark:hover:border-primary-500 transition-colors duration-300">
                <div class="pl-4 text-gray-400 group-hover:text-primary-500 transition-colors">
                    <x-heroicon-m-funnel class="w-5 h-5" />
                </div>

                <div class="h-5 w-px bg-gray-200 dark:bg-gray-700 mx-3"></div>

                <select wire:model.live="tingkatFilter"
                    class="appearance-none bg-transparent border-none text-gray-700 dark:text-gray-200 text-sm font-semibold py-3 pr-10 pl-1 w-full focus:ring-0 cursor-pointer outline-none">
                    <option value="" class="font-normal text-gray-500">Semua Kelas</option>
                    @foreach(\App\Models\Tingkat::orderBy('name')->get() as $tingkat)
                        <option value="{{ $tingkat->id }}" class="font-normal text-gray-900 dark:text-gray-100">
                            {{ $tingkat->name }}
                        </option>
                    @endforeach
                </select>

                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-4 text-gray-400 group-hover:text-primary-500 transition-colors">
                    <x-heroicon-m-chevron-down class="w-4 h-4" />
                </div>
            </div>
        </div>
    </div>


    {{-- ================= GRID DEPARTMENTS ================= --}}
    <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
        @forelse ($this->getDepartments() as $dept)
            @php
                $slug = $dept->slug ?? Str::slug($dept->name ?? 'unknown');
                $theme = match($slug) {
                    'tata-boga', 'kulinerr' => [
                        'color' => 'orange', 
                        'bg' => 'bg-orange-50 dark:bg-orange-900/10',
                        'text' => 'text-orange-600 dark:text-orange-400',
                        'border' => 'border-orange-500', 
                        'ring' => 'ring-orange-500/20',
                        'icon' => 'heroicon-o-cake'
                    ],
                    'software-engineering', 'rpl', 'pplg' => [
                        'color' => 'blue', 
                        'bg' => 'bg-blue-50 dark:bg-blue-900/10',
                        'text' => 'text-blue-600 dark:text-blue-400',
                        'border' => 'border-blue-500', 
                        'ring' => 'ring-blue-500/20',
                        'icon' => 'heroicon-o-code-bracket'
                    ],
                    'network-engineering', 'tjkt' => [
                        'color' => 'purple', 
                        'bg' => 'bg-purple-50 dark:bg-purple-900/10',
                        'text' => 'text-purple-600 dark:text-purple-400',
                        'border' => 'border-purple-500', 
                        'ring' => 'ring-purple-500/20',
                        'icon' => 'heroicon-o-wifi'
                    ],
                    default => [
                        'color' => 'gray', 
                        'bg' => 'bg-gray-50 dark:bg-gray-800',
                        'text' => 'text-gray-600 dark:text-gray-400',
                        'border' => 'border-gray-500', 
                        'ring' => 'ring-gray-500/20',
                        'icon' => 'heroicon-o-academic-cap'
                    ],
                };
            @endphp

            <div class="group relative flex flex-col h-full bg-white dark:bg-gray-900 rounded-3xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-2xl hover:shadow-gray-200/50 dark:hover:shadow-none hover:-translate-y-1 transition-all duration-300 overflow-hidden">
                
                {{-- Decorative Top Border --}}
                <div class="absolute top-0 inset-x-0 h-1.5 {{ $theme['border'] }}"></div>

                {{-- 1. HEADER IMAGE --}}
                <div class="relative h-48 w-full overflow-hidden bg-gray-100 dark:bg-gray-800">
                    <img src="{{ $dept->image ? $dept->image : asset('placeholder.svg') }}"
                        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                        alt="{{ $dept->name }}">
                    
                    {{-- Gradient Overlay --}}
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-900 via-gray-900/40 to-transparent opacity-90"></div>

                    {{-- Icon Badge --}}
                    <div class="absolute top-4 right-4 p-2.5 rounded-xl backdrop-blur-md bg-white/10 border border-white/20 shadow-lg">
                        @svg($theme['icon'], 'w-5 h-5 text-white')
                    </div>

                    {{-- Title Overlay --}}
                    <div class="absolute bottom-0 left-0 right-0 p-6">
                        <h3 class="text-2xl font-bold text-white leading-tight tracking-tight mb-1">
                            {{ $dept->name }}
                        </h3>
                        <div class="h-1 w-12 rounded-full {{ str_replace('text-', 'bg-', $theme['text']) }}"></div>
                    </div>
                </div>

                {{-- 2. CONTENT BODY --}}
                <div class="p-6 flex flex-col flex-grow">

                    {{-- Section Kepala Program --}}
                    <div class="flex items-center gap-4 mb-6">
                        <div class="shrink-0 relative">
                            <img src="{{ $dept->headOfDepartment?->image ? asset('uploads/' . $dept->headOfDepartment->image) : 'https://ui-avatars.com/api/?name='.urlencode($dept->headOfDepartment?->name ?? 'User').'&color=7F9CF5&background=EBF4FF' }}"
                                class="w-12 h-12 rounded-full object-cover border-2 border-white dark:border-gray-700 shadow-sm group-hover:ring-2 {{ $theme['ring'] }} transition-all"
                                alt="Avatar">
                            @if($dept->headOfDepartment)
                                <div class="absolute -bottom-1 -right-1 w-4 h-4 bg-green-500 border-2 border-white dark:border-gray-800 rounded-full" title="Active"></div>
                            @endif
                        </div>
                        <div class="min-w-0 flex-1">
                            <p class="text-[11px] font-bold uppercase text-gray-400 tracking-wider mb-0.5">Kepala Program</p>
                            <p class="text-sm font-semibold text-gray-900 dark:text-white truncate">
                                {{ $dept->headOfDepartment?->name ?? 'Belum Ditentukan' }}
                            </p>
                        </div>
                    </div>

                    {{-- Stats Box (Single Full Width) --}}
                    <div class="mb-6 rounded-2xl {{ $theme['bg'] }} p-4 border border-gray-100 dark:border-gray-700/50">
                        <div class="flex items-center justify-between">
                            <div class="flex items-center gap-2.5">
                                <div class="p-1.5 rounded-lg bg-white dark:bg-gray-800 shadow-sm text-gray-500">
                                    <x-heroicon-m-book-open class="w-4 h-4" />
                                </div>
                                <span class="text-sm font-medium text-gray-600 dark:text-gray-300">Mata Pelajaran</span>
                            </div>
                            <span class="text-xl font-bold {{ $theme['text'] }}">
                                {{ $dept->modules_count }}
                            </span>
                        </div>
                    </div>

                    {{-- Actions Container (Styles preserved as requested) --}}
                    <div class="mt-auto pt-2 flex items-stretch gap-3">
                        
                        {{-- TOMBOL UTAMA (KELOLA) - Style Dipertahankan --}}
                        <a href="{{ \App\Filament\Pages\ManageModulesClasses::getUrl(['department' => $dept->id]) . ($tingkatFilter ? '?tingkat=' . $tingkatFilter : '') }}"
                            class="group/btn relative flex-1 flex items-center justify-between px-5 py-3 overflow-hidden rounded-xl bg-gradient-to-r from-primary-600 to-indigo-600 text-white shadow-md transition-all duration-300 hover:shadow-lg hover:shadow-primary-500/40 hover:-translate-y-0.5">
                            
                            <div class="absolute inset-0 w-full h-full bg-white/10 opacity-0 group-hover/btn:opacity-100 transition-opacity duration-300"></div>
                            
                            <span class="relative text-sm font-bold tracking-wide">Lihat Detail</span>
                            
                            <div class="relative flex items-center justify-center w-6 h-6 rounded-full bg-white/20 group-hover/btn:bg-white/30 transition-colors">
                                <x-heroicon-m-arrow-right class="w-3.5 h-3.5 transform group-hover/btn:translate-x-0.5 transition-transform text-white" />
                            </div>
                        </a>

                        {{-- TOMBOL HAPUS - Style Dipertahankan --}}
                        <button
                            wire:click="confirmDelete({{ $dept->id }})"
                            class="group/delete relative flex items-center justify-center px-4 rounded-xl bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 text-gray-400 shadow-sm transition-all duration-300 hover:border-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 hover:text-red-600 hover:shadow-md hover:-translate-y-0.5"
                            title="Hapus Jurusan">
                            
                            <x-heroicon-m-trash class="w-5 h-5 transition-transform duration-300 group-hover/delete:scale-110" />
                        </button>

                    </div>
                </div>
            </div>
        @empty
            <div class="col-span-full flex flex-col items-center justify-center py-20 text-center">
                <div class="p-4 rounded-full bg-gray-50 dark:bg-gray-800 mb-4">
                    <x-heroicon-o-building-library class="w-12 h-12 text-gray-300 dark:text-gray-600" />
                </div>
                <h3 class="text-lg font-medium text-gray-900 dark:text-white">Belum ada jurusan</h3>
                <p class="text-gray-500 dark:text-gray-400 text-sm mt-1">Silakan tambahkan data jurusan baru.</p>
            </div>
        @endforelse
    </div>

    {{-- Modal Delete --}}
    <x-filament::modal id="delete-department">
        <x-slot name="heading">Hapus Jurusan</x-slot>
        <p class="text-sm text-gray-500">Apakah Anda yakin? Data terkait akan ikut terpengaruh.</p>
        <x-slot name="footer">
            <div class="flex justify-end gap-2">
                <x-filament::button color="gray" x-on:click="$dispatch('close-modal', { id: 'delete-department' })">Batal</x-filament::button>
                <x-filament::button color="danger" wire:click="deleteDepartment">Ya, Hapus</x-filament::button>
            </div>
        </x-slot>
    </x-filament::modal>

</x-filament::page>