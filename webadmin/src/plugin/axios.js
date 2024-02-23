import axios from 'axios'

const instance = axios.create({
    baseURL: 'http://192.168.1.41:8814/api/v1'
})

export default instance