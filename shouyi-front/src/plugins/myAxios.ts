import axios, {AxiosInstance} from 'axios';

const myAxios: AxiosInstance = axios.create({
    baseURL: 'http://127.0.0.1:9001/api/',
    timeout: 5000
});

myAxios.interceptors.request.use(function (config) {
    if (localStorage.getItem('acp_token')){
        config.headers["acp_token"] = localStorage.getItem('acp_token')
    }
    return config;
}, function (error) {
    return Promise.reject(error);
});

myAxios.interceptors.response.use(function (response) {
    return response.data;
}, function (error) {
    return Promise.reject(error);
});

export default myAxios;
