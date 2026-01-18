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

    {{-- ================= FILTER BAR ================= --}}
    <x-filament::card class="mb-8">
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">

            {{-- Left --}}
            <div class="flex items-center gap-2 overflow-x-auto">
                <x-filament::button
                    color="primary"
                    icon="heroicon-m-funnel"
                    size="sm"
                    outlined>
                    Filter
                </x-filament::button>

                <div class="h-6 w-px bg-gray-200 dark:bg-gray-700 mx-2 hidden md:block"></div>

                <button class="px-3 py-1.5 text-lg font-semibold rounded-lg
                    bg-primary-50 text-primary-600
                    dark:bg-primary-900/20 dark:text-primary-400">
                    All
                </button>

                <button class="px-3 py-1.5 text-sm font-medium rounded-lg
                    text-gray-600 hover:bg-gray-100
                    dark:text-gray-400 dark:hover:bg-gray-800">
                    Technology
                </button>

                <button class="px-3 py-1.5 text-sm font-medium rounded-lg
                    text-gray-600 hover:bg-gray-100
                    dark:text-gray-400 dark:hover:bg-gray-800">
                    Business
                </button>

                <button class="px-3 py-1.5 text-sm font-medium rounded-lg
                    text-gray-600 hover:bg-gray-100
                    dark:text-gray-400 dark:hover:bg-gray-800">
                    Creative Arts
                </button>
            </div>

            {{-- Right --}}
            <x-filament::input.wrapper>
                <x-filament::input.select class="text-sm">
                    <option>2023/2024 Academic Year</option>
                    <option>2024/2025 Academic Year</option>
                </x-filament::input.select>
            </x-filament::input.wrapper>
        </div>
    </x-filament::card>

    {{-- ================= GRID ================= --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @forelse ($this->getDepartments() as $dept)

        @php
        $theme = match($dept->slug) {
        'rpl', 'software-engineering' => ['bg' => 'bg-blue-100 dark:bg-blue-900/20', 'text' => 'text-blue-600 dark:text-blue-400', 'icon' => 'heroicon-o-code-bracket'],
        'tkj', 'network-engineering' => ['bg' => 'bg-purple-100 dark:bg-purple-900/20', 'text' => 'text-purple-600 dark:text-purple-400', 'icon' => 'heroicon-o-wifi'],
        'ak', 'accounting' => ['bg' => 'bg-green-100 dark:bg-green-900/20', 'text' => 'text-green-600 dark:text-green-400', 'icon' => 'heroicon-o-banknotes'],
        default => ['bg' => 'bg-gray-100 dark:bg-gray-800', 'text' => 'text-gray-600 dark:text-gray-300', 'icon' => 'heroicon-o-academic-cap'],
        };
        @endphp

        <x-filament::card class="flex flex-col h-full">

            {{-- Top --}}
            <div class="flex justify-between items-start mb-4">
                <img src="{{ url('/file/' . $dept->foto) }}" class="w-[250px] h-[150px] rounded-sm object-cover">
            </div>

            {{-- Title --}}
            <div class="mb-6">
                <h3 class="text-lg font-bold text-gray-900 dark:text-white">
                    {{ $dept->name }}
                </h3>
            </div>

            {{-- Kaprog --}}
            <div class="mb-6">
                <p class="text-xs font-semibold text-gray-400 uppercase mb-3">
                    Head of Department
                </p>
                <div class="flex gap-4">
                    <img src="{{ $dept->headOfDepartment?->foto ? url('/file/' . $dept->headOfDepartment->foto) : '/placeholder.svg' }}" class="w-8 h-8 rounded-full object-cover">
                    <p class="text-sm font-medium text-gray-900 dark:text-white">
                        {{ $dept->headOfDepartment?->name ?? 'Not Assigned' }}
                    </p>
                </div>
            </div>

            {{-- Classes --}}
            <div class="mb-6 flex-grow">
                <p class="text-xs font-semibold text-gray-400 uppercase mb-3">
                    Active Classes ({{ $dept->classes->count() }})
                </p>
                <div class="flex flex-wrap gap-2">
                    @foreach ($dept->classes->take(5) as $class)
                    <span class="px-2.5 py-1 text-xs rounded-md
                                bg-gray-100 text-gray-700
                                dark:bg-gray-800 dark:text-gray-300 border">
                        {{ $class->name }}
                    </span>
                    @endforeach
                </div>
            </div>

            {{-- Footer --}}
            <div class="mt-auto pt-4 border-t border-gray-200 dark:border-gray-800">
                <div class="grid grid-cols-2 gap-4 mb-4">
                    <div>
                        <p class="text-xs text-gray-500">Students</p>
                        <p class="text-xl font-bold text-gray-900 dark:text-white">
                            {{ $dept->classes->sum(fn($class) => $class->students->count()) }}
                        </p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">Teachers</p>
                        <p class="text-xl font-bold text-gray-900 dark:text-white">
                            {{ $dept->teachers->count() }}
                        </p>
                    </div>
                </div>

                <x-filament::button
                    tag="a"
                    color="gray"
                    outlined
                    class="w-full"
                    :href="\App\Filament\Pages\ManageDepartmentClasses::getUrl(['department' => $dept->id])">
                    Manage Classes
                </x-filament::button>
            </div>

        </x-filament::card>

        @empty
        <x-filament::card class="col-span-full text-center">
            Belum ada data jurusan.
        </x-filament::card>
        @endforelse
    </div>

</x-filament::page>