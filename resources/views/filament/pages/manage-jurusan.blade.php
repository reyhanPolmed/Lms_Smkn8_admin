<x-filament-panels::page>
    <div class="p-6 space-y-6">

        {{-- ================= HEADER SECTION ================= --}}
        <div class="relative overflow-hidden bg-white dark:bg-gray-900 rounded-3xl border border-gray-200 dark:border-gray-800 shadow-lg mb-10">

            {{-- Background Patterns --}}
            <div class="absolute inset-0 bg-[radial-gradient(#e5e7eb_1px,transparent_1px)] dark:bg-[radial-gradient(#374151_1px,transparent_1px)] [background-size:20px_20px] opacity-30"></div>
            <div class="absolute top-0 right-0 w-96 h-96 bg-primary-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/3 pointer-events-none"></div>

            <div class="relative z-10 p-8 sm:p-10">
                <div class="flex flex-col md:flex-row md:items-start md:justify-between gap-6">
                    <div class="max-w-3xl">
                        <div class="flex items-center gap-3 mb-4">
                            <div class="h-8 w-1 bg-primary-500 rounded-full"></div>
                            <span class="text-xs font-bold uppercase tracking-widest text-primary-600 dark:text-primary-400">
                                Mata pelajaran aktif
                            </span>
                        </div>

                        <h1 class="text-3xl sm:text-4xl font-extrabold text-gray-900 dark:text-white tracking-tight mb-3">
                            Jurusan {{ $department->name }}
                        </h1>

                        <p class="text-base text-gray-500 dark:text-gray-400 leading-relaxed">
                            Pusat pengelolaan modul pembelajaran. Pantau statistik kelas, aktivitas pengajar, dan materi ajar dalam satu pandangan terintegrasi.
                        </p>
                    </div>

                    {{-- Stats Summary Badge --}}
                    <div class="flex-shrink-0">
                        <div class="bg-white/50 dark:bg-gray-800/50 backdrop-blur-sm border border-gray-200 dark:border-gray-700 rounded-2xl p-5 shadow-sm min-w-[140px] text-center">
                            <span class="block text-4xl font-black text-transparent bg-clip-text bg-gradient-to-br from-gray-900 to-gray-600 dark:from-white dark:to-gray-400">
                                {{ $allModules->count() }}
                            </span>
                            <span class="text-xs font-bold text-gray-500 uppercase tracking-widest mt-1 block">Total Mata pelajaran</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- ================= GRID MODULE ================= --}}
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

            @forelse($allModules as $index => $module)

            @php
            $accentColors = ['border-blue-500', 'border-emerald-500', 'border-amber-500', 'border-purple-500', 'border-rose-500'];
            $bgColors = ['bg-blue-500', 'bg-emerald-500', 'bg-amber-500', 'bg-purple-500', 'bg-rose-500']; // Added for badges
            $accent = $accentColors[$index % 5];
            $badgeBg = $bgColors[$index % 5];
            @endphp

            <div class="group relative flex flex-col h-full bg-white dark:bg-gray-900 rounded-3xl border border-gray-200 dark:border-gray-800 shadow-sm hover:shadow-2xl hover:shadow-gray-200/50 dark:hover:shadow-black/50 hover:-translate-y-1 transition-all duration-300 overflow-hidden">

                {{-- Top Accent Line --}}
                <div class="absolute top-0 left-0 right-0 h-1.5 {{ $accent }}"></div>

                {{-- 1. IMAGE HEADER --}}
                <div class="relative h-52 w-full overflow-hidden bg-gray-100 dark:bg-gray-800">
                    <img src="{{ $module->thumbnail? $module->thumbnail : asset('placeholder.svg') }}"
                        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                        alt="{{ $module->name }}">

                    {{-- Gradient Overlay --}}
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-900 via-gray-900/40 to-transparent opacity-90"></div>

                    {{-- Title on Image --}}
                    <div class="absolute bottom-0 left-0 right-0 p-6">
                        <div class="mb-2">
                            <span class="inline-flex items-center px-2 py-0.5 rounded text-[10px] font-medium bg-white/20 text-white backdrop-blur-md border border-white/10">
                                Modul Ajar
                            </span>
                        </div>
                        <h3 class="text-xl font-bold text-white leading-tight tracking-tight shadow-black drop-shadow-md">
                            {{ $module->title }}
                        </h3>
                    </div>
                </div>

                {{-- 2. CONTENT BODY --}}
                <div class="p-6 flex flex-col flex-grow">

                    {{-- Stats Information (Refined Layout) --}}
                    <div class="flex items-center gap-3 mb-6 p-3 rounded-xl bg-gray-50 dark:bg-gray-800/50 border border-gray-100 dark:border-gray-700/50">
                        <div class="p-2 rounded-lg bg-white dark:bg-gray-800 shadow-sm text-gray-500 dark:text-gray-400">
                            <x-heroicon-m-academic-cap class="w-5 h-5" />
                        </div>
                        <div class="flex flex-col">
                            <span class="text-[10px] uppercase text-gray-400 font-bold tracking-wider">Total Kelas</span>
                            <span class="text-sm font-bold text-gray-900 dark:text-white">
                                {{ $module->classes->count() }} Kelas Terdaftar
                            </span>
                        </div>
                    </div>

                    {{-- Action Button Container (Style Button Dipertahankan 100%) --}}
                    <div class="mt-auto pt-2">
                        <a href="{{ \App\Filament\Pages\ManageDepartmentClasses::getUrl(['department' => $module->id]) }}"
                            class="group/btn relative flex items-center justify-between w-full px-5 py-3 overflow-hidden rounded-xl bg-gradient-to-r from-primary-600 to-indigo-600 text-white shadow-md transition-all duration-300 hover:shadow-lg hover:shadow-primary-500/40 hover:-translate-y-0.5">

                            {{-- Efek Kilau Putih --}}
                            <div class="absolute inset-0 w-full h-full bg-white/10 opacity-0 group-hover/btn:opacity-100 transition-opacity duration-300"></div>

                            <span class="relative text-sm font-bold tracking-wide">kelola Mata Pelajaran</span>

                            {{-- Icon dengan Circle Background --}}
                            <div class="relative flex items-center justify-center w-6 h-6 rounded-full bg-white/20 group-hover/btn:bg-white/30 transition-colors">
                                <x-heroicon-m-arrow-right class="w-3.5 h-3.5 transform group-hover/btn:translate-x-0.5 transition-transform text-white" />
                            </div>
                        </a>
                    </div>

                </div>
            </div>

            @empty

            {{-- EMPTY STATE --}}
            <div class="col-span-full flex flex-col items-center justify-center py-24 bg-gray-50 dark:bg-gray-900/50 rounded-3xl border border-dashed border-gray-300 dark:border-gray-700">
                <div class="relative">
                    <div class="absolute -inset-4 bg-primary-100 dark:bg-primary-900/20 rounded-full blur-xl opacity-70"></div>
                    <div class="relative p-4 bg-white dark:bg-gray-800 rounded-2xl shadow-sm mb-4">
                        <x-heroicon-o-book-open class="w-10 h-10 text-primary-500" />
                    </div>
                </div>
                <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Belum Ada Modul</h3>
                <p class="text-gray-500 dark:text-gray-400 text-center max-w-sm">
                    Modul pembelajaran belum tersedia untuk jurusan ini. Silakan tambahkan data master terlebih dahulu.
                </p>
            </div>

            @endforelse

        </div>
    </div>

</x-filament-panels::page>