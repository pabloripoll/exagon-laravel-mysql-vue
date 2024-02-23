import {createRouter, createWebHistory} from 'vue-router'

const routes = [
    { path: '/', redirect: 'eshop/dashboard' },
    { path: '/login', name: 'Login', component: () => import('./views/Login.vue') },
    { path: '/eshop/dashboard', component: () => import('./views/EshopDashboard.vue') },
    { path: '/eshop/sales', component: () => import('./views/EshopSales.vue') },
    { path: '/eshop/customers', component: () => import('./views/EshopCustomers.vue') },
    { path: '/eshop/products', component: () => import('./views/EshopProducts.vue') },
    { path: '/eshop/:notifications*', component: () => import('./views/EshopNotifications.vue') },
    { path: '/warehouse/products', component: () => import('./views/WarehouseProducts.vue') },
    { path: '/warehouse/categories', component: () => import('./views/WarehouseProducts.vue') },
    { path: '/warehouse/brands', component: () => import('./views/WarehouseProducts.vue') },
    { path: '/member/feeds', component: () => import('./views/MemberFeeds.vue') },
    { path: '/account/setting', component: () => import('./views/AccountSetting.vue') },
    { path: '/exit', component: () => import('./views/AccountSetting.vue') },
]

//const authStore = defineStore(pinia)

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
})

router.beforeEach((to, from, next) => {
    if (to.name !== 'Login' && !isAuthenticated) next({ name: 'Login' })
    else next()
})

export default router