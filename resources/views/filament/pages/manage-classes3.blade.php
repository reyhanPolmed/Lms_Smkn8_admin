<x-filament::page>

    {{-- ================= HEADER SECTION ================= --}}
    <div class="relative overflow-hidden bg-white dark:bg-gray-900 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm mb-8">
        {{-- Decorative Gradient Background --}}
        <div class="absolute inset-0 bg-gradient-to-r from-gray-50 to-white dark:from-gray-900 dark:to-gray-800"></div>
        <div class="absolute top-0 right-0 w-64 h-64 bg-primary-500/5 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
        
        <div class="relative z-10 p-8 flex flex-col md:flex-row md:items-center justify-between gap-6">
            <div>
                <div class="flex items-center gap-2 mb-3">
                    <span class="px-2 py-1 rounded text-[10px] font-bold uppercase tracking-widest bg-primary-50 text-primary-600 border border-primary-100 dark:bg-primary-900/30 dark:text-primary-400 dark:border-primary-800">
                        Department Dashboard
                    </span>
                </div>
                <h1 class="text-3xl font-bold text-gray-900 dark:text-white tracking-tight mb-2">
                    Jurusan {{ $department->name }}
                </h1>
                <p class="text-gray-500 dark:text-gray-400 max-w-xl text-sm leading-relaxed">
                    Kelola seluruh modul pembelajaran, pantau aktivitas guru pengampu, dan manajemen kelas dalam satu tampilan terpadu.
                </p>
            </div>

            {{-- Quick Stats Summary --}}
            <div class="flex gap-4">
                <div class="text-right px-4 py-2 border-r border-gray-200 dark:border-gray-700 last:border-0">
                    <span class="block text-2xl font-bold text-gray-900 dark:text-white">{{ $allModules->count() }}</span>
                    <span class="text-xs text-gray-500 font-medium uppercase tracking-wide">Total Module</span>
                </div>
            </div>
        </div>
    </div>

    {{-- ================= GRID MODULE ================= --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

        @forelse($allModules as $index => $module)

        @php
            // Variasi warna border atas untuk visual cue
            $accentColors = ['border-blue-500', 'border-emerald-500', 'border-amber-500', 'border-purple-500', 'border-rose-500'];
            $accent = $accentColors[$index % 5];
        @endphp

        <div class="group relative flex flex-col h-full bg-white dark:bg-gray-900 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden">
            
            {{-- Top Accent Line --}}
            <div class="absolute top-0 left-0 right-0 h-1 {{ $accent }}"></div>

            {{-- 1. IMAGE HEADER & BADGE --}}
            <div class="relative h-44 w-full overflow-hidden bg-gray-100">
                <img
                    src="{{ $module->foto ? url('/file/'.$module->foto) : '/placeholder.svg' }}"
                    class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                    alt="{{ $module->name }}">

                {{-- Dark Gradient Overlay --}}
                <div class="absolute inset-0 bg-gradient-to-t from-gray-900/90 via-gray-900/20 to-transparent"></div>

                {{-- Title on Image --}}
                <div class="absolute bottom-4 left-5 right-5">
                    <h3 class="text-lg font-bold text-white leading-tight shadow-black drop-shadow-md">
                        {{ $module->name }}
                    </h3>
                    <p class="text-xs text-gray-300 line-clamp-1 mt-1 opacity-90">
                        {{ $module->description ?? 'Deskripsi module belum diisi' }}
                    </p>
                </div>
            </div>

            {{-- 2. CONTENT BODY --}}
            <div class="p-5 flex flex-col flex-grow">

                {{-- Stats Row (Minimalist) --}}
                <div class="flex items-center justify-between py-3 mb-4 border-b border-gray-100 dark:border-gray-800">
                    <div class="flex items-center gap-2">
                        <div class="p-1.5 rounded-full bg-blue-50 text-blue-600 dark:bg-blue-900/30 dark:text-blue-400">
                            <x-heroicon-m-academic-cap class="w-4 h-4" />
                        </div>
                        <div class="flex flex-col">
                            <span class="text-[10px] uppercase text-gray-400 font-bold">Kelas</span>
                            <span class="text-sm font-bold text-gray-900 dark:text-white leading-none">
                                {{ $module->classes->count() }}
                            </span>
                        </div>
                    </div>

                    <div class="h-8 w-px bg-gray-100 dark:bg-gray-800"></div>

                    <div class="flex items-center gap-2">
                        <div class="p-1.5 rounded-full bg-purple-50 text-purple-600 dark:bg-purple-900/30 dark:text-purple-400">
                            <x-heroicon-m-users class="w-4 h-4" />
                        </div>
                        <div class="flex flex-col text-right">
                            <span class="text-[10px] uppercase text-gray-400 font-bold">Guru</span>
                            <span class="text-sm font-bold text-gray-900 dark:text-white leading-none">
                                {{ $module->teachers->count() }}
                            </span>
                        </div>
                    </div>
                </div>

                {{-- Teacher Avatar Stack --}}
                <div class="mb-5">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-xs font-medium text-gray-500">Tim Pengajar</p>
                    </div>
                    
                    <div class="flex items-center -space-x-2 overflow-hidden py-1">
                        @forelse($module->teachers->take(4) as $t)
                            <img class="inline-block h-8 w-8 rounded-full ring-2 ring-white dark:ring-gray-900 object-cover bg-gray-100" 
                                 src="{{ $t->foto ? url('/file/'.$t->foto) : 'https://ui-avatars.com/api/?name='.urlencode($t->name).'&background=random' }}" 
                                 alt="{{ $t->name }}"
                                 title="{{ $t->name }}">
                        @empty
                            <span class="text-xs text-gray-400 italic pl-1">Belum ada guru</span>
                        @endforelse

                        @if($module->teachers->count() > 4)
                            <div class="flex h-8 w-8 items-center justify-center rounded-full ring-2 ring-white dark:ring-gray-900 bg-gray-100 dark:bg-gray-800 text-[10px] font-bold text-gray-600 dark:text-gray-300">
                                +{{ $module->teachers->count() - 4 }}
                            </div>
                        @endif
                    </div>
                </div>

                {{-- Action Button --}}
                <div class="mt-auto">
                    <a href="{{ \App\Filament\Pages\ManageDepartmentClasses::getUrl(['department' => $module->id]) }}" 
                       class="group/btn flex items-center justify-between w-full px-4 py-2.5 bg-gray-50 dark:bg-gray-800 hover:bg-gray-900 dark:hover:bg-primary-600 text-gray-700 dark:text-gray-300 hover:text-white rounded-xl transition-all duration-200">
                        <span class="text-sm font-semibold">Kelola Module</span>
                        <x-heroicon-m-arrow-right class="w-4 h-4 transform group-hover/btn:translate-x-1 transition-transform" />
                    </a>
                </div>

            </div>
        </div>

        @empty

        {{-- EMPTY STATE --}}
        <div class="col-span-full flex flex-col items-center justify-center py-20 bg-white dark:bg-gray-900 rounded-2xl border border-dashed border-gray-300 dark:border-gray-700">
            <div class="p-4 bg-gray-50 dark:bg-gray-800 rounded-full mb-4 animate-pulse">
                <x-heroicon-o-squares-plus class="w-12 h-12 text-gray-400" />
            </div>
            <h3 class="text-lg font-bold text-gray-900 dark:text-white">Module Kosong</h3>
            <p class="text-gray-500 dark:text-gray-400 text-center max-w-sm mt-1">
                Belum ada module yang ditambahkan ke jurusan ini.
            </p>
        </div>

        @endforelse

    </div>

</x-filament::page>