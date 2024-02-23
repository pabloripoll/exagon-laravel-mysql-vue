import { createApp } from 'vue'

import { createPinia } from 'pinia'

// Google Font: Source Sans Pro *remains to download fonts source
import '../src/assets/theme/adminlte/fonts/google-fonts.css'
// Font Awesome
import '../src/assets/theme/adminlte/plugins/fontawesome-free/css/all.min.css'
// Ionicons
import '../src/assets/theme/adminlte/plugins/ionicons/ionicons-2.0.1.min.css'
// Tempusdominus Bootstrap 4
import '../src/assets/theme/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'
// iCheck
import '../src/assets/theme/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css'
// JQVMap
import '../src/assets/theme/adminlte/plugins/jqvmap/jqvmap.min.css'
// Theme style
import '../src/assets/theme/adminlte/dist/css/adminlte.css'
// overlayScrollbars
import '../src/assets/theme/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'
// Daterange picker
import '../src/assets/theme/adminlte/plugins/daterangepicker/daterangepicker.css'
// summernote
import '../src/assets/theme/adminlte/plugins/summernote/summernote-bs4.min.css'
// pace-progress
import '../src/assets/theme/adminlte/plugins/pace-progress/themes/black/pace-theme-flat-top.css'
// Custom
import '../src/assets/theme/custom/custom.css'

// App Core

import App from './App.vue'

import Axios from './plugin/axios'

import router from './router'

// Create App
const app = createApp(App)

app.use(createPinia())

app.config.globalProperties.axios = Axios

app.use(router)

app.mount('#app')
