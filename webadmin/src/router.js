import {createRouter, createWebHistory} from 'vue-router'

const routes = [
    { path: '/', component: () => import('./views/EshopDashboard.vue') },
    { path: '/eshop/dashboard', component: () => import('./views/EshopDashboard.vue') },
    { path: '/eshop/sales', component: () => import('./views/EshopSales.vue') },
    /* { path: '/product.html', component: () => import('./views/Product.vue') },
    { path: '/cart.html', component: () => import('./views/Cart.vue') },
    { path: '/delivery.html', component: () => import('./views/Delivery.vue') },
    { path: '/payment.html', component: () => import('./views/Payment.vue') },
    { path: '/completed.html', component: () => import('./views/Completed.vue') },
    { path: '/account.html', component: () => import('./views/Account.vue') },
    { path: '/contact.html', component: () => import('./views/Contact.vue') } */
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router