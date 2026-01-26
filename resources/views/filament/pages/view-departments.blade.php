<x-filament::page>

    {{-- ================= HEADER SECTION ================= --}}
    <div class="relative overflow-hidden bg-white dark:bg-gray-900 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm mb-8">
        <div class="absolute top-0 right-0 w-64 h-64 bg-blue-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
        <div class="absolute bottom-0 left-0 w-40 h-40 bg-purple-500/10 rounded-full blur-2xl translate-y-1/3 -translate-x-1/4"></div>

        <div class="relative z-10 p-8">
            <div class="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
                <div>
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-white tracking-tight">Daftar Jurusan</h1>
                    <p class="mt-2 text-sm text-gray-500 dark:text-gray-400 max-w-2xl leading-relaxed">
                        Kelola data kompetensi keahlian, pantau statistik kepala program, guru, dan kelas.
                    </p>
                </div>

                <div class="hidden md:flex flex-col items-end justify-center">
                    <span class="text-3xl font-bold text-gray-900 dark:text-white">
                        {{ $this->getDepartments()?->count() ?? 0 }}
                    </span>
                    <span class="text-xs font-semibold text-gray-500 uppercase tracking-widest">Total Jurusan</span>
                </div>
            </div>
        </div>
    </div>

    {{-- ================= FILTER BAR ================= --}}
    <div class="flex items-center justify-between mb-6 pt-4">

        <h2 class="text-lg font-bold text-gray-800 dark:text-gray-200">
            Daftar Siswa
        </h2>

        <div class="flex items-center gap-2">
            <span class="text-gray-400">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon>
                </svg>
            </span>

            <div class="relative">
                <select
                    wire:model.live="tingkatFilter"
                    class="
                    appearance-none 
                    bg-transparent 
                    border border-gray-200 dark:border-gray-700 
                    text-gray-600 dark:text-gray-300 
                    text-sm font-medium 
                    rounded-lg 
                    pl-3 pr-8 py-2 
                    focus:ring-0 focus:border-primary-500 
                    cursor-pointer
                    hover:border-gray-300 dark:hover:border-gray-600
                    transition-colors
                ">
                    <option value="">Semua Tingkat</option>
                    @foreach(\App\Models\Tingkat::orderBy('name')->get() as $tingkat)
                    <option value="{{ $tingkat->id }}">
                        {{ $tingkat->name }}
                    </option>
                    @endforeach
                </select>

                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-400">
                    <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                </div>
            </div>
        </div>
    </div>


    {{-- ================= GRID DEPARTMENTS ================= --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @forelse ($this->getDepartments() as $dept)
        @php
        $slug = $dept->slug ?? Str::slug($dept->name ?? 'unknown');
        $theme = match($slug) {
        'tata-boga', 'kuliner' => ['color' => 'orange', 'border' => 'border-orange-500', 'text' => 'text-orange-600', 'icon' => 'heroicon-o-cake'],
        'software-engineering', 'rpl', 'pplg' => ['color' => 'blue', 'border' => 'border-blue-500', 'text' => 'text-blue-600', 'icon' => 'heroicon-o-code-bracket'],
        'network-engineering', 'tjkt' => ['color' => 'purple', 'border' => 'border-purple-500', 'text' => 'text-purple-600', 'icon' => 'heroicon-o-wifi'],
        default => ['color' => 'gray', 'border' => 'border-gray-500', 'text' => 'text-gray-600', 'icon' => 'heroicon-o-academic-cap'],
        };
        @endphp

        <div class="group relative flex flex-col h-full bg-white dark:bg-gray-900 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden">

            <div class="absolute top-0 inset-x-0 h-1 {{ $theme['border'] }}"></div>

            {{-- 1. HEADER IMAGE --}}
            <div class="relative h-44 w-full overflow-hidden bg-gray-200">
                <img src="{{ $dept->image? asset('uploads/' . $dept->image): asset('placeholder.svg') }}"
                    class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                    alt="{{ $dept->name }}">
                <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"></div>

                <div class="absolute top-3 right-3 p-2 rounded-xl backdrop-blur-md bg-white/90 dark:bg-black/50 shadow-sm">
                    @svg($theme['icon'], 'w-5 h-5 ' . $theme['text'])
                </div>

                <div class="absolute bottom-4 left-5 right-5">
                    <h3 class="text-xl font-bold text-white drop-shadow-lg leading-tight">{{ $dept->name }}</h3>
                </div>
            </div>

            {{-- 2. CONTENT BODY --}}
            <div class="p-5 flex flex-col flex-grow">

                {{-- PERBAIKAN: Section Kepala Program --}}
                <div class="flex items-center gap-3 mb-5 pb-5 border-b border-gray-100 dark:border-gray-800">
                    <div class="shrink-0">
                        <img src="{{ $dept->headOfDepartment?->image ? asset('uploads/' . $dept->headOfDepartment->image) : 'https://ui-avatars.com/api/?name='.urlencode($dept->headOfDepartment?->name ?? 'User').'&color=7F9CF5&background=EBF4FF' }}"
                            class="w-10 h-10 rounded-full object-cover border border-gray-200"
                            alt="Avatar">
                    </div>
                    <div class="min-w-0">
                        <p class="text-[10px] font-bold uppercase text-gray-400 tracking-wider">Kepala Program</p>
                        <p class="text-sm font-semibold text-gray-900 dark:text-white truncate">
                            {{ $dept->headOfDepartment?->name ?? 'Belum Ditentukan' }}
                        </p>
                    </div>
                </div>

                {{-- Quick Stats --}}
                <div class="grid grid-cols-2 gap-3 mb-6">
                    <div class="p-3 rounded-xl bg-gray-50 dark:bg-gray-800 border border-gray-100 dark:border-gray-700">
                        <div class="flex items-center gap-2 mb-1">
                            <x-heroicon-m-academic-cap class="w-4 h-4 text-gray-400" />
                            <span class="text-xs font-medium text-gray-500">Mapel</span>
                        </div>
                        <span class="text-lg font-bold text-gray-900 dark:text-white">
                            {{ $dept->modules_count }}

                        </span>
                    </div>
                    <div class="p-3 rounded-xl bg-gray-50 dark:bg-gray-800 border border-gray-100 dark:border-gray-700">
                        <div class="flex items-center gap-2 mb-1">
                            <x-heroicon-m-users class="w-4 h-4 text-gray-400" />
                            <span class="text-xs font-medium text-gray-500">Guru</span>
                        </div>
                        <span class="text-lg font-bold text-gray-900 dark:text-white">
                            {{ $dept->teachers_count ?? 0 }}
                        </span>
                    </div>
                </div>

                {{-- Actions --}}
                <div class="mt-auto flex gap-2">
                    <x-filament::button
                        tag="a"
                        color="gray"
                        outline
                        class="flex-1 justify-center"
                        :href="\App\Filament\Pages\ManageModulesClasses::getUrl(['department' => $dept->id]) . ($tingkatFilter ? '?tingkat=' . $tingkatFilter : '')">
                        Kelola
                    </x-filament::button>

                    <x-filament::button
                        color="danger"
                        icon="heroicon-m-trash"
                        icon-alias="delete-button"
                        wire:click="confirmDelete({{ $dept->id }})"
                        class="px-3" />
                </div>
            </div>
        </div>
        @empty
        {{-- Bagian empty tetap sama --}}
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