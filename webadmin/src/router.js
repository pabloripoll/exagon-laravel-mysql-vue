import {createRouter, createWebHistory} from 'vue-router'

import { useUserStore } from '@/stores/user'

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

router.beforeEach(async (to, from, next) => {
    const Auth = auth

    await Auth.initStore() // Make sure the user state is initialized.

    // Now, you can access the user's role and perform authorization checks.
    const userRole = Auth.user.role

    // You can implement your authorization logic here.
    // For example, check if the userRole has access to the route.
    // You can also handle cases like redirecting to a login page if not authenticated.

    // For simplicity, let's assume all users can access all routes.
    // Replace this with your actual authorization logic.
    if (userRole !== null) {
        next()// Allow navigation.
    } else {
        // Redirect to a login page or show an unauthorized message.
        // Modify this according to your application's requirements.
        next('/login') // Redirect to a login page if the user's role is not defined.
    }
})

export default router