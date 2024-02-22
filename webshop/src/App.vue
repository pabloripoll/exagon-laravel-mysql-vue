<script setup>
import Header from './views/common/Header.vue'
import Footer from './views/common/Footer.vue'
</script>

<template>
    <Header />
    <main class="container mb-5">
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

        themejs_vendor.setAttribute('src', '../src/assets/theme/bootstrap/assets/js/bootstrap.bundle.min.js')
        themejs_app.setAttribute('src', '../src/assets/theme/bootstrap/custom/color-modes.js')

        document.head.appendChild(themejs_vendor)
        document.head.appendChild(themejs_app)
        document.head.appendChild(themejs_custom)
    },
    methods: {
        //
    }
}
</script>
