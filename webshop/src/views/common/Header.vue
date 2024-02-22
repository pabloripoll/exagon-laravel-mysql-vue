<script setup></script>
<template>
    <div class="container lh-1 py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="link-secondary" href="">reload page</a>
            </div>
            <div class="col-4 text-center">
                <a class="blog-div-logo text-body-emphasis text-decoration-none" href="#">eCommerce</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <a class="link-secondary" href="#" aria-label="Search">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
                        stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
                        viewBox="0 0 24 24">
                        <title>Search</title>
                        <circle cx="10.5" cy="10.5" r="7.5" />
                        <path d="M21 21l-5.2-5.2" />
                    </svg>
                </a>
                <a id="switch-theme-btn" class="link-secondary mx-3" href="javascript:;" title="switch theme color"><i class="fas fa-toggle-off"></i></a>
                <a class="btn btn-sm btn-outline-secondary" href="/sign-in.html">Sign In</a>
            </div>
        </div>
        <div class="nav-scroller py-1 mt-3 mb-3 border-top border-bottom">
            <nav class="nav nav-underline"><!-- justify-content-between -->
                <a class="nav-item nav-link link-body-emphasis" href="/home.html">Home</a>
                <a class="nav-item nav-link link-body-emphasis" href="/blog.html">Blog</a>
                <a class="nav-item nav-link link-body-emphasis" href="/catalogue.html">Catalogue</a>
                <a class="nav-item nav-link link-body-emphasis" href="/contact.html">Contact</a>
            </nav>
        </div>
    </div>
</template>
<style scoped></style>
<script>
export default {
    data: () => ({
        //
    }),
    mounted() {

    },
    methods: {
        navIsActive: function() {
            this.isActive = !this.isActive;
            // some code to filter users
        }
    }
}
</script>