<script setup></script>
<template>

    <nav class="main-header navbar navbar-expand navbar-dark navbar-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">15 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-envelope mr-2"></i> 4 new messages
                        <span class="float-right text-muted text-sm">3 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 8 friend requests
                        <span class="float-right text-muted text-sm">12 hours</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> 3 new reports
                        <span class="float-right text-muted text-sm">2 days</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                </div>
            </li>
            <li class="nav-item">
                <a id="body-theme-mode" class="nav-link" v-on:click="changeBodyTheme()">
                    <i class="far fa-moon"></i>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link pt-0 px-1" data-toggle="dropdown" href="#">
                    <img src="/files/user/user-0.jpg" class="img-size-32 img-circle" alt="User Image">
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">User Name</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-user mr-2"></i> Profile
                    </a>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-cogs mr-2"></i> Settings
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="/exit" class="dropdown-item dropdown-footer">
                        <i class="fas fa-sign-out-alt"></i> Sign Out
                    </a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
                    <i class="fas fa-th-large"></i>
                </a>
            </li>
        </ul>
    </nav>

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
        },

        changeBodyTheme: function() {
            let elem = document.querySelector(`#body-theme-mode`)
            if (document.body.classList.contains(`dark-mode`)) {
                document.body.classList.remove(`dark-mode`)
                elem.children[0].classList.remove(`fa-sun`)
                elem.children[0].classList.add(`fa-moon`)
            } else {
                document.body.classList.add(`dark-mode`)
                elem.children[0].classList.remove(`fa-moon`)
                elem.children[0].classList.add(`fa-sun`)
            }
        }
    }
}
</script>