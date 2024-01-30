import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig(({ command, mode }) => {
    // Load env file based on `mode` in the current working directory.
    // Set the third parameter to '' to load all env regardless of the `VITE_` prefix.
    const env = loadEnv(mode, process.cwd(), '')

    return {
        plugins: [vue()],
        define: {
            __APP_ENV__: JSON.stringify(env.APP_ENV),
        },
        server: {
            host: true,
            port: parseInt(env.PROJECT_PORT),
        }
    }
})