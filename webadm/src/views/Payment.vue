<script setup>
import PaymentHeader from './components/Payment/PaymentHeader.vue'
import PaymentBody from './components/Payment/PaymentBody.vue'
import PaymentFooter from './components/Payment/PaymentFooter.vue'
</script>

<template>
    <div class="section-container" id="checkout-payment">
        <div class="container">
            <div class="checkout">
                <PaymentHeader />
                <PaymentBody />
                <PaymentFooter />
            </div>
        </div>
    </div>
</template>

<style scoped></style>