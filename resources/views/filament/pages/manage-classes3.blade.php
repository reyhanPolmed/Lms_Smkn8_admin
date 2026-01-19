<x-filament::page>

    @php
    // Mengambil data dari model yang dikirim (misal: $department)
    $record = $department;
    @endphp

    {{-- ================= HEADER ================= --}}
    {{-- ================= FILTER BAR ================= --}}

    {{-- Menggunakan w-full untuk memastikan grid mengambil seluruh lebar --}}
    <div class="flex lg:flex-row flex-col gap-[25px]">

        {{-- ============ LEFT (Department Info) ============ --}}
        <div class="flex flex-col gap-4 w-[390px]">
            <x-filament::section>
                <div class="flex items-center gap-2 mb-6">
                    <div class="flex items-center justify-center w-8 h-8 rounded-full bg-blue-100">
                        <svg class="w-5 h-5 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v2h8v-2zM2 8a2 2 0 11-4 0 2 2 0 014 0zM6 15a4 4 0 00-8 0v2h8v-2z" />
                        </svg>
                    </div>
                    <h2 class="text-sm font-bold text-gray-900">
                        {{ __('Department Profile') }}
                    </h2>
                </div>

                <div class="">
                    <h3 class="text-xs font-semibold text-gray-600 uppercase tracking-wide">
                        {{ __('Department Icon') }}
                    </h3>
                    <div class="flex items-center gap-2">
                        <div class="flex items-center justify-center w-18 h-18 rounded-lg">
                            @if($record->foto)
                            <img
                                src="{{ url('/file/' . $record->foto) }}"
                                class="w-18 h-18 rounded-lg object-cover" />
                            @else
                            <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2 5a2 2 0 012-2h12a2 2 0 012 2v10a2 2 0 01-2 2H4a2 2 0 01-2-2V5z" />
                            </svg>
                            @endif
                        </div>
                        <input
                            type="file"
                            id="fotoUpload"
                            wire:model="foto"
                            class="hidden"
                            accept="image/*" />

                        <x-filament::button
                            color="gray"
                            onclick="document.getElementById('fotoUpload').click()">
                            <div class="text-xs w-20">
                                {{ __('Change Image') }}
                            </div>
                        </x-filament::button>
                    </div>
                </div>

                <div class="space-y-4 w-full">
                    <div class="flex flex-col gap-2">
                        <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                            {{ __('Department Name (Indonesian)') }}
                        </p>
                        <input
                            type="text"
                            value="{{ $record->name }}"
                            class="block text-xs w-full rounded-lg outline-0 border-gray-200 shadow border border[1px] border-slate-200 bg-gray-50 px-3 py-2.5 text-sm text-gray-900"
                            placeholder="Nama jurusan..." />
                    </div>

                    <div class="flex flex-col gap-2">
                        <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                            {{ __('Display Name (English)') }}
                        </p>
                        <input
                            type="text"
                            value="{{ $record->description }}"
                            class="block text-xs w-full rounded-lg outline-0 border-gray-200 shadow border border[1px] border-slate-200 bg-gray-50 px-3 py-2.5 text-sm text-gray-900"
                            placeholder="Display name" />
                    </div>

                    <div class="flex flex-col gap-2">
                        <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide mb-1">
                            {{ __('Head of Department (KAPROG)') }}
                        </p>

                        @if($record->headOfDepartment)
                        <div class="w-full flex items-center gap-3 p-3 bg-gray-50 rounded-lg border border-gray-200">
                            <img src="{{ $record->headOfDepartment->foto ? url('/file/' . $record->headOfDepartment->foto) : '/placeholder.svg' }}"
                                alt="{{ $record->headOfDepartment->foto }}"
                                class="w-9 h-9 rounded-full object-cover">
                            <div>
                                <p class="text-[9px] font-semibold text-gray-900">
                                    {{ __('Selected:') }} {{ $record->headOfDepartment->name }}
                                </p>
                                <p class="text-[10px] text-gray-500">
                                    NIP. {{ $record->headOfDepartment->nip }}
                                </p>
                            </div>
                        </div>
                        @else
                        <p class="text-sm text-gray-500 italic">
                            {{ __('No head of department assigned') }}
                        </p>
                        @endif
                    </div>
                </div>
            </x-filament::section>

            <x-filament::section>
                <div class="">
                    <h3 class="text-sm font-bold text-gray-900 mb-4">
                        {{ __('Quick Stats') }}
                    </h3>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Total Students') }}
                            </p>
                            <p class="mt-1 text-lg font-bold text-gray-900">
                                {{-- Menggunakan logika sum dari relasi classes sesuai request --}}
                                {{ $record->classes->sum(fn($class) => $class->students->count()) }}
                            </p>
                        </div>
                        <div>
                            <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                                {{ __('Total Teachers') }}
                            </p>
                            <p class="mt-1 text-lg font-bold text-gray-900">
                                {{ $record->teachers->count() }}
                            </p>
                        </div>
                    </div>
                </div>
            </x-filament::section>
        </div>

        {{-- ============ RIGHT COLUMN (Class Management) ============ --}}
        <div class="w-full">
            <x-filament::section>

                <div class="flex justify-between items-center mb-5">
                    <div>
                        <h2 class="text-md font-semibold text-gray-900">
                            Class Management
                        </h2>
                        <p class="text-xs text-gray-500">
                            Tahun Akademik 2026/2027
                        </p>
                    </div>

                    <x-filament::button>
                        + Add New Class
                    </x-filament::button>
                </div>


                <div class="border border-slate-300 rounded-lg overflow-hidden bg-white">
                    <table class="w-full text-xs">
                        <thead>
                            <tr class="bg-gray-50">
                                <th class="text-left px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Class Name
                                </th>
                                <th class="text-left px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Homeroom Teacher
                                </th>
                                <th class="text-center px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Students
                                </th>
                                <th class="text-center px-4 py-3 text-xs font-semibold text-gray-600 uppercase">
                                    Actions
                                </th>
                            </tr>
                        </thead>

                        <tbody class="divide-y divide-gray-200">
                            @foreach($allClasses as $class)
                            <tr class="hover:bg-gray-200 transition">
                                <td class="px-4 py-3 text-[10px] font-medium text-gray-900">
                                    {{ $class->name }}
                                </td>

                                <td class="px-4 py-3 text-[10px] text-gray-600">
                                    {{ $class->department->name ?? '-' }}
                                </td>

                                <td class="px-4 py-3">
                                    @if($class->homeroomTeacher)
                                    <div class="flex items-center gap-2">
                                        <img
                                            src="{{ $class->homeroomTeacher->foto ? url('/file/' . $class->homeroomTeacher->foto) : '/placeholder.svg' }}"
                                            class="w-8 h-8 rounded-full object-cover">

                                        <span class="text-gray-800">
                                            {{ $class->homeroomTeacher->name }}
                                        </span>
                                    </div>
                                    @else
                                    <span class="text-gray-400 italic">
                                        Not Assigned
                                    </span>
                                    @endif
                                </td>

                                <td class="px-4 py-3 text-center font-semibold text-gray-900">
                                    {{ $class->students->count() }}
                                </td>
                            </tr>
                            @endforeach
                        </tbody>

                    </table>
                </div>

                <div class="mt-3 text-xs text-gray-500">
                    Classes are linked to Curriculum 2013 Revision.
                    <a href="#" class="text-primary-600 hover:underline">Change setting</a>
                </div>

            </x-filament::section>
        </div>

    </div>

</x-filament::page>