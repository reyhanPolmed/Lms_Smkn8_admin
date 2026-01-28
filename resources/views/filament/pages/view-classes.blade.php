<x-filament::page>
    <div class="space-y-6">
        
        {{-- Header Section dengan gaya minimalis --}}
        <div class="flex items-center justify-between px-1">
            {{-- Slot untuk action tambahan jika diperlukan --}}
        </div>

        {{-- Container Table Custom --}}
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
                                    <x-filament::icon-button icon="heroicon-m-pencil-square" color="warning" size="sm" wire:click="openEditClass({{ $class->id }})" tooltip="Edit Kelas"/>
                                    <div class="w-px h-4 bg-gray-200 dark:bg-gray-700 mx-1 self-center"></div>
                                    <x-filament::icon-button icon="heroicon-m-trash" color="danger" size="sm" wire:click="openDeleteClass({{ $class->id }})" tooltip="Hapus Kelas"/>
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
                                        <div class="flex items-center justify-between">
                                            <div class="flex items-center gap-2">
                                                @if($module->pivot->teacher)
                                                    @php $teacherName = $module->pivot->teacher?->name; @endphp
                                                    <div class="w-6 h-6 rounded-full bg-gray-100 dark:bg-gray-700 flex items-center justify-center text-[10px] font-bold text-gray-600 dark:text-gray-300 ring-1 ring-white dark:ring-gray-600">
                                                        {{ substr($teacherName, 0, 1) }}
                                                    </div>
                                                    <span class="text-xs font-medium text-gray-600 dark:text-gray-300 truncate max-w-[100px]" title="{{ $teacherName }}">
                                                        {{ explode(' ', $teacherName)[0] }}
                                                    </span>
                                                @else
                                                    <span class="text-[10px] text-danger-500 italic flex items-center gap-1">
                                                        <x-heroicon-m-exclamation-triangle class="w-3 h-3" />
                                                        Kosong
                                                    </span>
                                                @endif
                                            </div>

                                            <button wire:click="openTeacherModal('{{ $class->id }}', '{{ $module->id }}')" 
                                                    class="text-gray-400 hover:text-primary-600 transition-colors p-1 rounded-md hover:bg-gray-50 dark:hover:bg-gray-700">
                                                <x-heroicon-m-pencil-square class="w-4 h-4" />
                                            </button>
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

        {{-- MODAL AREA (Style Diperhalus) --}}
        <div x-data="{ isOpen: false }"
             x-show="isOpen"
             @open-teacher-modal.window="isOpen = true"
             @close-teacher-modal.window="isOpen = false"
             class="fixed inset-0 z-50 flex items-center justify-center overflow-y-auto overflow-x-hidden p-4 md:inset-0 h-modal md:h-full"
             style="display: none;">
            
            {{-- Backdrop Blur --}}
            <div class="fixed inset-0 bg-gray-900/60 backdrop-blur-sm transition-opacity" 
                 x-show="isOpen"
                 x-transition.opacity
                 @click="isOpen = false"></div>

            {{-- Modal Content --}}
            <div x-show="isOpen"
                 x-transition:enter="transition ease-out duration-300"
                 x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                 x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
                 x-transition:leave="transition ease-in duration-200"
                 x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
                 x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                 class="relative w-full max-w-md bg-white rounded-2xl shadow-2xl ring-1 ring-gray-900/5 dark:bg-gray-800 dark:ring-white/10 overflow-hidden transform transition-all">

                <div class="flex items-center justify-between px-6 py-4 border-b border-gray-100 dark:border-gray-700 bg-gradient-to-r from-gray-50 to-white dark:from-gray-800 dark:to-gray-800/50">
                    <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                        <x-heroicon-m-user-plus class="w-5 h-5 text-primary-500" />
                        Tugaskan Guru
                    </h3>
                    <button @click="isOpen = false" type="button" class="text-gray-400 hover:text-gray-500 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-full p-1 transition-colors">
                        <x-heroicon-m-x-mark class="w-5 h-5" />
                    </button>
                </div>

                <div class="p-6 space-y-5">
                    <div class="bg-blue-50 dark:bg-blue-900/20 text-blue-700 dark:text-blue-300 p-3 rounded-lg text-sm flex items-start gap-2">
                        <x-heroicon-m-information-circle class="w-5 h-5 flex-shrink-0 mt-0.5" />
                        <p>Silakan pilih guru pengampu yang sesuai untuk mata pelajaran ini.</p>
                    </div>

                    <div class="space-y-2">
                        <label for="teacher" class="block text-sm font-bold text-gray-700 dark:text-gray-300">Daftar Guru Tersedia</label>
                        <div class="relative">
                             <select id="teacher"
                                wire:model="selectedTeacherId"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-xl focus:ring-primary-500 focus:border-primary-500 block w-full p-3 pl-4 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white transition-shadow focus:shadow-md">
                                <option value="">-- Pilih Guru --</option>
                                @foreach($teachers as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                                @endforeach
                            </select>
                        </div>

                        @error('selectedTeacherId')
                        <span class="flex items-center gap-1 text-xs text-danger-600 font-bold mt-1">
                            <x-heroicon-m-exclamation-circle class="w-3 h-3" />
                            {{ $message }}
                        </span>
                        @enderror
                    </div>
                </div>

                <div class="flex items-center justify-end p-4 px-6 gap-3 bg-gray-50 dark:bg-gray-900/50 border-t border-gray-100 dark:border-gray-700">
                    <button @click="isOpen = false" class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-600">
                        Batal
                    </button>
                    <x-filament::button wire:click="saveTeacher" class="shadow-lg shadow-primary-500/30">
                        Simpan Perubahan
                    </x-filament::button>
                </div>
            </div>
        </div>

    </div>
</x-filament::page>