<template>
    <div class="max-w-7xl max-h-screen h-[740px] mx-auto grid grid-cols-2 gap-24 mt-6 m-10">

        <div class="main-left">
            <div class="p-4 h-full">
                <div class="p-12 bg-hero-mutrah h-full rounded-lg bg-cover">
                </div>
            </div>
        </div>
        <div class="main-right">
            <div class="p-12 bg-white rounded-lg">
                <form class="space-y-6" v-on:submit.prevent="submitForm">
                    <div>
                        <label>Email</label>
                        <input type="email" v-model="form.email" placeholder="Your email address"
                            class="w-full mt-2 py-4 px-6 border border-gray-200 rounded-lg">
                    </div>
                    <div>
                        <label>Password</label>
                        <input type="password" v-model="form.password" placeholder="Password"
                            class="w-full mt-2 py-4 px-6 border border-gray-200 rounded-lg">
                    </div>

                    <div>
                        <button class="py-4 px-6 bg-orange-500 font-bold text-white rounded-lg">Log In</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import { useUserStore } from '@/stores/user'
import { useToastStore } from '@/stores/toast'

export default {

    setup() {
        const userStore = useUserStore()
        const toastStore = useToastStore()

        return {
            userStore,
            toastStore
        }
    },

    data() {
        return {
            form: {
                email: '',
                password: '',
            },
            errors: []
        }
    },

    methods: {
        async submitForm() {
            this.errors = []

            if (this.form.email === '') {
                this.errors.push('Your email is missing')
            }

            if (this.form.password === '') {
                this.errors.push('Your password is missing')
            }

            if (this.errors.length === 0) {
                await axios
                    .post('/api/login/', this.form)

                    .then(response => {
                        console.log({ 'message': response.data })
                        this.userStore.setToken(response.data)

                        axios.defaults.headers.common["Authorization"] = `Bearer ${response.data.access}`;

                    })
                    .catch(error => {
                        this.toastStore.showToast(5000, 'Oops we could not find matching credentials', 'bg-red-300')
                    })

                await axios
                    .get('/api/me/')
                    .then(response => {
                        console.log({ 'message': response })
                        this.userStore.setUserInfo(response.data)
                        this.userStore.initStore(response.data)

                        this.$router.push('/')

                    })
                    .catch(error => {
                        console.log('error', error)
                    })
            }

            else {
                if (this.errors == 'Your email is missing')
                    this.toastStore.showToast(5000, 'Your email is missing', 'bg-red-300')

                if (this.errors == 'Your password is missing')
                    this.toastStore.showToast(5000, 'Your password is missing', 'bg-red-300')
            }

        }
    },
}

</script>