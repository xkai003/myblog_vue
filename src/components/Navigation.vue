<template>
    <div class="box">
        <div id="sidebarToggle" class="toggle-btn" @click="opennav()">☰</div>

        <!-- 隐形的侧边导航栏 -->
        <transition name="slide">
            <div id="mySidebar" class="sidebar" v-show="isshowNavigation">           
                <a href="javascript:void(0)" class="closebtn" @click="closenav()">×</a>
                <img src="../assets/avatar.jpg" alt="">
                <!-- <a href="./index.html">首页</a>
                <a href="./works.html">作品</a>-->
                <!-- <a href="./notes.html">笔记</a>  -->
                <router-link to="/">首页</router-link>
                <router-link to="/works">作品</router-link>
                <router-link to="/notes">笔记</router-link>
                <router-link to="/travel">旅游</router-link>
                <router-link to="/management">管理</router-link>
                <!--  -->
                <a href="https://blog-e3z.pages.dev/" class="switch" title="切换回HTML版本">
                    <svg t="1763776418514" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5640" ><path d="M96 448h832a32 32 0 0 0 22.6-54.6l-224-224a32 32 0 0 0-45.2 45.2L850.7 384H96a32 32 0 0 0 0 64zM928 576H96a32 32 0 0 0-22.6 54.6l224 224a31.9 31.9 0 0 0 45.2 0 31.9 31.9 0 0 0 0-45.2L173.3 640H928a32 32 0 1 0 0-64z" p-id="5641"></path></svg>
                </a>
            </div>
        </transition>
        <!-- 渲染匹配到的路由组件 -->
        <router-view></router-view>
    </div>
</template>

<script>
export default {
    data() {
        return {
            isshowNavigation: false
        }
    },
    methods: {
        opennav(){
            console.log("打开弹窗")
            this.isshowNavigation = true
        },
        closenav(){
            console.log("关闭弹窗")
            this.isshowNavigation = false
        }
    }
}
</script>

<style scoped>
/* -----------------------侧边栏导航栏----------------------- */
/* 基本样式 */
body {
    font-family: "Arial", sans-serif;
    margin: 0;
    padding: 0;
    /* 方格背景 */
    background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
    linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
    background-size: 20px 20px;
}

/* 隐藏的侧边栏样式 */
.sidebar {
    position:fixed;
    top: 0px;
    left: 0px;
    padding-top: 60px;
    width: 200px;
    height: 100vh;
    background-color: #fdfbf2;
    /* border: 1px solid red; */
}

/* 侧边栏链接样式 */
.sidebar a {
    text-align: center;/* a标签左右居中 */
    padding: 10px 15px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

/* 当鼠标悬停在链接上时的样式 */
.sidebar a:hover {
    background-color: rgba(224, 247, 245, 0.8);
    color: rgb(228, 172, 135);
}

/* 关闭按钮的样式 */
.sidebar .closebtn {
    position: absolute;
    top: 0;
    right: 0px;
}
.sidebar img{
    margin-left: 32%;
    width: 80px;
    height: 80px;
    border-radius: 50%; 
}
/* 切换版本 */
.sidebar .switch{
    position: absolute;
    left: 0;
    bottom: 7%;
}.sidebar .switch:hover{
    background-color: #fff;
}
.sidebar .switch .icon{
    width: 20px;
    height: 20px;
}
.sidebar .switch .icon{
    fill: #333333
}
.sidebar .switch:hover .icon{
    fill: red;
}
/* 主内容部分的样式 */
#mainContent {
    transition: 0.5s;
}

/* 触发按钮的样式 */
.toggle-btn {
    font-size: 30px;
    cursor: pointer;
    position: fixed;
    top: 0px;
    left: 0px;
    color: #111;
}
/* 过渡效果 */
.slide-enter-active,
.slide-leave-active {
    transition: all 0.3s ease;
}

.slide-enter-from {
    transform: translateX(-100%);
    opacity: 0;
}

.slide-leave-to {
    transform: translateX(-100%);
    opacity: 0;
}

/* 遮罩层过渡 */
.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}

/* -----------------------侧边栏导航栏----------------------- */

</style>