<x-filament::page>

    {{-- ================= HEADER SECTION ================= --}}
    <div class="relative overflow-hidden bg-white dark:bg-gray-900 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm mb-8">
        {{-- Decorative Background --}}
        <div class="absolute top-0 right-0 w-64 h-64 bg-blue-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
        <div class="absolute bottom-0 left-0 w-40 h-40 bg-purple-500/10 rounded-full blur-2xl translate-y-1/3 -translate-x-1/4"></div>

        <div class="relative z-10 p-8">
            <div class="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
                <div>
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-white tracking-tight">
                        Daftar Jurusan
                    </h1>
                    <p class="mt-2 text-sm text-gray-500 dark:text-gray-400 max-w-2xl leading-relaxed">
                        Kelola data kompetensi keahlian, pantau statistik kepala program, guru, dan kelas dalam satu tampilan terpadu.
                    </p>
                </div>
                
                {{-- Global Stat Badge (Safe Count) --}}
                <div class="hidden md:flex flex-col items-end justify-center">
                    <span class="text-3xl font-bold text-gray-900 dark:text-white">
                        {{ $this->getDepartments()?->count() ?? 0 }}
                    </span>
                    <span class="text-xs font-semibold text-gray-500 uppercase tracking-widest">Total Jurusan</span>
                </div>
            </div>
        </div>
    </div>

    {{-- ================= GRID DEPARTMENTS ================= --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @forelse ($this->getDepartments() as $dept)

            @php
                // Safe Slug Access
                $slug = $dept->slug ?? Str::slug($dept->name ?? 'unknown');
                
                $theme = match($slug) {
                    'tata-boga', 'kuliner' => [
                        'color' => 'orange',
                        'border' => 'border-orange-500',
                        'text' => 'text-orange-600',
                        'bg_soft' => 'bg-orange-50',
                        'icon' => 'heroicon-o-cake'
                    ],
                    'software-engineering', 'rpl', 'pplg' => [
                        'color' => 'blue',
                        'border' => 'border-blue-500',
                        'text' => 'text-blue-600',
                        'bg_soft' => 'bg-blue-50',
                        'icon' => 'heroicon-o-code-bracket'
                    ],
                    'network-engineering', 'tjkt' => [
                        'color' => 'purple',
                        'border' => 'border-purple-500',
                        'text' => 'text-purple-600',
                        'bg_soft' => 'bg-purple-50',
                        'icon' => 'heroicon-o-wifi'
                    ],
                    'tata-busana', 'busana' => [
                        'color' => 'pink',
                        'border' => 'border-pink-500',
                        'text' => 'text-pink-600',
                        'bg_soft' => 'bg-pink-50',
                        'icon' => 'heroicon-o-scissors'
                    ],
                    'accounting', 'akuntansi' => [
                        'color' => 'emerald',
                        'border' => 'border-emerald-500',
                        'text' => 'text-emerald-600',
                        'bg_soft' => 'bg-emerald-50',
                        'icon' => 'heroicon-o-calculator'
                    ],
                    default => [
                        'color' => 'gray',
                        'border' => 'border-gray-500',
                        'text' => 'text-gray-600',
                        'bg_soft' => 'bg-gray-50',
                        'icon' => 'heroicon-o-academic-cap'
                    ],
                };
            @endphp

            <div class="group relative flex flex-col h-full bg-white dark:bg-gray-900 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden">

                {{-- Top Accent Border --}}
                <div class="absolute top-0 inset-x-0 h-1 {{ $theme['border'] }}"></div>

                {{-- 1. HEADER IMAGE --}}
                <div class="relative h-40 w-full overflow-hidden bg-gray-100">
                    <img
                        src="{{ $dept->foto ? url('/file/' . $dept->foto) : '/placeholder.svg' }}"
                        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                        alt="{{ $dept->name }}">

                    {{-- Gradient Overlay --}}
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-900/90 via-gray-900/40 to-transparent"></div>

                    {{-- Floating Icon --}}
                    <div class="absolute top-3 right-3 p-2 rounded-xl backdrop-blur-md bg-white/90 dark:bg-black/50 shadow-sm ring-1 ring-white/20">
                        @svg($theme['icon'], 'w-5 h-5 ' . $theme['text'])
                    </div>

                    {{-- Title --}}
                    <div class="absolute bottom-4 left-5 right-5">
                        <h3 class="text-xl font-bold text-white shadow-black drop-shadow-md leading-tight">
                            {{ $dept->name }}
                        </h3>
                    </div>
                </div>

                {{-- 2. CONTENT BODY --}}
                <div class="p-5 flex flex-col flex-grow">
                    
                    {{-- Head of Dept (Kaprog) Section --}}
                    <div class="flex items-center gap-3 mb-5 pb-5 border-b border-gray-100 dark:border-gray-800">
                        {{-- Menggunakan null coalescing operator (??) untuk fallback --}}
                        <img src="{{ $dept->headOfDepartment?->foto ? url('/file/' . $dept->headOfDepartment->foto) : 'https://ui-avatars.com/api/?name='.urlencode($dept->headOfDepartment?->name ?? 'NA').'&background=random' }}" 
                             class="w-10 h-10 rounded-full object-cover ring-2 ring-gray-100 dark:ring-gray-700">
                        <div>
                            <p class="text-[10px] font-bold uppercase text-gray-400 tracking-wider">Kepala Program</p>
                            <p class="text-sm font-semibold text-gray-900 dark:text-white truncate w-40">
                                {{ $dept->headOfDepartment?->name ?? 'Belum Ditentukan' }}
                            </p>
                        </div>
                    </div>

                    {{-- Quick Stats (FIXED: Added ?->count() ?? 0) --}}
                    <div class="grid grid-cols-2 gap-3 mb-6">
                        <div class="p-3 rounded-xl bg-gray-50 dark:bg-gray-800 border border-gray-100 dark:border-gray-700">
                            <div class="flex items-center gap-2 mb-1">
                                <x-heroicon-m-academic-cap class="w-4 h-4 text-gray-400"/>
                                <span class="text-xs font-medium text-gray-500">Kelas</span>
                            </div>
                            <span class="text-lg font-bold text-gray-900 dark:text-white">
                                {{-- PERBAIKAN DI SINI: Gunakan ?->count() --}}
                                {{ $dept->classes_count ?? $dept->classes?->count() ?? 0 }}
                            </span>
                        </div>
                        <div class="p-3 rounded-xl bg-gray-50 dark:bg-gray-800 border border-gray-100 dark:border-gray-700">
                            <div class="flex items-center gap-2 mb-1">
                                <x-heroicon-m-users class="w-4 h-4 text-gray-400"/>
                                <span class="text-xs font-medium text-gray-500">Guru</span>
                            </div>
                            <span class="text-lg font-bold text-gray-900 dark:text-white">
                                {{-- PERBAIKAN DI SINI: Gunakan ?->count() --}}
                                {{ $dept->teachers_count ?? $dept->teachers?->count() ?? 0 }}
                            </span>
                        </div>
                    </div>

                    {{-- Actions --}}
                    <div class="mt-auto flex gap-2">
                        <x-filament::button
                            tag="a"
                            color="gray"
                            class="flex-1 justify-center bg-gray-900 text-white hover:bg-gray-800 border-transparent dark:bg-white dark:text-gray-900 dark:hover:bg-gray-200"
                            :href="\App\Filament\Pages\ManageModulesClasses::getUrl(['department' => $dept->id])">
                            Kelola
                        </x-filament::button>

                        <button 
                            wire:click="$set('selectedDepartment', {{ $dept->id }})"
                            class="p-2 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors border border-gray-200 dark:border-gray-700"
                            title="Hapus Jurusan">
                            <x-heroicon-o-trash class="w-5 h-5" />
                        </button>
                    </div>

                </div>
            </div>

        @empty
            <div class="col-span-full flex flex-col items-center justify-center py-20 px-4 bg-white dark:bg-gray-900 rounded-2xl border border-dashed border-gray-300 dark:border-gray-700">
                <div class="p-4 bg-gray-50 dark:bg-gray-800 rounded-full mb-4">
                    <x-heroicon-o-building-office-2 class="w-12 h-12 text-gray-400" />
                </div>
                <h3 class="text-lg font-bold text-gray-900 dark:text-white">Belum Ada Jurusan</h3>
                <p class="text-gray-500 dark:text-gray-400 text-center max-w-sm mt-1">
                    Silakan tambahkan data jurusan baru untuk memulai pengelolaan akademik.
                </p>
            </div>
        @endforelse
    </div>

</x-filament::page>