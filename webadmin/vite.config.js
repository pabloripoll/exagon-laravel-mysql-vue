import { fileURLToPath, URL } from 'url'
import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig(({ command, mode }) => {
    // Load env file based on `mode` in the current working directory followed by the path of .env location
    // Set the third parameter to '' to load all env regardless of the `VITE_` prefix.
    const env = loadEnv(mode, process.cwd()+'/docker/', '')

    return {
        plugins: [vue()],
        resolve: {
            alias: {
                '@': fileURLToPath(new URL('./src', import.meta.url))
            }
        },
        define: {
            ENV: JSON.stringify(env.APP_ENV),
        },
        server: {
            host: true,
            port: parseInt(env.COMPOSE_PROJECT_PORT),
        }
    }
})