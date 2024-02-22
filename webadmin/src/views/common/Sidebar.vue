<script setup></script>
<template>
    <aside class="main-sidebar sidebar-dark-primary">
        <a href="" class="brand-link">
            <img src="/theme/AdminLTELogo.png" alt="eAdminer" class="brand-image" style="opacity: .8">
            <b class="brand-text h6">Adminer</b>
        </a>
        <div class="sidebar">
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-compact text-sm" data-widget="treeview" role="menu" id="sidebar-menu" data-accordion="false">

                    <li class="nav-header"><i class="nav-icon fas fa-store"></i> &nbsp; E-SHOP</li>
                    <li class="nav-item">
                        <router-link to="/eshop/dashboard" class="nav-link">
                            <i class="nav-icon fas fa-chart-line"></i>
                            <p>Dashboard</p>
                        </router-link>
                        <router-link to="/eshop/sales" class="nav-link">
                            <i class="nav-icon fas fa-shopping-cart"></i>
                            <p>Sales</p>
                        </router-link>
                        <router-link to="/eshop/products" class="nav-link">
                            <i class="nav-icon fas fa-gift"></i>
                            <p>Products</p>
                        </router-link>
                    </li>

                    <li class="nav-header"><i class="nav-icon fas fa-cubes"></i> &nbsp; CATALOGUE</li>
                    <li class="nav-item">
                        <router-link to="/catalogue/products" class="nav-link">
                            <i class="nav-icon fas fa-cube"></i>
                            <p>Products</p>
                        </router-link>
                        <router-link to="/catalogue/categories" class="nav-link">
                            <i class="nav-icon fas fa-sitemap"></i>
                            <p>Categories</p>
                        </router-link>
                        <router-link to="/catalogue/brands" class="nav-link">
                            <i class="nav-icon fas fa-copyright"></i>
                            <p>Brands</p>
                        </router-link>
                    </li>
                    <!-- <li class="nav-header"><i class="nav-icon fas fa-store"></i> E-SHOP</li>
                    <li class="nav-item">
                        <router-link to="/eshop/dashboard" class="nav-link">
                            <i class="nav-icon fas fa-chart-line"></i>
                            <p>
                                Dashboard
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </router-link>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <router-link to="/eshop/dashboard" class="nav-link">
                                    <i class="nav-icon fas fa-window-minimize"></i>
                                    <p>statistics</p>
                                </router-link>
                            </li>
                        </ul>
                    </li> -->
                </ul>
            </nav>
        </div>
    </aside>
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
        /* navIsActive: function() {
            this.isActive = !this.isActive;
            // some code to filter users
        } */
    }
}
</script>