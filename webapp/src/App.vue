<script setup>
import Header from './views/common/Header.vue'
import Footer from './views/common/Footer.vue'
import Home from './views/Home.vue'
</script>

<template>
    <Header />
    <main>
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
        let themejs_vendor = document.createElement('script')
        let themejs_app    = document.createElement('script')
        let themejs_custom = document.createElement('script')

        themejs_vendor.setAttribute('src', 'theme/color/assets/js/vendor.min.js')
        themejs_app.setAttribute('src', 'theme/color/assets/js/app.min.js')
        themejs_app.setAttribute('src', 'theme/color/custom/fix.js')

        document.head.appendChild(themejs_vendor)
        document.head.appendChild(themejs_app)
        document.head.appendChild(themejs_custom)
    },
    methods: {
        //
    }
}
</script>
