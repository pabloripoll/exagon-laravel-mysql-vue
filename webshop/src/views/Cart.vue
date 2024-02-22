<script setup>
import CartHeader from './components/Cart/CartHeader.vue'
import CartBody from './components/Cart/CartBody.vue'
import CartFooter from './components/Cart/CartFooter.vue'
</script>

<template>
    <div class="section-container" id="checkout-cart">
        <div class="container">
            <div class="checkout">
                <CartHeader />
                <CartBody />
                <CartFooter />
            </div>
        </div>
    </div>
</template>

<style scoped></style>