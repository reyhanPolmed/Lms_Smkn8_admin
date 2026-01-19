    <x-filament::page>

    {{-- ================= HEADER ================= --}}
    <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-950 dark:text-white">
                Department & Class Setup
            </h1>
            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400 max-w-2xl">
                Organize vocational departments (Jurusan), assign department heads (Kaprog),
                and manage class structures for the active academic year.
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
            <img 
                src="{{ url('/file/' . $dept->foto) }}" 
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                alt="{{ $dept->name }}"
            >
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
            
            {{-- Head of Department (Card Style) --}}
            <div class="flex items-center gap-3 mb-5 p-3 rounded-lg border border-gray-100 dark:border-gray-800 bg-gray-50/50 dark:bg-gray-800/50">
                <img 
                    src="{{ $dept->headOfDepartment?->foto ? url('/file/' . $dept->headOfDepartment->foto) : 'https://ui-avatars.com/api/?name=NA&background=random' }}" 
                    class="w-10 h-10 rounded-full object-cover ring-2 ring-white dark:ring-gray-700"
                >
                <div class="flex flex-col">
                    <span class="text-[10px] uppercase font-bold text-gray-400 tracking-wider">Kaprog</span>
                    <span class="text-sm font-semibold text-gray-900 dark:text-white truncate max-w-[150px]">
                        {{ $dept->headOfDepartment?->name ?? 'Not Assigned' }}
                    </span>
                </div>
            </div>

            {{-- Classes List --}}
            <div class="mb-6 flex-grow">
                <div class="flex items-center justify-between mb-2">
                    <p class="text-xs font-semibold text-gray-500 uppercase">Active Classes</p>
                    <span class="text-xs font-bold {{ $theme['text'] }}">{{ $dept->classes->count() }} Classes</span>
                </div>
                
                <div class="flex flex-wrap gap-2">
                    @forelse ($dept->classes->take(4) as $class)
                        <span class="px-2 py-1 text-[10px] font-medium rounded-md border {{ $theme['border'] }} {{ $theme['badge'] }}">
                            {{ $class->name }}
                        </span>
                    @empty
                        <span class="text-xs text-gray-400 italic">No classes yet</span>
                    @endforelse
                    
                    @if($dept->classes->count() > 4)
                        <span class="px-2 py-1 text-[10px] font-medium rounded-md bg-gray-100 text-gray-500">
                            +{{ $dept->classes->count() - 4 }}
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
                        <span class="text-[10px] text-gray-500 uppercase tracking-wide">Students</span>
                    </div>
                    <div class="text-center">
                        <span class="block text-lg font-bold text-gray-900 dark:text-white">
                            {{ $dept->teachers->count() }}
                        </span>
                        <span class="text-[10px] text-gray-500 uppercase tracking-wide">Teachers</span>
                    </div>
                </div>

                <x-filament::button
                    tag="a"
                    color="gray"
                    class="w-full justify-center hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors"
                    :href="\App\Filament\Pages\ManageDepartmentClasses::getUrl(['department' => $dept->id])">
                    Manage Department
                </x-filament::button>
            </div>
        </div>
    </div>

    @empty
    <div class="col-span-full flex flex-col items-center justify-center p-10 bg-white dark:bg-gray-900 rounded-xl border border-dashed border-gray-300">
        <x-heroicon-o-building-office-2 class="w-12 h-12 text-gray-300 mb-2"/>
        <p class="text-gray-500 font-medium">Belum ada data jurusan.</p>
    </div>
    @endforelse
</div>

</x-filament::page>