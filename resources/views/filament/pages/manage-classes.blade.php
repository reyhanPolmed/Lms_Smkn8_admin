<x-filament::page>

    @php
        $record = $department;
        $registeredClassIds = $record->classes->pluck('id')->toArray();
    @endphp

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 items-start">

        {{-- ============ LEFT COLUMN (SIDEBAR - Sticky) ============ --}}
        <div class="lg:col-span-1 space-y-6 lg:sticky lg:top-20">

            {{-- 1. CARD FOTO & STATS --}}
            <div class="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
                {{-- Decorative Header --}}
                <div class="h-24 bg-gradient-to-r from-blue-500 to-indigo-600 relative">
                    <div class="absolute -bottom-10 inset-x-0 flex justify-center">
                        <div class="relative group">
                            {{-- Foto Wrapper --}}
                            <div class="w-24 h-24 rounded-2xl border-4 border-white shadow-md overflow-hidden bg-gray-100">
                                @if($record->foto)
                                    <img src="{{ url('/file/' . $record->foto) }}" class="w-full h-full object-cover">
                                @else
                                    <div class="w-full h-full flex items-center justify-center text-gray-400">
                                        <x-heroicon-o-photo class="w-8 h-8"/>
                                    </div>
                                @endif
                            </div>

                            {{-- Overlay Upload Button --}}
                            <label class="absolute inset-0 flex items-center justify-center bg-black/50 text-white opacity-0 group-hover:opacity-100 transition-opacity cursor-pointer rounded-xl m-1">
                                <x-heroicon-o-camera class="w-6 h-6"/>
                                <input type="file" wire:model="foto" class="hidden" accept="image/*">
                            </label>
                            
                            {{-- Loading Spinner --}}
                            <div wire:loading wire:target="foto" class="absolute inset-0 flex items-center justify-center bg-white/80 z-20 m-1 rounded-xl">
                                <svg class="animate-spin h-6 w-6 text-blue-600" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- Stats Body --}}
                <div class="pt-12 pb-6 px-6 text-center">
                    <h3 class="text-lg font-bold text-gray-900">{{ $record->title ?? 'Nama Jurusan' }}</h3>
                    <p class="text-xs text-gray-500 mb-6">Profil & Statistik Singkat</p>

                    <div class="grid grid-cols-2 gap-4 border-t border-gray-100 pt-4">
                        <div class="text-center p-2 rounded-lg bg-gray-50">
                            <span class="block text-xl font-extrabold text-indigo-600">
                                {{ $record->classes->sum(fn($class) => $class->students->count()) }}
                            </span>
                            <span class="text-[10px] uppercase font-semibold text-gray-500 tracking-wider">Siswa</span>
                        </div>
                        <div class="text-center p-2 rounded-lg bg-gray-50">
                            <span class="block text-xl font-extrabold text-indigo-600">
                                {{ $record->teachers->count() }}
                            </span>
                            <span class="text-[10px] uppercase font-semibold text-gray-500 tracking-wider">Guru</span>
                        </div>
                    </div>
                </div>
            </div>

            {{-- 2. CARD HEAD OF DEPT --}}
            <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-5">
                <div class="flex items-center justify-between mb-4">
                    <h4 class="text-xs font-bold uppercase text-gray-500 tracking-wider">Ketua Jurusan</h4>
                    @if($record->headOfDepartment)
                        <span class="px-2 py-0.5 rounded text-[10px] font-bold bg-green-100 text-green-700">Aktif</span>
                    @endif
                </div>

                @if($record->headOfDepartment)
                    <div class="flex items-center gap-3">
                        <img src="{{ $record->headOfDepartment->foto ? url('/file/' . $record->headOfDepartment->foto) : 'https://ui-avatars.com/api/?name='.urlencode($record->headOfDepartment->name) }}" 
                             class="w-10 h-10 rounded-full object-cover ring-2 ring-gray-100">
                        <div>
                            <p class="text-sm font-semibold text-gray-900">{{ $record->headOfDepartment->name }}</p>
                            <p class="text-xs text-gray-500">NIP. {{ $record->headOfDepartment->nip }}</p>
                        </div>
                    </div>
                @else
                    <div class="flex flex-col items-center justify-center p-4 border border-dashed rounded-lg bg-gray-50">
                        <p class="text-xs text-gray-400 italic">Belum ditentukan</p>
                    </div>
                @endif
            </div>

        </div>

        {{-- ============ RIGHT COLUMN (MAIN CONTENT) ============ --}}
        <div class="lg:col-span-2 space-y-6">

            {{-- 1. FORM EDIT INFO (Moved here for better space) --}}
            <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-6">
                <div class="flex items-center gap-2 mb-6 pb-4 border-b border-gray-100">
                    <x-heroicon-o-pencil-square class="w-5 h-5 text-gray-400"/>
                    <h2 class="text-base font-bold text-gray-900">Edit Informasi</h2>
                </div>

                <div class="grid gap-5">
                    <div>
                        <label class="text-xs font-semibold text-gray-600 mb-1 block">Nama Jurusan</label>
                        <input type="text" wire:model="title" class="w-full text-sm rounded-lg border-gray-300 focus:border-indigo-500 focus:ring-indigo-500" placeholder="Masukkan nama jurusan...">
                    </div>
                    <div>
                        <label class="text-xs font-semibold text-gray-600 mb-1 block">Deskripsi</label>
                        <textarea rows="3" wire:model="description" class="w-full text-sm rounded-lg border-gray-300 focus:border-indigo-500 focus:ring-indigo-500" placeholder="Deskripsi singkat..."></textarea>
                    </div>
                    <div class="flex justify-end">
                        <x-filament::button size="sm" wire:click="save">
                            Simpan Perubahan
                        </x-filament::button>
                    </div>
                </div>
            </div>

            {{-- 2. TEACHER MANAGEMENT --}}
            <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-6">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-base font-bold text-gray-900">Guru Pengampu</h2>
                    <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded-full">{{ $department->teachers->count() }} Guru</span>
                </div>

                {{-- Add Teacher Bar --}}
                <div class="flex gap-2 mb-4 bg-gray-50 p-3 rounded-lg border border-gray-200">
                    <div class="flex-grow">
                        <select wire:model="teacher_id" class="w-full text-sm border-gray-300 rounded-lg focus:ring-indigo-500 focus:border-indigo-500">
                            <option value="">-- Tambah Guru Baru --</option>
                            @foreach($allTeachers as $teacher)
                                <option value="{{ $teacher->id }}">{{ $teacher->name }} ({{ $teacher->nip }})</option>
                            @endforeach
                        </select>
                    </div>
                    <button wire:click="attachTeacher" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition">
                        Tambah
                    </button>
                </div>

                {{-- Teacher Grid List --}}
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    @forelse($department->teachers as $teacher)
                        <div class="group flex items-center justify-between p-3 border border-gray-100 rounded-xl hover:bg-gray-50 hover:border-gray-300 transition-all duration-200">
                            <div class="flex items-center gap-3">
                                <img src="{{ $teacher->foto ? url('/file/' . $teacher->foto) : 'https://ui-avatars.com/api/?name='.urlencode($teacher->name) }}" 
                                     class="w-8 h-8 rounded-full object-cover">
                                <div class="overflow-hidden">
                                    <p class="text-xs font-bold text-gray-900 truncate w-32">{{ $teacher->name }}</p>
                                    <p class="text-[10px] text-gray-500">{{ $teacher->nip }}</p>
                                </div>
                            </div>
                            <button wire:click="detachTeacher({{ $teacher->id }})" class="text-gray-400 hover:text-red-500 p-1 opacity-0 group-hover:opacity-100 transition-opacity" title="Hapus">
                                <x-heroicon-m-trash class="w-4 h-4" />
                            </button>
                        </div>
                    @empty
                        <div class="col-span-full text-center py-6 text-gray-400 text-sm">Belum ada guru yang ditambahkan.</div>
                    @endforelse
                </div>
            </div>

            {{-- 3. CLASS MANAGEMENT TABLE --}}
            <div class="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
                <div class="p-6 border-b border-gray-100 flex justify-between items-center">
                    <div>
                        <h2 class="text-base font-bold text-gray-900">Daftar Kelas</h2>
                        <p class="text-xs text-gray-500 mt-1">Kelola kelas yang terhubung dengan jurusan ini.</p>
                    </div>
                    {{-- Legend --}}
                    <div class="flex gap-3">
                        <div class="flex items-center gap-1"><span class="w-2 h-2 rounded-full bg-green-500"></span><span class="text-[10px] text-gray-500">Terdaftar</span></div>
                        <div class="flex items-center gap-1"><span class="w-2 h-2 rounded-full bg-gray-300"></span><span class="text-[10px] text-gray-500">Tersedia</span></div>
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left">
                        <thead class="bg-gray-50 text-xs text-gray-500 uppercase font-semibold">
                            <tr>
                                <th class="px-6 py-3">Nama Kelas</th>
                                <th class="px-6 py-3">Wali Kelas</th>
                                <th class="px-6 py-3 text-center">Siswa</th>
                                <th class="px-6 py-3 text-center">Status & Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @foreach($allClasses as $class)
                            @php $isAttached = in_array($class->id, $registeredClassIds); @endphp
                            <tr class="hover:bg-gray-50 transition {{ $isAttached ? 'bg-green-50/30' : '' }}">
                                <td class="px-6 py-3 font-medium text-gray-900">
                                    {{ $class->name }}
                                </td>
                                <td class="px-6 py-3">
                                    <div class="flex items-center gap-2">
                                        @if($class->homeroomTeacher)
                                            <div class="w-6 h-6 rounded-full bg-indigo-100 text-indigo-600 flex items-center justify-center text-[10px] font-bold">
                                                {{ substr($class->homeroomTeacher->name, 0, 1) }}
                                            </div>
                                            <span class="text-xs text-gray-600 truncate max-w-[120px]">{{ $class->homeroomTeacher->name }}</span>
                                        @else
                                            <span class="text-xs text-gray-400 italic">-</span>
                                        @endif
                                    </div>
                                </td>
                                <td class="px-6 py-3 text-center">
                                    <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-gray-100 text-gray-800">
                                        {{ $class->students->count() }}
                                    </span>
                                </td>
                                <td class="px-6 py-3 text-center">
                                    @if($isAttached)
                                        <button wire:click="detachClass({{ $class->id }})" 
                                                class="inline-flex items-center gap-1 px-3 py-1.5 bg-white border border-red-200 text-red-600 text-xs font-medium rounded-lg shadow-sm hover:bg-red-50 hover:border-red-300 transition group">
                                            <span class="w-1.5 h-1.5 rounded-full bg-green-500 group-hover:bg-red-500 transition-colors"></span>
                                            <span>Lepas</span>
                                        </button>
                                    @else
                                        <button wire:click="attachClass({{ $class->id }})" 
                                                class="inline-flex items-center gap-1 px-3 py-1.5 bg-blue-600 text-white text-xs font-medium rounded-lg shadow-sm hover:bg-blue-700 transition">
                                            <x-heroicon-s-plus-circle class="w-3.5 h-3.5"/>
                                            <span>Tambah</span>
                                        </button>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </div>
</x-filament::page>