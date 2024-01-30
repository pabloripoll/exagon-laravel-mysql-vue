<script setup>
import ProductBody from './components/Product/ProductBody.vue'
</script>

<template>
    <div class="section-container pt-20px" id="product_detail">
        <div class="container">
            <ul class="breadcrumb mb-2">
                <li class="breadcrumb-item">
                    <a href="##">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="##">Mobile Phone</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="##">Apple</a>
                </li>
                <li class="breadcrumb-item active">iPhone 6S Plus</li>
            </ul>
            <ProductBody />
        </div>
    </div>
</template>

<style scoped></style>