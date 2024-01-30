<template>

    <div id="slider" class="section-container p-0 bg-dark">
        <div id="main-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div
                    class="carousel-item active"
                    data-paroller="true"
                    data-paroller-factor="0.3"
                    data-paroller-factor-sm="0.01"
                    data-paroller-factor-xs="0.01"
                    style="background: url(/theme/color/assets/img/slider/slider-1-cover.jpg) center 0 / cover no-repeat;">
                    <div class="container">
                        <img src="/theme/color/assets/img/slider/slider-1-product.png" class="product-img right bottom fadeInRight animated" alt />
                    </div>
                    <div class="carousel-caption carousel-caption-left text-white">
                        <div class="container">
                            <h3 class="title mb-5px fadeInLeftBig animated">iMac</h3>
                            <p class="mb-15px fadeInLeftBig animated">The vision is brighter than ever.</p>
                            <div class="price mb-30px fadeInLeftBig animated">
                                <small>from</small> <span>$2299.00</span>
                            </div>
                            <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">Buy Now</a>
                        </div>
                    </div>
                </div>
                <div
                    class="carousel-item"
                    data-paroller="true"
                    data-paroller-factor="-0.3"
                    data-paroller-factor-sm="0.01"
                    data-paroller-factor-xs="0.01"
                    style="background: url(/theme/color/assets/img/slider/slider-2-cover.jpg) center 0 / cover no-repeat;">
                    <div class="container">
                        <img src="/theme/color/assets/img/slider/slider-2-product.png" class="product-img left bottom fadeInLeft animated" alt />
                    </div>
                    <div class="carousel-caption carousel-caption-right text-white">
                        <div class="container">
                            <h3 class="title mb-5px fadeInRightBig animated">iPhone X</h3>
                            <p class="mb-15px fadeInRightBig animated">Say hello to the future.</p>
                            <div class="price mb-30px fadeInRightBig animated">
                                <small>from</small> <span>$1,149.00</span>
                            </div>
                            <a href="#" class="btn btn-outline btn-lg fadeInRightBig animated">Buy Now</a>
                        </div>
                    </div>
                </div>
                <div
                    class="carousel-item"
                    data-paroller="true"
                    data-paroller-factor="-0.3"
                    data-paroller-factor-sm="0.01"
                    data-paroller-factor-xs="0.01"
                    style="background: url(/theme/color/assets/img/slider/slider-3-cover.jpg) center 0 / cover no-repeat;">
                    <div class="carousel-caption text-white">
                        <div class="container">
                            <h3 class="title mb-5px fadeInDownBig animated">Macbook Air</h3>
                            <p class="mb-15px fadeInDownBig animated">Thin.Light.Powerful.<br />And ready for
                                anything</p>
                            <div class="price fadeInDownBig animated">
                                <small>from</small> <span>$999.00</span>
                            </div>
                            <a href="product_detail.html" class="btn btn-outline btn-lg fadeInUpBig animated">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="index.html#main-carousel" data-bs-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="index.html#main-carousel" data-bs-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </div>
</template>