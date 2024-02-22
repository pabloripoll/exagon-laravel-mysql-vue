<template>

    <div class="col-md-8">
        <h4 class="mt-0">Contact Form</h4>
        <p class="mb-30px fs-13px">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lobortis tortor justo,
            elementum volutpat ante porta eu.
            Sed eget tellus neque. Nam feugiat magna turpis. Vestibulum pharetra nibh et pretium
            efficitur. Donec porta sollicitudin laoreet.
            Sed a condimentum urna. Curabitur placerat ornare venenatis. Cras iaculis venenatis
            imperdiet.
        </p>
        <div class="mb-2 row">
            <label class="col-form-label col-md-3 text-lg-end">Name <span class="text-danger">*</span></label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="name" />
            </div>
        </div>
        <div class="mb-2 row">
            <label class="col-form-label col-md-3 text-lg-end">Email <span class="text-danger">*</span></label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="email" />
            </div>
        </div>
        <div class="mb-2 row">
            <label class="col-form-label col-md-3 text-lg-end">Message <span class="text-danger">*</span></label>
            <div class="col-md-7">
                <textarea class="form-control" rows="10" name="message"></textarea>
            </div>
        </div>
        <div class="mb-2 row">
            <label class="col-form-label col-md-3"></label>
            <div class="col-md-7">

            </div>
        </div>
        <div class="mb-2 row">
            <label class="col-form-label col-md-3"></label>
            <div class="col-md-7">
                <button type="submit" class="btn btn-dark btn-theme">SEND MESSAGE</button>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <h4 class="mt-0">Our Contacts</h4>
        <div class="ratio ratio-16x9 mb-15px">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3306.9584799260138!2d-118.49437019999998!3d34.019276700000006!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2a4cedd1266ff%3A0x1ffe328381544853!2sGoogle+Inc!5e0!3m2!1sen!2s!4v1435718319426"
                allowfullscreen></iframe>
        </div>
        <div>
            <b>SeanTheme Store, Inc</b>
        </div>
        <p class="mb-15px">
            795 Folsom Ave, Suite 600<br>
            San Francisco, CA 94107<br>
            P: (123) 456-7890<br>
        </p>
        <div>
            <b>Email</b>
        </div>
        <p class="mb-15px">
            <a class="text-dark">
                <span>[email&#160;protected]</span>
            </a>
            <br>
        </p>
        <div class="mb-5px">
            <b>Social Network</b>
        </div>
        <p class="mb-15px">
            <a href="#" class="btn btn-icon btn-white btn-circle">
                <i class="fab fa-facebook"></i>
            </a>
            <a href="#" class="btn btn-icon btn-white btn-circle">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="#" class="btn btn-icon btn-white btn-circle">
                <i class="fab fa-google-plus"></i>
            </a>
            <a href="#" class="btn btn-icon btn-white btn-circle">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="#" class="btn btn-icon btn-white btn-circle">
                <i class="fab fa-dribbble"></i>
            </a>
        </p>
    </div>

</template>