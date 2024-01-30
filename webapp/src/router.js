import {createRouter, createWebHistory} from 'vue-router'

import Home from './views/Home.vue'

const routes = [
    { path: '/', component: () => import('./views/Home.vue') },
    { path: '/home.html', component: () => import('./views/Home.vue') },
    { path: '/products.html', component: () => import('./views/Products.vue') },
    { path: '/product.html', component: () => import('./views/Product.vue') },
    { path: '/cart.html', component: () => import('./views/Cart.vue') },
    { path: '/delivery.html', component: () => import('./views/Delivery.vue') },
    { path: '/payment.html', component: () => import('./views/Payment.vue') },
    { path: '/completed.html', component: () => import('./views/Completed.vue') },
    { path: '/account.html', component: () => import('./views/Account.vue') },
    { path: '/contact.html', component: () => import('./views/Contact.vue') }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router