<script setup>
import ContactBody from './components/Contact/ContactBody.vue'
</script>

<template>
    <div class="section-container pt-20px" id="contact">
        <div class="container">
            <ul class="breadcrumb mb-2">
                <li class="breadcrumb-item">
                    <a href="#">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="#">Store</a>
                </li>
                <li class="breadcrumb-item active">Contact</li>
            </ul>
            <div class="row row-space-30">
                <ContactBody />
            </div>
        </div>
    </div>
</template>

<style scoped></style>