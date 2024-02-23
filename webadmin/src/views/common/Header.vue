<script setup></script>
<template>

    <nav class="main-header navbar navbar-expand navbar-dark navbar-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a id="test-api-btn" class="nav-link pointer" v-on:click="testAPI()">
                    <i class="fas fa-wifi"></i>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">0</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">0 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <router-link to="/eshop/notifications/orders" class="dropdown-item">
                        <i class="fas fa-envelope mr-2"></i> 0 new orders
                        <span class="float-right text-muted text-sm">0 total</span>
                    </router-link>
                    <div class="dropdown-divider"></div>
                    <router-link to="/eshop/notifications/messages" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 0 new messages
                        <span class="float-right text-muted text-sm">0 total</span>
                    </router-link>
                    <div class="dropdown-divider"></div>
                    <router-link to="/eshop/notifications/reports" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> 0 new reports
                        <span class="float-right text-muted text-sm">0 total</span>
                    </router-link>
                    <div class="dropdown-divider"></div>
                    <router-link to="/eshop/notifications" class="dropdown-item dropdown-footer">See All Notifications</router-link>
                </div>
            </li>
            <li class="nav-item">
                <a id="body-theme-mode" class="nav-link pointer" v-on:click="changeBodyTheme()">
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
                    <router-link to="/member/feeds" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> Feeds
                    </router-link>
                    <router-link to="/account/setting" class="dropdown-item">
                        <i class="fas fa-cogs mr-2"></i> Settings
                    </router-link>
                    <div class="dropdown-divider"></div>
                    <a @click="authStore.logout()" class="dropdown-item dropdown-footer pointer">
                        <i class="fas fa-sign-out-alt"></i> Sign Out
                    </a>
                </div>
            </li>
        </ul>
    </nav>

</template>
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

        changeBodyTheme() {
            let elem = document.querySelector(`#body-theme-mode`)
            let icon = elem.children[0]

            if (document.body.classList.contains(`dark-mode`)) {
                document.body.classList.remove(`dark-mode`)
                icon.classList.remove(`fa-sun`)
                icon.classList.add(`fa-moon`)
            } else {
                document.body.classList.add(`dark-mode`)
                icon.classList.remove(`fa-moon`)
                icon.classList.add(`fa-sun`)
            }
        },

        async testAPI() {
            let elem = document.querySelector(`#test-api-btn`)
            let icon = elem.children[0]

            icon.classList.remove(`fa-wifi`)
            icon.classList.add(`fa-spinner`)
            icon.classList.add(`fa-spin`)

            let response = await this.axios.get('http://192.168.1.41:8814/api/v1/health')
            if (response.status == 200) {
                let res = response.data
                if (res.status) {
                    alert(`Connection Succeded :)`)
                } else {
                    alert(`Connection Refused :/`)
                }
            } else {
                alert(`Wrong Connection :(`)
            }

            icon.classList.remove(`fa-spinner`)
            icon.classList.remove(`fa-spin`)
            icon.classList.add(`fa-wifi`)
        },
    }
}
</script>