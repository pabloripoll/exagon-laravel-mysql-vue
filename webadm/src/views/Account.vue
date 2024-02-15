<script setup>
import AccountBody from './components/Account/AccountBody.vue'
</script>

<template>
    <div class="section-container pt-20px" id="about-us-cover">
        <div class="container">
            <ul class="breadcrumb mb-2">
                <li class="breadcrumb-item">
                    <a href="#">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="#">Store</a>
                </li>
                <li class="breadcrumb-item active">My Account</li>
            </ul>
            <div class="account-container">
                <AccountBody />
            </div>
        </div>
    </div>
</template>

<style scoped></style>