export default {
    content: [
        './app/Filament/**/*.php',
        './resources/views/filament/pages/manage-classes.blade.php',
        './resources/views/filament/pages/view-departments.blade.php',
        './resources/css/filament/**/*.css',
        './vendor/filament/**/*.blade.php',
    ],
    theme: {
        extend: {
                        colors: {
                primary: {
                    50: '#eef2ff',
                    500: '#6366f1',
                    700: '#4338ca',
                },

                brand: '#0EA5E9',
            },

            height: {
                '128': '32rem',
                '144': '36rem',
            },

            width: {
                '100': '25rem',
                '120': '30rem',
            },

        },
    },
    plugins: [],
}
