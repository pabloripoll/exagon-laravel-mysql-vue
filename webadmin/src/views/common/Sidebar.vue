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
                    </li>
                    <li class="nav-item">
                        <router-link to="/eshop/sales" class="nav-link">
                            <i class="nav-icon fas fa-shopping-cart"></i>
                            <p>Sales</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/eshop/customers" class="nav-link">
                            <i class="nav-icon fas fa-user-tag"></i>
                            <p>Customers</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/eshop/products" class="nav-link">
                            <i class="nav-icon fas fa-gift"></i>
                            <p>Products</p>
                        </router-link>
                    </li>

                    <li class="nav-header"><i class="nav-icon fas fa-warehouse"></i> &nbsp; WAREHOUSE</li>
                    <li class="nav-item">
                        <router-link to="/warehouse/products" class="nav-link">
                            <i class="nav-icon fas fa-cubes"></i>
                            <p>Products</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/warehouse/categories" class="nav-link">
                            <i class="nav-icon fas fa-sitemap"></i>
                            <p>Categories</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/warehouse/brands" class="nav-link">
                            <i class="nav-icon fas fa-copyright"></i>
                            <p>Brands</p>
                        </router-link>
                    </li>

                    <li class="nav-header"><i class="nav-icon fas fa-broadcast-tower"></i> &nbsp; MEMBERS</li>
                    <li class="nav-item">
                        <router-link to="/member/feeds" class="nav-link">
                            <i class="nav-icon fas fas fa-users-cog"></i>
                            <p>Feeds</p>
                        </router-link>
                    </li>

                    <li class="nav-header"><i class="nav-icon fas fa-house-user"></i> &nbsp; ACCOUNT</li>
                    <li class="nav-item">
                        <router-link to="/account/setting" class="nav-link">
                            <i class="nav-icon fas fa-cog"></i>
                            <p>Settings</p>
                        </router-link>
                    </li>

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