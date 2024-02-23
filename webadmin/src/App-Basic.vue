<script setup>
    import Header from './views/common/Header.vue'
    import Sidebar from './views/common/Sidebar.vue'
    import Footer from './views/common/Footer.vue'

    </script>

    <template>
        <Header />
        <Sidebar />
        <main class="content-wrapper">
            <RouterView></RouterView>
        </main>
        <Footer />
    </template>

    <style scoped></style>

    <script>

    export default {
        data: () => {
            return {
                currentPath: window.location.hash
            }
        },
        computed: {
            currentView() {
                return routes[this.currentPath.slice(1) || '/'] || NotFound
            }
        },
        mounted() {
            window.addEventListener('hashchange', () => {
                this.currentPath = window.location.hash
            })

            // theme scripts
            let themejs_jquery = document.createElement('script')
            let themejs_jqueryui = document.createElement('script')
            let themejs_bootstrap = document.createElement('script')
            let themejs_pace = document.createElement('script')

            themejs_jquery.setAttribute('src', '../src/assets/theme/adminlte/plugins/jquery/jquery.min.js')
            themejs_jqueryui.setAttribute('src', '../src/assets/theme/adminlte/plugins/jquery-ui/jquery-ui.min.js')
            themejs_bootstrap.setAttribute('src', '../src/assets/theme/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js')
            themejs_pace.setAttribute('src', '../src/assets/theme/adminlte/plugins/pace-progress/pace.min.js')

            document.body.appendChild(themejs_jquery)
            document.body.appendChild(themejs_jqueryui)
            //$.widget.bridge('uibutton', $.ui.button) ???
            document.body.appendChild(themejs_bootstrap)
            document.body.appendChild(themejs_pace)

        },
        methods: {
            //
        }
    }
    </script>
