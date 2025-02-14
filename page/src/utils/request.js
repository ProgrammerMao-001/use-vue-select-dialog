import axios from "axios";

axios.defaults.headers["Content-Type"] = "application/json;charset=utf-8";
const service = axios.create({
    baseURL: process.env.VUE_APP_BASE_API,
    timeout: 1000 * 60,
});

service.interceptors.request.use(
  (config) => {
    return config;
  },
  (error) => {
    return Promise.reject(error);
  },
);

service.interceptors.response.use(
  (res) => {
    return res.data;
  },
  (error) => {
    return Promise.reject(error);
  },
);

export default service;
