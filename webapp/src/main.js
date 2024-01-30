import { createApp } from 'vue'
import '../src/assets/theme/color/css/vendor.min.css'
import '../src/assets/theme/color/css/app.min.css'
import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(router)

app.mount('#app')




