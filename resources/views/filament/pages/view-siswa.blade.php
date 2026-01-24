<x-filament::page>
    {{-- Header & Breadcrumbs sudah dihandle secara otomatis oleh Filament Page --}}
    {{-- Namun jika ini adalah custom view, kita bisa menyusunnya seperti ini: --}}

    <div class="space-y-6">
        {{-- Page Heading & Action --}}
        <div class="flex items-end justify-between">
            <div>
                <h1 class="text-2xl font-bold tracking-tight text-gray-950 dark:text-white">
                    Daftar Siswa
                </h1>
                <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                    Kelola data seluruh siswa yang terdaftar di sistem.
                </p>
            </div>

            <x-filament::button icon="heroicon-m-plus" size="sm">
                Tambah Siswa
            </x-filament::button>
        </div>

        {{-- Search Section --}}
        <x-filament::card>
            <div class="relative">
                <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400">
                    <x-heroicon-m-magnifying-glass class="h-5 w-5" />
                </div>
                <input 
                    type="text" 
                    placeholder="Cari nama, email, atau ID siswa..." 
                    class="block w-full rounded-lg border-none bg-gray-100 pl-10 text-sm focus:ring-2 focus:ring-primary-600 dark:bg-gray-800 dark:text-white"
                >
            </div>
        </x-filament::card>

        {{-- Table Section --}}
        <x-filament::card class="p-0 overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full text-left divide-y divide-gray-200 dark:divide-white/5">
                    <thead>
                        <tr class="bg-gray-50 dark:bg-white/5">
                            <th class="px-6 py-3 text-xs font-semibold uppercase text-gray-500">ID</th>
                            <th class="px-6 py-3 text-xs font-semibold uppercase text-gray-500">Nama Lengkap</th>
                            <th class="px-6 py-3 text-xs font-semibold uppercase text-gray-500">Kelas</th>
                            <th class="px-6 py-3 text-xs font-semibold uppercase text-gray-500">Status</th>
                            <th class="px-6 py-3 text-xs font-semibold uppercase text-gray-500 text-right">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200 dark:divide-white/5">
                        {{-- Row 1 --}}
                        <tr class="hover:bg-gray-50 dark:hover:bg-white/5">
                            <td class="px-6 py-4 text-sm text-gray-500">S-1029</td>
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <x-filament::avatar src="" label="AF" size="sm" class="bg-primary-100 text-primary-600" />
                                    <div>
                                        <div class="text-sm font-medium text-gray-950 dark:text-white">Ahmad Fauzi</div>
                                        <div class="text-xs text-gray-500">ahmad.fauzi@example.com</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <x-filament::badge color="gray">X-IPA-1</x-filament::badge>
                            </td>
                            <td class="px-6 py-4">
                                <x-filament::badge color="success" icon="heroicon-m-check-circle">Aktif</x-filament::badge>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <x-filament::icon-button icon="heroicon-m-trash" color="danger" tooltip="Hapus" />
                            </td>
                        </tr>

                        {{-- Row 3 (Contoh Menunggu) --}}
                        <tr class="hover:bg-gray-50 dark:hover:bg-white/5">
                            <td class="px-6 py-4 text-sm text-gray-500">S-1031</td>
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <x-filament::avatar src="" label="BS" size="sm" class="bg-primary-100 text-primary-600" />
                                    <div>
                                        <div class="text-sm font-medium text-gray-950 dark:text-white">Budi Santoso</div>
                                        <div class="text-xs text-gray-500">budi.san@example.com</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <x-filament::badge color="gray">XI-IPS-1</x-filament::badge>
                            </td>
                            <td class="px-6 py-4">
                                <x-filament::badge color="warning">Menunggu</x-filament::badge>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <x-filament::icon-button icon="heroicon-m-trash" color="danger" />
                            </td>
                        </tr>

                        {{-- Row 5 (Contoh Nonaktif) --}}
                        <tr class="hover:bg-gray-50 dark:hover:bg-white/5">
                            <td class="px-6 py-4 text-sm text-gray-500">S-1033</td>
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <x-filament::avatar src="" label="ES" size="sm" class="bg-primary-100 text-primary-600" />
                                    <div>
                                        <div class="text-sm font-medium text-gray-950 dark:text-white">Eko Saputra</div>
                                        <div class="text-xs text-gray-500">eko.sap@example.com</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <x-filament::badge color="gray">XII-IPA-1</x-filament::badge>
                            </td>
                            <td class="px-6 py-4">
                                <x-filament::badge color="danger">Nonaktif</x-filament::badge>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <x-filament::icon-button icon="heroicon-m-trash" color="danger" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            {{-- Pagination Footer --}}
            <div class="flex items-center justify-between border-t border-gray-200 p-4 dark:border-white/5">
                <p class="text-sm text-gray-500">Menampilkan 1-5 dari 42 siswa</p>
                <div class="flex items-center gap-2">
                    <x-filament::button color="gray" size="sm" disabled icon="heroicon-m-chevron-left" />
                    <x-filament::button size="sm" variant="filled">1</x-filament::button>
                    <x-filament::button color="gray" size="sm" variant="outline">2</x-filament::button>
                    <x-filament::button color="gray" size="sm" icon="heroicon-m-chevron-right" />
                </div>
            </div>
        </x-filament::card>
    </div>
</x-filament::page>