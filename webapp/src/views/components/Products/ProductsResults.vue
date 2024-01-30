<template>

    <div id="search-results" class="section-container">
        <div class="container">
            <div class="search-container">

                <div class="search-sidebar">
                    <h4 class="title">Filter By</h4>
                    <form action="#" method="POST" name="filter_form">
                        <div class="mb-3">
                            <label class="form-label">Keywords</label>
                            <input type="text" class="form-control input-sm" name="keyword" value="Mobile Phones" placeholder="Enter Keywords" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <div class="row row-space-0">
                                <div class="col-md-5">
                                    <input type="number" class="form-control input-sm" name="price_from" value="10" placeholder="Price From" />
                                </div>
                                <div class="col-md-2 text-center pt-5px fs-12px text-muted">to</div>
                                <div class="col-md-5">
                                    <input type="number" class="form-control input-sm" name="price_to" value="10000" placeholder="Price To" />
                                </div>
                            </div>
                        </div>
                        <div class="mb-30px">
                            <button type="submit" class="btn btn-sm btn-theme btn-dark w-100">
                                <i class="fa fa-search fa-fw me-1 ms-n3"></i> FILTER
                            </button>
                        </div>
                    </form>
                    <h4 class="title mb-0">Categories</h4>
                    <ul class="search-category-list">
                        <li><a href="#">iPhone <span class="pull-right">(10)</span></a></li>
                        <li><a href="#">Mac <span class="pull-right">(15)</span></a></li>
                        <li><a href="#">iPad <span class="pull-right">(32)</span></a></li>
                        <li><a href="#">Watch <span class="pull-right">(4)</span></a></li>
                        <li><a href="#">TV <span class="pull-right">(6)</span></a></li>
                        <li><a href="#">Accessories <span class="pull-right">(38)</span></a></li>
                    </ul>
                </div>

                <div class="search-content">
                    <div class="search-toolbar">
                        <div class="row">
                            <div class="col-lg-6">
                                <h4>We found 65 Items for "Apple Product"</h4>
                            </div>
                            <div class="col-lg-6 text-end">
                                <ul class="sort-list">
                                    <li class="text"><i class="fa fa-filter"></i> Sort by:</li>
                                    <li class="active"><a href="#">Popular</a></li>
                                    <li><a href="#">New Arrival</a></li>
                                    <li><a href="#">Discount</a></li>
                                    <li><a href="#">Price</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="search-item-container">
                        <div class="item-row">
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-iphone.png" alt />
                                    <div class="discount">15% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <router-link to="/product.html">iPhone 6s Plus<br>16GB</router-link>
                                    </h4>
                                    <p class="item-desc">3D Touch. 12MP photos. 4K video.</p>
                                    <div class="item-price">$649.00</div>
                                    <div class="item-discount-price">$739.00</div>
                                </div>
                            </div>
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-apple-tv.png" alt />
                                    <div class="discount">32% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <router-link to="/product.html">Apple TV<br>2016</router-link>
                                    </h4>
                                    <p class="item-desc">The future of television is here.</p>
                                    <div class="item-price">$599.00</div>
                                    <div class="item-discount-price">$799.00</div>
                                </div>
                            </div>
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-iphone-se.png" alt />
                                    <div class="discount">20% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <router-link to="/product.html">iPhone SE<br>32/64Gb</router-link>
                                    </h4>
                                    <p class="item-desc">A big step for small.</p>
                                    <div class="item-price">$499.00</div>
                                    <div class="item-discount-price">$599.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="item-row">
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-apple-watch.png" alt />
                                    <div class="discount">15% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <a href="#">Apple Watch<br>Sport Edition</a>
                                    </h4>
                                    <p class="item-desc">You. At a glance.</p>
                                    <div class="item-price">$399.00</div>
                                    <div class="item-discount-price">$453.00</div>
                                </div>
                            </div>
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-imac.png" alt />
                                    <div class="discount">32% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <a href="#">21.5-inch iMac<br>with Retina Display</a>
                                    </h4>
                                    <p class="item-desc">Retina. Now in colossal and ginormous.</p>
                                    <div class="item-price">$599.00</div>
                                    <div class="item-discount-price">$799.00</div>
                                </div>
                            </div>
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-macbook-pro.png" alt />
                                    <div class="discount">20% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <a href="#">MacBook Pro<br>with Retina Display</a>
                                    </h4>
                                    <p class="item-desc">Stunning Retina Display</p>
                                    <div class="item-price">$99.00</div>
                                    <div class="item-discount-price">$199.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="item-row">
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-ipad-pro.png" alt />
                                    <div class="discount">15% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <a href="#">9.7-inch iPad Pro<br>32GB</a>
                                    </h4>
                                    <p class="item-desc">3D Touch. 12MP photos. 4K video.</p>
                                    <div class="item-price">$649.00</div>
                                    <div class="item-discount-price">$739.00</div>
                                </div>
                            </div>
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-mac-pro.png" alt />
                                    <div class="discount">32% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <a href="#">Mac Pro<br>Quad-Core and Dual GPU</a>
                                    </h4>
                                    <p class="item-desc">Built for creativity on an epic scale.</p>
                                    <div class="item-price">$2999.00</div>
                                    <div class="item-discount-price">$2599.00</div>
                                </div>
                            </div>
                            <div class="item item-thumbnail">
                                <a href="#" class="item-image">
                                    <img src="/theme/color/assets/img/product/product-ipad-air.png" alt />
                                    <div class="discount">20% OFF</div>
                                </a>
                                <div class="item-info">
                                    <h4 class="item-title">
                                        <a href="#">iPad Air 2<br>32/64Gb</a>
                                    </h4>
                                    <p class="item-desc">Light. Heavyweight.</p>
                                    <div class="item-price">$399.00</div>
                                    <div class="item-discount-price">$459.00</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="pagination justify-content-center mt-0">
                        <li class="page-item disabled"><a href="javascript:;" class="page-link">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="javascript:;">1</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:;">2</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:;">3</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:;">4</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:;">5</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:;">Next</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

</template>