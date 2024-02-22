<script setup>
import CompletedHeader from './components/Completed/CompletedHeader.vue'
import CompletedBody from './components/Completed/CompletedBody.vue'
import CompletedFooter from './components/Completed/CompletedFooter.vue'
</script>

<template>
    <div class="section-container" id="checkout-completed">
        <div class="container">
            <div class="checkout">
                <CompletedHeader />
                <CompletedBody />
                <CompletedFooter />
            </div>
        </div>
    </div>
</template>

<style scoped></style>