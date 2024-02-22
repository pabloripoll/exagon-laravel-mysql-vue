<script setup>
import DashboardWelcome from './components/Dashboard/DashboardWelcome.vue'
</script>
<template>
    <DashboardWelcome />
</template>
<script>

export default {
    data: () => ({
        //
    }),
    mounted() {
        console.log('dashboard')
        //
        let themejs_charts = document.createElement('script')
        let themejs_sparkline = document.createElement('script')
        let themejs_jqueryVmap = document.createElement('script')
        let themejs_jqueryVmapUsa = document.createElement('script')
        let themejs_jqueryKnob = document.createElement('script')
        let themejs_moment = document.createElement('script')
        let themejs_daterangepicker = document.createElement('script')
        let themejs_tempusdominus = document.createElement('script')
        let themejs_summernote = document.createElement('script')
        let themejs_overlayScrollbars = document.createElement('script')
        let themejs_dashboard = document.createElement('script')

        themejs_charts.setAttribute('src', '../src/assets/theme/adminlte/plugins/chart.js/Chart.min.js')
        themejs_sparkline.setAttribute('src', '../src/assets/theme/adminlte/plugins/sparklines/sparkline.js')
        // JQVMap -->
        themejs_jqueryVmap.setAttribute('src', '../src/assets/theme/adminlte/plugins/jqvmap/jquery.vmap.min.js')
        themejs_jqueryVmapUsa.setAttribute('src', '../src/assets/theme/adminlte/plugins/jqvmap/maps/jquery.vmap.usa.js')
        // jQuery Knob Chart -->
        themejs_jqueryKnob.setAttribute('src', '../src/assets/theme/adminlte/plugins/jquery-knob/jquery.knob.min.js')
        // daterangepicker -->
        themejs_moment.setAttribute('src', '../src/assets/theme/adminlte/plugins/moment/moment.min.js')
        themejs_daterangepicker.setAttribute('src', '../src/assets/theme/adminlte/plugins/daterangepicker/daterangepicker.js')
        // Tempusdominus Bootstrap 4 -->
        themejs_tempusdominus.setAttribute('src', '../src/assets/theme/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')
        // Summernote -->
        themejs_summernote.setAttribute('src', '../src/assets/theme/adminlte/plugins/summernote/summernote-bs4.min.js')

        themejs_overlayScrollbars.setAttribute('src', '../src/assets/theme/adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js')

        // AdminLTE dashboard demo (This is only for demo purposes) -->
        themejs_dashboard.setAttribute('src', '../src/assets/theme/adminlte/dist/js/pages/dashboard.js')

        document.body.appendChild(themejs_charts)
        document.body.appendChild(themejs_sparkline)
        document.body.appendChild(themejs_jqueryVmap)
        document.body.appendChild(themejs_jqueryVmapUsa)
        document.body.appendChild(themejs_jqueryKnob)
        document.body.appendChild(themejs_daterangepicker)
        document.body.appendChild(themejs_moment)
        document.body.appendChild(themejs_tempusdominus)
        document.body.appendChild(themejs_summernote)
        document.body.appendChild(themejs_overlayScrollbars)
        document.body.appendChild(themejs_dashboard)

        //
        let themejs_adminlte = document.createElement('script')
        themejs_adminlte.setAttribute('src', '../src/assets/theme/adminlte/dist/js/adminlte.js')
        document.body.appendChild(themejs_adminlte)
    },
    methods: {
        //
    }
}
</script>