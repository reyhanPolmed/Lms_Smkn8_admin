<x-filament::page>
    <div class="space-y-6">
        
        {{-- Header Section (Tetap Sama) --}}
        <div class="relative overflow-hidden rounded-2xl bg-gradient-to-br from-primary-600 to-indigo-700 p-8 shadow-lg">
            <div class="absolute right-0 top-0 -mr-16 -mt-16 h-64 w-64 rounded-full bg-white/10 blur-3xl"></div>
            <div class="relative z-10 flex flex-col md:flex-row md:items-end md:justify-between gap-4">
                <div>
                    <h1 class="text-3xl font-black tracking-tight text-white">
                        Daftar Siswa
                    </h1>
                    <p class="mt-2 text-primary-100 max-w-xl">
                        Kelola data siswa, pantau status akademik, dan administrasi kelas dalam satu tampilan kartu yang ringkas.
                    </p>
                </div>
                <div class="flex items-center gap-3 bg-white/10 backdrop-blur-md px-4 py-2 rounded-lg border border-white/20">
                    <x-heroicon-m-users class="w-6 h-6 text-white" />
                    <div class="flex flex-col">
                        <span class="text-xs text-primary-200 font-bold uppercase tracking-wider">Total Siswa</span>
                        <span class="text-xl font-bold text-white leading-none">{{ $students->count() }}</span>
                    </div>
                </div>
            </div>
        </div>

        {{-- Grid Container --}}
        <div class="min-h-[400px]">
            @if($students->count() > 0)
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    
                    @foreach($students as $student)
                        @php
                            $status = $student->status ?? 'active';
                            $statusConfig = match($status) {
                                'active' => ['color' => 'success', 'bg' => 'bg-green-500', 'text' => 'text-green-600', 'border' => 'border-green-200', 'label' => 'Aktif'],
                                'pending' => ['color' => 'warning', 'bg' => 'bg-amber-500', 'text' => 'text-amber-600', 'border' => 'border-amber-200', 'label' => 'Menunggu'],
                                'inactive' => ['color' => 'danger', 'bg' => 'bg-red-500', 'text' => 'text-red-600', 'border' => 'border-red-200', 'label' => 'Nonaktif'],
                                default => ['color' => 'gray', 'bg' => 'bg-gray-500', 'text' => 'text-gray-600', 'border' => 'border-gray-200', 'label' => ucfirst($status)],
                            };
                        @endphp

                        {{-- CARD ITEM --}}
                        <div class="group relative flex flex-col bg-white dark:bg-gray-900 rounded-2xl shadow-sm border border-gray-200 dark:border-gray-800 hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden">
                            
                            {{-- Decorative Top Bar --}}
                            <div class="h-24 bg-gradient-to-r from-gray-100 to-gray-200 dark:from-gray-800 dark:to-gray-700 relative">
                                <div class="absolute top-3 right-3">
                                    <div class="flex items-center gap-1.5 bg-white/90 dark:bg-gray-800/90 backdrop-blur px-2.5 py-1 rounded-full shadow-sm border {{ $statusConfig['border'] }} dark:border-gray-600">
                                        <span class="w-2 h-2 rounded-full {{ $statusConfig['bg'] }} animate-pulse"></span>
                                        <span class="text-xs font-bold {{ $statusConfig['text'] }} dark:text-gray-300">{{ $statusConfig['label'] }}</span>
                                    </div>
                                </div>
                            </div>

                            {{-- Avatar Section --}}
                            <div class="relative flex justify-center -mt-12 mb-3">
                                <div class="p-1.5 bg-white dark:bg-gray-900 rounded-full">
                                    <x-filament::avatar 
                                        src="https://ui-avatars.com/api/?name={{ urlencode($student->name) }}&bold=true&background=random" 
                                        label="{{ substr($student->name, 0, 2) }}" 
                                        size="xl" 
                                        class="h-20 w-20 ring-4 ring-gray-50 dark:ring-gray-800 shadow-md" 
                                    />
                                </div>
                            </div>

                            {{-- Content Body --}}
                            <div class="flex-1 flex flex-col items-center px-6 pb-8 text-center">
                                {{-- Nama --}}
                                <h3 class="text-sm font-bold text-gray-900 dark:text-white line-clamp-1 group-hover:text-primary-600 transition-colors">
                                    {{ $student->name }}
                                </h3>
                                
                                {{-- ID Pill --}}
                                <span class="mt-1 px-3 py-0.5 rounded-full text-[10px] font-mono font-medium bg-gray-100 dark:bg-gray-800 text-gray-500 border border-gray-200 dark:border-gray-700">
                                    ID: {{ $student->id }}
                                </span>

                                {{-- Divider --}}
                                <div class="w-full h-px bg-gray-100 dark:bg-gray-800 my-5"></div>

                                {{-- Single Metric: Kelas (Dipusatkan karena Email dihapus) --}}
                                <div class="w-full">
                                    <div class="flex flex-col items-center justify-center p-3 rounded-xl bg-gray-50 dark:bg-gray-800/50 border border-transparent group-hover:border-gray-200 dark:group-hover:border-gray-700 transition-colors">
                                        <span class="text-[10px] text-gray-400 uppercase font-bold tracking-widest mb-1">Kelas Saat Ini</span>
                                        <span class="text-lg font-black text-gray-800 dark:text-white">
                                            {{ $student->tingkat?->name ?? $student->tingkat_id ?? '-' }}
                                        </span>
                                    </div>
                                </div>

                                {{-- Tombol "Lihat Detail" SUDAH DIHAPUS DISINI --}}
                            </div>
                        </div>
                    @endforeach
                </div>
            @else
                {{-- Empty State --}}
                <div class="flex flex-col items-center justify-center py-20 bg-white dark:bg-gray-900 rounded-3xl border-2 border-dashed border-gray-300 dark:border-gray-700">
                    <div class="p-4 bg-gray-50 dark:bg-gray-800 rounded-full mb-4">
                        <x-heroicon-o-users class="w-16 h-16 text-gray-400" />
                    </div>
                    <h3 class="text-lg font-bold text-gray-900 dark:text-white">Tidak ada data siswa</h3>
                    <p class="text-gray-500 dark:text-gray-400 text-sm mt-1">Belum ada siswa yang terdaftar di kelas ini.</p>
                </div>
            @endif
        </div>
        
        {{-- Footer Info --}}
        <div class="flex justify-center mt-8">
             <p class="text-xs text-gray-400 font-medium bg-gray-100 dark:bg-gray-800 px-4 py-1.5 rounded-full">
                Menampilkan {{ $students->count() }} Data
            </p>
        </div>

    </div>
</x-filament::page>