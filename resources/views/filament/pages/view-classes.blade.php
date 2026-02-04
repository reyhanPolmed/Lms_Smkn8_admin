<x-filament::page>
    <div class="space-y-6">

        {{-- Header Section dengan gaya minimalis --}}
        <div class="flex items-center justify-between px-1">

            {{-- [BARU] Bagian Filter Combined --}}
            {{-- Container Filter Floating / Pill Style --}}
            <div class="flex items-center bg-white dark:bg-gray-900 rounded-full shadow-lg shadow-gray-200/50 dark:shadow-none border border-gray-200 dark:border-gray-700 p-1.5 transition-all duration-300 focus-within:ring-2 focus-within:ring-primary-500/50 focus-within:border-primary-500">

                {{-- Icon Funnel (Visual Anchor) --}}
                <div class="flex-shrink-0 pl-1 pr-1">
                    <div class="w-8 h-8 rounded-full bg-primary-50 dark:bg-primary-900/30 flex items-center justify-center">
                        <x-heroicon-m-funnel class="w-4 h-4 text-primary-600 dark:text-primary-400" />
                    </div>
                </div>

                {{-- Filter 1: Tingkat --}}
                <div class="relative group border-r border-gray-200 dark:border-gray-700 px-2">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-2 pointer-events-none">
                        <span class="text-xs font-bold text-gray-400 uppercase tracking-wider hidden sm:inline-block">Kelas</span>
                    </div>
                    <select wire:model.live="filterLevel"
                        class="bg-transparent border-none text-gray-700 dark:text-gray-200 text-sm font-semibold focus:ring-0 cursor-pointer py-2 pl-2 sm:pl-12 pr-8 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors w-full sm:w-auto">
                        <option value="">Semua</option>
                        <option value="1">Kelas X</option>
                        <option value="2">Kelas XI</option>
                        <option value="3">Kelas XII</option>
                    </select>
                </div>

                {{-- Filter 2: Jurusan --}}
                <div class="relative group px-2 flex-grow">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-2 pointer-events-none">
                        <x-heroicon-m-academic-cap class="w-4 h-4 text-gray-400" />
                    </div>
                    <select wire:model.live="filterDepartment"
                        class="bg-transparent border-none text-gray-700 dark:text-gray-200 text-sm font-semibold focus:ring-0 cursor-pointer py-2 pl-8 pr-8 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors w-full">
                        <option value="">Semua Jurusan</option>
                        {{-- Perbaikan loop sesuai format pluck('name', 'id') --}}
                        @foreach($departments as $id => $department)
                        <option value="{{ $department->id }}">{{ $department->name }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- Reset Button (Opsional: Muncul jika ada filter aktif) --}}
                @if($filterLevel || $filterDepartment)
                <button wire:click="$set('filterLevel', null); $set('filterDepartment', null)"
                    class="flex-shrink-0 mr-1 p-1.5 rounded-full text-gray-400 hover:text-danger-500 hover:bg-danger-50 dark:hover:bg-danger-900/20 transition-all"
                    title="Reset Filter">
                    <x-heroicon-m-x-mark class="w-4 h-4" />
                </button>
                @endif

            </div>

            {{-- Slot kanan (kosong/opsional) --}}
            <div></div>
        </div>

        {{-- Container Table Custom (SISANYA TETAP SAMA SEPERTI KODE ASLI) --}}
        <div class="overflow-x-auto pb-4"
            x-data="{ 
                openRows: [1], 
                toggle(id) {
                    if (this.openRows.includes(id)) {
                        this.openRows = this.openRows.filter(i => i !== id);
                    } else {
                        this.openRows.push(id);
                    }
                }
             }">

            <table class="w-full text-left border-separate border-spacing-y-4 px-2">
                {{-- ... (Kode Table Header dan Body tetap sama persis) ... --}}
                <thead>
                    <tr class="text-xs font-bold tracking-wider text-slate-800 uppercase dark:bg-gray-800 dark:text-gray-300">
                        <th class="px-6 py-2 w-12 text-center"> </th>
                        <th class="px-6 py-2">Nama Kelas</th>
                        <th class="px-6 py-2 text-center">Jurusan</th>
                        <th class="px-6 py-2 text-center">Wali Kelas</th>
                        <th class="px-6 py-2 text-right">Aksi</th>
                    </tr>
                </thead>

                <tbody class="text-sm">
                    @foreach ($classes as $class)

                    {{-- CLASS ROW (CARD STYLE) --}}
                    <tr x-on:click="toggle({{ $class->id }})"
                        class="group cursor-pointer transition-all duration-300 transform bg-white dark:bg-gray-900 shadow-sm hover:shadow-lg hover:-translate-y-1 rounded-xl border border-gray-200 dark:border-gray-800 relative z-10"
                        x-bind:class="openRows.includes({{ $class->id }}) 
                                        ? 'ring-2 ring-primary-500/50 dark:ring-primary-500/30' 
                                        : ''">

                        {{-- Icon Chevron --}}
                        <td class="px-6 py-5 rounded-l-xl bg-gray-50/50 dark:bg-gray-800/50 group-hover:bg-white dark:group-hover:bg-gray-800 transition-colors">
                            <div class="flex justify-center transition-transform duration-500"
                                x-bind:class="openRows.includes({{ $class->id }}) ? 'rotate-90' : ''">
                                <div class="p-1 rounded-full bg-white dark:bg-gray-700 shadow-sm ring-1 ring-gray-900/5">
                                    <x-filament::icon icon="heroicon-m-chevron-right"
                                        class="w-4 h-4"
                                        x-bind:class="openRows.includes({{ $class->id }}) ? 'text-primary-600' : 'text-gray-400'" />
                                </div>
                            </div>
                        </td>

                        {{-- Nama Kelas --}}
                        <td class="px-6 py-5">
                            <div class="flex flex-col">
                                <span class="text-lg font-bold text-gray-900 dark:text-white group-hover:text-primary-600 transition-colors">
                                    {{ $class->name }}
                                </span>
                                <span class="text-xs text-gray-400">ID: #{{ $class->id }}</span>
                            </div>
                        </td>

                        {{-- Jurusan --}}
                        <td class="px-6 py-5 text-center">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800 dark:bg-gray-800 dark:text-gray-200 border border-gray-200 dark:border-gray-700">
                                {{ $class->department?->name ?? '-' }}
                            </span>
                        </td>

                        {{-- Wali Kelas --}}
                        <td class="px-6 py-5">
                            <div class="flex flex-col items-center justify-center" x-on:click.stop="">
                                @if(isset($class->homeroomTeacher?->name))
                                <div class="flex items-center gap-3 p-1 pr-3 rounded-full bg-gray-50 dark:bg-gray-800 border border-gray-200 dark:border-gray-700">
                                    <img src="https://ui-avatars.com/api/?name={{ urlencode($class->homeroomTeacher?->name) }}&background=random&color=fff"
                                        class="w-8 h-8 rounded-full ring-2 ring-white dark:ring-gray-900">
                                    <span class="text-sm font-semibold text-gray-700 dark:text-gray-200 line-clamp-1 max-w-[120px]">
                                        {{ $class->homeroomTeacher?->name }}
                                    </span>
                                </div>
                                @else
                                <span class="flex items-center gap-1.5 px-3 py-1 text-xs font-medium text-red-600 bg-red-50 rounded-full border border-red-100 dark:bg-red-900/20 dark:text-red-400 dark:border-red-900/30">
                                    <x-heroicon-m-exclamation-circle class="w-3 h-3" />
                                    Belum ditugaskan
                                </span>
                                @endif
                            </div>
                        </td>

                        {{-- Actions --}}
                        <td class="px-6 py-5 rounded-r-xl text-right">
                            <div class="flex items-center justify-end gap-2" x-on:click.stop="">
                                <div class="flex bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg shadow-sm p-1">
                                    <x-filament::icon-button icon="heroicon-m-pencil-square" color="warning" size="sm" wire:click="openEditClass({{ $class->id }})" tooltip="Edit Kelas" />
                                    <div class="w-px h-4 bg-gray-200 dark:bg-gray-700 mx-1 self-center"></div>
                                    <x-filament::icon-button icon="heroicon-m-trash" color="danger" size="sm" wire:click="openDeleteClass({{ $class->id }})" tooltip="Hapus Kelas" />
                                </div>

                                <a href="{{ \App\Filament\Pages\ViewSiswa::getUrl(['class' => $class->id]) }}"
                                    class="inline-flex items-center justify-center w-8 h-8 rounded-lg bg-primary-50 text-primary-600 hover:bg-primary-100 hover:scale-105 transition-all dark:bg-primary-900/30 dark:text-primary-400">
                                    <x-filament::icon icon="heroicon-m-users" class="w-4 h-4" />
                                </a>
                            </div>
                        </td>
                    </tr>

                    {{-- SUBJECT DETAIL (EXPANDED ROW) --}}
                    <tr x-show="openRows.includes({{ $class->id }})" x-collapse.duration.500ms x-cloak>
                        <td colspan="5" class="p-0 border-none">
                            <div class="mx-4 -mt-2 mb-6 p-6 bg-gray-50 dark:bg-gray-900/50 border-x border-b border-gray-200 dark:border-gray-700 rounded-b-xl shadow-inner relative z-0">

                                {{-- Header Bagian Modul --}}
                                <div class="flex items-center gap-2 mb-4 text-gray-500">
                                    <x-heroicon-o-squares-2x2 class="w-4 h-4" />
                                    <span class="text-xs font-bold uppercase tracking-widest">Daftar Mata Pelajaran & Guru</span>
                                </div>

                                {{-- Grid Layout untuk Modul --}}
                                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                    @foreach ($class->modules as $module)
                                    <div class="relative group bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-xl p-4 shadow-sm hover:shadow-md transition-all duration-300 hover:border-primary-200 dark:hover:border-primary-800">

                                        {{-- Top: Mapel Info --}}
                                        <div class="flex justify-between items-start mb-4">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 rounded-lg bg-gradient-to-br from-primary-500 to-primary-700 text-white flex items-center justify-center shadow-lg shadow-primary-500/30">
                                                    <span class="text-xs font-bold">{{ substr($module->title, 0, 2) }}</span>
                                                </div>
                                                <div>
                                                    <h4 class="text-sm font-bold text-gray-900 dark:text-white line-clamp-1" title="{{ $module->title }}">
                                                        {{ $module->title }}
                                                    </h4>
                                                    <p class="text-[10px] font-mono text-gray-400">{{ $module->code }}</p>
                                                </div>
                                            </div>

                                            {{-- Status Badge (Pojok Kanan Atas Kartu) --}}
                                            <div class="flex-shrink-0">
                                                @if($module->pivot->teacher)
                                                <div class="w-2 h-2 bg-success-500 rounded-full shadow-[0_0_8px_rgba(34,197,94,0.6)]"></div>
                                                @else
                                                <div class="w-2 h-2 bg-danger-500 rounded-full animate-pulse"></div>
                                                @endif
                                            </div>
                                        </div>

                                        {{-- Divider --}}
                                        <div class="h-px w-full bg-gray-100 dark:bg-gray-700 mb-3"></div>

                                        {{-- Bottom: Guru Info --}}
                                        {{-- Bottom Section: Guru + Jadwal --}}
                                        @php
                                        $teacher = $module->pivot->teacher ?? null;

                                        $moduleSchedules = collect($schedulesByClass[$class->id] ?? [])
                                        ->filter(fn($s) =>
                                        $s->moduleStudentClass->module_id == $module->id
                                        );
                                        @endphp

                                        <div class="space-y-2">

                                            {{-- Guru --}}
                                            <div class="flex items-center justify-between">
                                                <div class="flex items-center gap-2">

                                                    @if($teacher)
                                                    <div class="w-6 h-6 rounded-full bg-gray-100 dark:bg-gray-700 flex items-center justify-center text-[10px] font-bold">
                                                        {{ substr($teacher->name, 0, 1) }}
                                                    </div>

                                                    <span class="text-xs font-medium text-gray-700 dark:text-gray-300 truncate">
                                                        {{ $teacher->name }}
                                                    </span>
                                                    @else
                                                    <span class="text-xs text-danger-500 italic">
                                                        Belum ada guru
                                                    </span>
                                                    @endif

                                                </div>

                                                <button
                                                    wire:click="openTeacherModal('{{ $class->id }}', '{{ $module->id }}')"
                                                    class="text-gray-400 hover:text-primary-600 transition-colors p-1 rounded-md hover:bg-gray-50 dark:hover:bg-gray-700">
                                                    <x-heroicon-m-pencil-square class="w-4 h-4" />
                                                </button>
                                            </div>

                                            {{-- Jadwal --}}
                                            <div class="flex flex-wrap gap-1">
                                                @forelse($moduleSchedules as $s)
                                                <span class="text-[10px] px-2 py-0.5 rounded-md bg-primary-50 text-primary-700 dark:bg-primary-900/30 dark:text-primary-300 border border-primary-200 dark:border-primary-800">
                                                    {{ $s->hari->nama_hari }}
                                                    {{ \Carbon\Carbon::parse($s->rentangJam->jam_mulai)->format('H:i') }}
                                                    -
                                                    {{ \Carbon\Carbon::parse($s->rentangJam->jam_selesai)->format('H:i') }}
                                                </span>
                                                @empty
                                                <span class="text-[10px] text-gray-400 italic">
                                                    Belum ada jadwal
                                                </span>
                                                @endforelse
                                            </div>

                                        </div>

                                    </div>
                                    @endforeach
                                </div> {{-- End Grid --}}
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        {{-- MODAL AREA TETAP SAMA (TIDAK BERUBAH) --}}
        {{-- ========================= --}}
        {{-- MODAL: Guru + Jadwal --}}
        {{-- ========================= --}}
        <div x-data="{ isOpen: false }"
            x-show="isOpen"
            @open-teacher-modal.window="isOpen = true"
            @close-teacher-modal.window="isOpen = false"
            class="fixed inset-0 z-50 flex items-center justify-center p-4"
            style="display:none;">

            {{-- Overlay dengan Transisi Fade --}}
            <div x-show="isOpen"
                x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0"
                x-transition:enter-end="opacity-100"
                x-transition:leave="transition ease-in duration-200"
                x-transition:leave-start="opacity-100"
                x-transition:leave-end="opacity-0"
                class="fixed inset-0 bg-gray-900/50 backdrop-blur-sm"
                @click="isOpen = false">
            </div>

            {{-- Modal Content dengan Transisi Scale --}}
            <div x-show="isOpen"
                x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
                x-transition:leave="transition ease-in duration-200"
                x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
                x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                class="relative w-full max-w-lg bg-white dark:bg-gray-800 rounded-2xl shadow-xl overflow-hidden ring-1 ring-gray-900/5">

                {{-- Header --}}
                <div class="px-6 py-4 border-b border-gray-100 dark:border-gray-700 flex items-center justify-between bg-gray-50/50 dark:bg-gray-800">
                    <h3 class="text-lg font-bold flex items-center gap-2 text-gray-800 dark:text-white">
                        <div class="p-2 bg-primary-100 dark:bg-primary-900/30 rounded-lg">
                            <x-heroicon-m-calendar-days class="w-5 h-5 text-primary-600 dark:text-primary-400" />
                        </div>
                        Atur Guru & Jadwal
                    </h3>

                    <button @click="isOpen=false" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-200 transition-colors p-1 rounded-full hover:bg-gray-100 dark:hover:bg-gray-700">
                        <x-heroicon-m-x-mark class="w-6 h-6" />
                    </button>
                </div>

                {{-- Scrollable Content Area --}}
                <div class="p-6 space-y-8">

                    {{-- ================= --}}
                    {{-- Guru --}}
                    {{-- ================= --}}
                    <div class="space-y-2">
                        <label class="text-sm font-medium text-gray-700 dark:text-gray-300 block">
                            Guru Pengampu
                        </label>

                        <div class="relative">
                            <select wire:model="selectedTeacherId"
                                class="w-full rounded-xl border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 sm:text-sm dark:bg-gray-800 dark:border-gray-600 dark:text-white dark:focus:ring-primary-500 transition-shadow cursor-pointer py-2.5">
                                <option value="">-- Pilih Guru --</option>
                                @foreach($teachers as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    {{-- ================= --}}
                    {{-- Jadwal --}}
                    {{-- ================= --}}
                    <div class="space-y-4">

                        <div class="flex items-center justify-between border-b border-gray-100 dark:border-gray-700 pb-2">
                            <label class="text-sm font-medium text-gray-700 dark:text-gray-300">
                                Jadwal Mengajar
                            </label>

                            <button type="button"
                                wire:click="addScheduleRow"
                                class="group flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 bg-primary-50 text-primary-600 hover:bg-primary-100 rounded-lg transition-colors dark:bg-primary-900/20 dark:text-primary-400 dark:hover:bg-primary-900/40">
                                <x-heroicon-m-plus class="w-3.5 h-3.5" />
                                <span>Tambah</span>
                            </button>
                        </div>

                        <div class="space-y-3">
                            @if(empty($scheduleInputs))
                            <div class="text-center py-6 text-sm text-gray-400 dark:text-gray-500 bg-gray-50 dark:bg-gray-700/50 rounded-xl border border-dashed border-gray-200 dark:border-gray-600">
                                Belum ada jadwal yang diatur
                            </div>
                            @else
                            @foreach($scheduleInputs as $i => $row)
                            <div class="group flex items-center gap-3 animate-[fadeIn_0.3s_ease-out]" wire:key="schedule-{{ $i }}">

                                {{-- Grid Layout untuk Input --}}
                                <div class="grid grid-cols-2 gap-3 flex-1">
                                    {{-- Hari --}}
                                    <select wire:model="scheduleInputs.{{ $i }}.hari_id"
                                        class="block w-full rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-sm dark:bg-gray-800 dark:border-gray-600 dark:text-white">
                                        <option value="">Hari...</option>
                                        @foreach($haris as $hari)
                                        <option value="{{ $hari->id }}">{{ $hari->nama_hari }}</option>
                                        @endforeach
                                    </select>

                                    {{-- Jam --}}
                                    <select wire:model="scheduleInputs.{{ $i }}.rentang_jam_id"
                                        class="block w-full rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-sm dark:bg-gray-800 dark:border-gray-600 dark:text-white">
                                        <option value="">Jam...</option>
                                        @foreach($rentangJams as $jam)
                                        <option value="{{ $jam->id }}">{{ $jam->label }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                {{-- Hapus --}}
                                <button type="button"
                                    wire:click="removeScheduleRow({{ $i }})"
                                    class="p-2 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-all dark:hover:bg-red-900/20"
                                    title="Hapus Baris">
                                    <x-heroicon-m-trash class="w-5 h-5" />
                                </button>
                            </div>
                            @endforeach
                            @endif
                        </div>
                    </div>

                </div>

                {{-- Footer --}}
                <div class="px-6 py-4 bg-gray-50 dark:bg-gray-800/50 flex justify-end gap-3 border-t border-gray-100 dark:border-gray-700">
                    <button @click="isOpen=false"
                        class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-200 dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-700">
                        Batal
                    </button>

                    <x-filament::button wire:click="saveTeacherAndSchedules" class="w-auto">
                        Simpan Perubahan
                    </x-filament::button>
                </div>

            </div>
        </div>


    </div>
</x-filament::page>