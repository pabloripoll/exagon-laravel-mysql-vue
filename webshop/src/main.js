import { createApp } from 'vue'

import '../src/assets/theme/bootstrap/plugins/docsearch/docsearch.min.css'
import '../src/assets/theme/bootstrap/assets/css/bootstrap.min.css'
import '../src/assets/theme/bootstrap/plugins/fontawesome-free/css/all.min.css'
import '../src/assets/theme/bootstrap/custom/website.css'
//import 'https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap'

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(router)

app.mount('#app')




