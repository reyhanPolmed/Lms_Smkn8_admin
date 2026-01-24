<x-filament::page>

    {{-- ============================= --}}
    {{-- DUMMY DATA --}}
    {{-- ============================= --}}
    @php
    $classes = [
    (object)[
    'id' => 1,
    'name' => 'Class 10-A',
    'grade' => 10,
    'major' => 'Science',
    'subjects' => collect([
    (object)['name' => 'Mathematics (Advanced)', 'code' => 'MATH-101-A', 'icon' => 'heroicon-s-calculator', 'color' => 'orange', 'teacher' => 'Sarah Wilson, M.Sc.'],
    (object)['name' => 'Physics (Laboratory)', 'code' => 'PHYS-102-A', 'icon' => 'heroicon-s-beaker', 'color' => 'blue', 'teacher' => null],
    ])
    ],
    (object)[
    'id' => 2,
    'name' => 'Class 11-B',
    'grade' => 11,
    'major' => 'Computer Engineering',
    'subjects' => collect([
    (object)['name' => 'Web Programming', 'code' => 'WEB-201', 'icon' => 'heroicon-s-code-bracket', 'color' => 'purple', 'teacher' => 'Michael Chen'],
    ])
    ],
    ];
    @endphp

    <x-filament::section>
        <x-slot name="heading">Class & Subject List</x-slot>

        <div class="overflow-x-auto -mx-6">
            <table class="w-full text-left border-collapse ">
                <thead>
                    <tr class="bg-gray-50/50 dark:bg-gray-800/50 border-y border-gray-200 dark:border-gray-700 text-gray-500 uppercase text-[10px] font-black tracking-widest">
                        <th class="px-6 py-4 w-12 text-center"> </th>
                        <th class="px-6 py-4">Class Name</th>
                        <th class="px-6 py-4 text-center">Grade</th>
                        <th class="px-6 py-4">Major/Stream</th>
                        <th class="px-6 py-4 text-center">Wali Kelas</th>
                        <th class="px-6 py-4 text-right">Actions</th>
                    </tr>
                </thead>

                <tbody
                    x-data="{ 
                        openRows: [1], 
                        toggle(id) {
                            if (this.openRows.includes(id)) {
                                this.openRows = this.openRows.filter(i => i !== id);
                            } else {
                                this.openRows.push(id);
                            }
                        }
                    }"
                    class="dark:divide-gray-700">
                    @foreach ($classes as $class)
                    {{-- CLASS ROW --}}
                    <tr
                        x-on:click="toggle({{ $class->id }})"
                        class="group cursor-pointer transition-all duration-300 py-10"
                        x-bind:class="openRows.includes({{ $class->id }}) 
                                ? 'bg-primary-50/40 dark:bg-primary-900/10' 
                                : 'hover:bg-gray-50 dark:hover:bg-gray-800 border-transparent'">
                        <td class="px-6 py-4">
                            <div class="transition-transform duration-500 flex justify-center"
                                x-bind:class="openRows.includes({{ $class->id }}) ? 'rotate-90' : ''">
                                <x-filament::icon icon="heroicon-m-chevron-right" class="w-5 h-5" x-bind:class="openRows.includes({{ $class->id }}) ? 'text-primary-600' : 'text-gray-400'" />
                            </div>
                        </td>
                        <td class="px-6 py-4 font-bold text-gray-900 dark:text-white">{{ $class->name }}</td>
                        <td class="px-6 py-4 text-center text-gray-600 dark:text-gray-400">Grade {{ $class->grade }}</td>
                        <td class="px-6 py-4 text-gray-600 dark:text-gray-400">{{ $class->major }}</td>
                        <td class="px-6 py-4">
                            <div class="flex flex-col items-center justify-center gap-1" x-on:click.stop="">
                                {{-- Logika Wali Kelas --}}
                                @if(isset($class->homeroom_teacher))
                                <div class="flex items-center gap-2">
                                    <img src="https://ui-avatars.com/api/?name={{ urlencode($class->homeroom_teacher) }}&background=random" class="w-6 h-6 rounded-full shadow-sm">
                                    <span class="text-sm font-medium text-gray-700 dark:text-gray-300">
                                        {{ $class->homeroom_teacher }}
                                    </span>
                                </div>
                                @else
                                <div class="flex items-center gap-2">
                                    <span class="text-xs italic text-danger-600 font-medium">
                                        Belum ditugaskan
                                    </span>
                                    <x-filament::icon-button
                                        icon="heroicon-m-plus-circle"
                                        color="gray"
                                        size="sm"
                                        tooltip="Tambah Wali Kelas"
                                        class="hover:text-primary-600 transition-colors" />
                                </div>
                                @endif
                            </div>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <div class="flex items-center justify-end gap-3" x-on:click.stop="">
                                {{-- Tombol Lihat Siswa --}}
                                <x-filament::button
                                    color="gray"
                                    icon="heroicon-m-users"
                                    icon-alias="panels::widgets.account.logout-button"
                                    size="sm"
                                    variant="outline"
                                    tag="a"
                                    :href="\App\Filament\Pages\ViewSiswa::getUrl()"
                                    class="text-xs font-bold uppercase tracking-wider transition-all hover:bg-gray-100 dark:hover:bg-gray-800">
                                    Lihat Siswa
                                </x-filament::button>
                            </div>
                        </td>
                    </tr>

                    {{-- SUBJECT DETAIL --}}
                    <tr x-show="openRows.includes({{ $class->id }})" x-collapse.duration.500ms x-cloak>
                        <td colspan="6" class="px-10 py-6 bg-gray-50/50 dark:bg-gray-950/20">
                            <div class="grid grid-cols-1 gap-3">
                                @foreach ($class->subjects as $subject)
                                <div class="flex items-center justify-between p-4 bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-xl shadow-sm hover:shadow-md transition-all duration-300 group/item">

                                    {{-- Info Subjek (Ikon Kalkulator Oranye) --}}
                                    <div class="flex items-center gap-4">
                                        <div class="w-10 h-10 rounded-lg flex items-center justify-center shadow-sm
                                                    {{ $subject->color === 'orange' ? 'bg-orange-500 text-white' : '' }}
                                                    {{ $subject->color === 'blue' ? 'bg-blue-600 text-white' : '' }}
                                                    {{ $subject->color === 'purple' ? 'bg-purple-600 text-white' : '' }}
                                                    {{ $subject->color === 'green' ? 'bg-green-600 text-white' : '' }}
                                                ">
                                            <x-filament::icon :icon="$subject->icon" class="w-6 h-6" />
                                        </div>
                                        <div>
                                            <p class="text-sm font-bold text-gray-900 dark:text-white leading-tight">{{ $subject->name }}</p>
                                            <p class="text-xs text-gray-400 font-medium mt-0.5 uppercase tracking-tight">{{ $subject->code }}</p>
                                        </div>
                                    </div>

                                    {{-- Sisi Kanan: Guru, Status & Edit --}}
                                    <div class="flex items-center gap-10">
                                        {{-- Guru Pengampu --}}
                                        <div class="flex flex-col items-start min-w-[200px]">
                                            <span class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">GURU PENGAMPU</span>
                                            <div class="flex items-center gap-2">
                                                @if($subject->teacher)
                                                <div class="w-7 h-7 rounded-full bg-gray-200 dark:bg-gray-700 flex items-center justify-center text-[10px] font-black text-gray-500 dark:text-gray-400 border border-white shadow-sm">
                                                    {{-- Inisial SM/Nama --}}
                                                    {{ collect(explode(' ', $subject->teacher))->map(fn($n) => substr($n, 0, 1))->take(2)->join('') }}
                                                </div>
                                                <span class="text-sm font-medium text-gray-800 dark:text-gray-200 tracking-tight">
                                                    {{ $subject->teacher }}
                                                </span>
                                                @else
                                                <span class="text-xs italic text-danger-500 font-medium">Belum ditugaskan</span>
                                                @endif
                                            </div>
                                        </div>

                                        {{-- Status Badge & Pencil Icon --}}
                                        <div class="flex items-center gap-4">
                                            <x-filament::badge color="success" size="sm" class="px-3 rounded-md uppercase font-bold text-[10px] border border-success-200">
                                                {{ $subject->teacher ? 'ASSIGNED' : 'PENDING' }}
                                            </x-filament::badge>

                                            <x-filament::icon-button
                                                icon="heroicon-m-pencil-square"
                                                size="sm"
                                                color="gray"
                                                class="text-gray-400 hover:text-primary-600 transition-colors" />
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </x-filament::section>

</x-filament::page>