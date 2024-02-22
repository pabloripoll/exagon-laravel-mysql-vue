<script setup>
import DeliveryHeader from './components/Delivery/DeliveryHeader.vue'
import DeliveryBody from './components/Delivery/DeliveryBody.vue'
import DeliveryFooter from './components/Delivery/DeliveryFooter.vue'
</script>

<template>
    <div class="section-container" id="checkout-info">
        <div class="container">
            <div class="checkout">
                <DeliveryHeader />
                <DeliveryBody />
                <DeliveryFooter />
            </div>
        </div>
    </div>
</template>

<style scoped></style>