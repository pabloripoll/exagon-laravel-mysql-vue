<script setup></script>
<template>
    <div id="top-nav" class="top-nav">
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown dropdown-hover">
                        <a href="#" data-bs-toggle="dropdown">
                            <img src="/theme/color/assets/img/flag/flag-english.png" class="flag-img" alt /> English <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="dropdown-item">
                                    <img src="/theme/color/assets/img/flag/flag-english.png" class="flag-img" alt /> English
                                </a>
                            </li>
                            <li>
                                <a href="#" class="dropdown-item">
                                    <img src="/theme/color/assets/img/flag/flag-spanish.png" class="flag-img" alt /> Spanish
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Customer Care</a>
                    </li>
                    <li>
                        <a href="#">Order Tracker</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-end">
                    <li>
                        <a href="#">Our Forum</a>
                    </li>
                    <li>
                        <a href="#">Newsletter</a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fab fa-facebook-f f-s-14"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fab fa-twitter f-s-14"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fab fa-instagram f-s-14"></i></a>
                        </li>
                    <li>
                        <a href="#">
                            <i class="fab fa-linkedin f-s-14"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="header" class="header">
        <div class="container">
            <div class="header-container">
                <button
                    type="button"
                    class="navbar-toggle collapsed"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="header-logo">
                    <a href="/"><!-- <- no vue link for hard reloading -->
                        <span class="brand-logo"></span>
                        <span class="brand-text">
                            <span>Color</span>Admin
                            <small>e-commerce frontend theme</small>
                        </span>
                    </a>
                </div>
                <div class="header-nav">
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav justify-content-center">
                            <li>
                                <router-link to="/home.html">Home</router-link>
                            </li>
                            <li>
                                <router-link to="/products.html">Products</router-link>
                            </li>
                            <li>
                                <router-link to="/contact.html">Contact</router-link>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- nav user -->
                <div class="header-nav">
                    <ul class="nav justify-content-end">
                        <li class="dropdown dropdown-hover">
                            <a href="#" class="header-cart" data-bs-toggle="dropdown">
                                <i class="fa fa-shopping-bag"></i>
                                <span class="total">2</span>
                                <span class="arrow top"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-cart p-0">
                                <div class="cart-header">
                                    <h4 class="cart-title">Shopping Bag (1)</h4>
                                </div>
                                <div class="cart-body">
                                    <ul class="cart-item">
                                        <li>
                                            <div class="cart-item-image">
                                                <img src="/theme/color/assets/img/product/product-ipad.jpg" alt />
                                            </div>
                                            <div class="cart-item-info">
                                                <h4>iPad Pro Wi-Fi 128GB - Silver</h4>
                                                <p class="price">$699.00</p>
                                            </div>
                                            <div class="cart-item-close">
                                                <a href="#" data-bs-toggle="tooltip" data-bs-title="Remove">&times;</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-item-image">
                                                <img src="/theme/color/assets/img/product/product-imac.jpg" alt /></div>
                                            <div class="cart-item-info">
                                                <h4>21.5-inch iMac</h4>
                                                <p class="price">$1299.00</p>
                                            </div>
                                            <div class="cart-item-close">
                                                <a href="#" data-bs-toggle="tooltip" data-bs-title="Remove">&times;</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-item-image">
                                                <img src="/theme/color/assets/img/product/product-iphone.png" alt /></div>
                                            <div class="cart-item-info">
                                                <h4>iPhone 6s 16GB - Silver</h4>
                                                <p class="price">$649.00</p>
                                            </div>
                                            <div class="cart-item-close">
                                                <a href="#" data-bs-toggle="tooltip" data-bs-title="Remove">&times;</a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="cart-footer">
                                    <div class="row gx-2">
                                        <div class="col-6">
                                            <router-link to="/cart.html" class="btn btn-default btn-theme d-block">View Cart</router-link>
                                        </div>
                                        <div class="col-6">
                                            <router-link to="/delivery.html" class="btn btn-dark btn-theme d-block">Checkout</router-link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <router-link to="/account.html">
                                <img src="/theme/color/assets/img/user/user-0.jpg" class="user-img" alt />
                                <span class="d-none d-xl-inline">My Account</span>
                            </router-link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped></style>
<script>
export default {
    data: () => ({
        //
    }),
    mounted() {

    },
    methods: {
        navIsActive: function() {
            this.isActive = !this.isActive;
            // some code to filter users
        }
    }
}
</script>