<x-filament::page>

@php
    $record = $department;
@endphp

<div class="flex lg:flex-row flex-col gap-[25px]">

    {{-- ================= LEFT ================= --}}
    <div class="flex flex-col gap-4 w-[390px]">

        <x-filament::section>

            <div class="flex items-center gap-2 mb-6">
                <div class="flex items-center justify-center w-8 h-8 rounded-full bg-blue-100">
                    <svg class="w-5 h-5 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v2h8v-2zM2 8a2 2 0 11-4 0 2 2 0 014 0zM6 15a4 4 0 00-8 0v2h8v-2z"/>
                    </svg>
                </div>
                <h2 class="text-sm font-bold text-gray-900">
                    Department Profile
                </h2>
            </div>



            {{-- NAME --}}
            <div class="flex flex-col gap-2">
                <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                    Department Name (Indonesian)
                </p>

                <input
                    type="text"
                    value="{{ $record->name }}"
                    class="block text-xs w-full rounded-lg bg-gray-50 px-3 py-2.5 text-sm text-gray-900"
                />
            </div>



            {{-- DISPLAY NAME --}}
            <div class="flex flex-col gap-2">
                <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                    Display Name (English)
                </p>

                <input
                    type="text"
                    value="{{ $record->description }}"
                    class="block text-xs w-full rounded-lg bg-gray-50 px-3 py-2.5 text-sm text-gray-900"
                />
            </div>



            {{-- KAPROG --}}
            <div class="flex flex-col gap-2">

                <p class="text-[10px] font-semibold text-gray-500 uppercase tracking-wide">
                    Head of Department (KAPROG)
                </p>

                @if($record->headOfDepartment)

                <div class="w-full flex items-center gap-3 p-3 bg-gray-50 rounded-lg border">

                    <img
                        src="{{ $record->headOfDepartment->foto
                            ? asset('storage/' . $record->headOfDepartment->foto)
                            : '/placeholder.svg' }}"
                        class="w-9 h-9 rounded-full object-cover"
                    >

                    <div>
                        <p class="text-[9px] font-semibold text-gray-900">
                            Selected: {{ $record->headOfDepartment->name }}
                        </p>

                        <p class="text-[10px] text-gray-500">
                            NIP. {{ $record->headOfDepartment->nip }}
                        </p>
                    </div>

                </div>

                @else
                    <p class="text-sm text-gray-500 italic">
                        No head of department assigned
                    </p>
                @endif

            </div>

        </x-filament::section>



        {{-- STATS --}}
        <x-filament::section>

            <h3 class="text-sm font-bold text-gray-900 mb-4">
                Quick Stats
            </h3>

            <div class="grid grid-cols-2 gap-4">

                <div>
                    <p class="text-[10px] font-semibold text-gray-500 uppercase">
                        Total Students
                    </p>

                    <p class="mt-1 text-lg font-bold">
                        {{ $record->classes->sum(fn($class) => $class->students->count()) }}
                    </p>
                </div>

                <div>
                    <p class="text-[10px] font-semibold text-gray-500 uppercase">
                        Total Teachers
                    </p>

                    <p class="mt-1 text-lg font-bold">
                        {{ $record->teachers->count() }}
                    </p>
                </div>

            </div>

        </x-filament::section>

    </div>



    {{-- ================= RIGHT ================= --}}
    <div class="w-full">

        <x-filament::section>

            <div class="flex justify-between items-center mb-5">

                <div>
                    <h2 class="text-md font-semibold">
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



            {{-- TABLE --}}
            <div class="border rounded-lg overflow-hidden">

                <table class="w-full text-xs">

                    <thead>
                        <tr class="bg-gray-50">

                            <th class="text-left px-4 py-3">Class Name</th>

                            <th class="text-left px-4 py-3">
                                Homeroom Teacher
                            </th>

                            <th class="text-center px-4 py-3">
                                Students
                            </th>

                            <th class="text-center px-4 py-3">
                                Actions
                            </th>

                        </tr>
                    </thead>



                    <tbody class="divide-y">

                    @foreach($record->classes as $class)

                        <tr class="hover:bg-gray-200">

                            <td class="px-4 py-3 text-[10px] font-medium">
                                {{ $class->name }}
                            </td>



                            {{-- WALI KELAS --}}
                            <td class="px-4 py-3">

                                @if($class->homeroomTeacher)

                                <div class="flex items-center gap-2">

                                    <img
                                        src="{{ $class->homeroomTeacher->foto
                                            ? asset('storage/' . $class->homeroomTeacher->foto)
                                            : '/placeholder.svg' }}"
                                        class="w-8 h-8 rounded-full object-cover"
                                    >

                                    <span>
                                        {{ $class->homeroomTeacher->name }}
                                    </span>

                                </div>

                                @else
                                    <span class="text-gray-400 italic">
                                        Not Assigned
                                    </span>
                                @endif

                            </td>



                            {{-- JUMLAH SISWA --}}
                            <td class="px-4 py-3 text-center font-semibold">
                                {{ $class->students->count() }}
                            </td>



                            {{-- ACTION --}}
                            <td class="px-4 py-3">

                                <div class="flex justify-center gap-1">

                                    <button class="p-2 text-gray-400 hover:text-blue-600">
                                        ✏
                                    </button>

                                    <button class="p-2 text-gray-400 hover:text-blue-600">
                                        ➕
                                    </button>

                                    <button class="p-2 text-gray-400 hover:text-red-600">
                                        🗑
                                    </button>

                                </div>

                            </td>

                        </tr>

                    @endforeach

                    </tbody>

                </table>

            </div>

        </x-filament::section>

    </div>

</div>

</x-filament::page>
