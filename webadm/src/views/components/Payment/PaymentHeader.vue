<template>

    <div class="checkout-header">
        <div class="row">
            <div class="col-lg-3">
                <div class="step">
                    <router-link to="/cart.html">
                        <div class="number">1</div>
                        <div class="info">
                            <div class="title">Delivery Options</div>
                            <div class="desc">Lorem ipsum dolor sit amet.</div>
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="step">
                    <router-link to="/delivery.html">
                        <div class="number">2</div>
                        <div class="info">
                            <div class="title">Shipping Address</div>
                            <div class="desc">Vivamus eleifend euismod.</div>
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="step active">
                    <router-link to="/payment.html">
                        <div class="number">3</div>
                        <div class="info">
                            <div class="title">Payment</div>
                            <div class="desc">Aenean ut pretium ipsum. </div>
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="step">
                    <router-link to="/completed.html">
                        <div class="number">4</div>
                        <div class="info">
                            <div class="title">Complete Payment</div>
                            <div class="desc">Curabitur interdum libero.</div>
                        </div>
                    </router-link>
                </div>
            </div>
        </div>
    </div>

</template>