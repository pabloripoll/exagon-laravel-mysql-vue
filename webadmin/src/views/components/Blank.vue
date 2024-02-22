<template>
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Blank Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="#">Blank</a>
                        </li>
                        <li class="breadcrumb-item active">Page</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <section class="content">
        <div class="error-page">
            <h2 class="headline text-warning"> 404</h2>
            <div class="error-content">
                <h3><i class="fas fa-exclamation-triangle text-warning mt-4"></i> Page not found but it's on porpuse.</h3>
                <p class="text-center">
                    Most probably is that page content is under development.
                    <br>
                    You may <router-link to="/">return to home route</router-link> or try visiting previous page.
                </p>
            </div>
        </div>
    </section>
</template>