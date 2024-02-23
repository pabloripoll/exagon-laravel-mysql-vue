import { defineStore } from 'pinia'

const auth = defineStore('user', {
    id: 'user',

    state: () => {
        return {
            user: {
                isAuthenticated: false,
                id: null,
                name: null,
                email: null,
                access: null,
                refresh: null,
                role: null,
            }
        }
    },

    actions: {
        initStore() {
            console.log('initStore')

            if (localStorage.getItem('user.access')) {
                this.user.access = localStorage.getItem('user.access')
                this.user.refresh = localStorage.getItem('user.refresh')
                this.user.id = localStorage.getItem('user.id')
                this.user.name = localStorage.getItem('user.name')
                this.user.email = localStorage.getItem('user.email')
                this.user.isAuthenticated = true

                this.refreshToken()

                console.log('Initialized user:', this.user)
            }
        },


        setToken(data) {
            console.log('setToken', data)

            this.user.access = data.access
            this.user.refresh = data.refresh
            this.user.isAuthenticated = true

            localStorage.setItem('user.access', data.access)
            localStorage.setItem('user.refresh', data.refresh)
        },

        removeToken() {
            console.log('removeToken')

            this.user.refresh = null
            this.user.access = null
            this.user.isAuthenticated = false
            this.user.id = false
            this.user.name = false
            this.user.email = false

            localStorage.setItem('user.access', '')
            localStorage.setItem('user.refresh', '')
            localStorage.setItem('user.id', '')
            localStorage.setItem('user.name', '')
            localStorage.setItem('user.email', '')
        },

        setUserInfo(user) {
            console.log('setUserInfo', user)

            this.user.id = user.id
            this.user.name = user.name
            this.user.email = user.email
            this.user.role = user.role

            localStorage.setItem('user.id', this.user.id)
            localStorage.setItem('user.name', this.user.name)
            localStorage.setItem('user.email', this.user.email)
            localStorage.setItem('user.role', this.user.role)

            console.log('User', this.user)
        },

        refreshToken() {
            this.axios.post('/refresh/', {
                refresh: this.user.refresh
            })
            .then((response) => {
                this.user.access = response.data.access

                localStorage.setItem('user.access', response.data.access)

                axios.defaults.headers.common["Authorization"] = "Bearer " + response.data.access
            })
            .catch((error) => {
                console.log(error)

                this.removeToken()
            })
        }
    },
})

export default auth