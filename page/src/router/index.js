import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
const routerPush = Router.prototype.push;
Router.prototype.push = function push(location) {
    return routerPush.call(this, location).catch(err => err);
};

const routes = [
    {
        path: "/",
        component: () => import("@/views/home/home"),
    },
    {
        path: "/404",
        component: () => import("@/views/error/404"),
        hidden: true
    },
    {
        path: "/readme",
        component: () => import("@/views/readme/readme"),
        hidden: true
    }
];

export default new Router({
    mode: "history",
    scrollBehavior: () => ({ y: 0 }),
    routes
});
