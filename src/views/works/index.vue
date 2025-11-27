<template>
  <div class="body">
    <div id="mainContent">
    <!-- Headers (as before) -->
    <div class="herd">
        <p>hello</p>
        <span>wellcom to my world!</span>
    </div>
    <div class="nrr">
        <div class="nr" id="app">
            <!-- 搜索(只在第一页显示搜索框) -->
            <div class="search-container" v-if="this.vueCurrentPage == 1">
                <input type="text" placeholder="请输入你要搜索的内容" v-model="searchQuery">
                <!--<button type="submit">搜索</button>--> <!-- Optional: Add a search button -->
            </div>

            <!-- <a :href="item.label"> -->
                <div class="item" v-for="item in displayedVueWebList" :key="item.id">
                    <!-- <img :src="item.imgurl" alt=""> -->
                    <div class="desc">
                        <a :href="item.label" class="title">{{ item.title }}</a><br>
                        <!-- <span class="title">{{ item.title }}</span><br> -->
                        <span class="spanicon"><svg t="1763739628070" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5952"><path d="M512 73.142857C269.604571 73.142857 73.142857 269.604571 73.142857 512s196.461714 438.857143 438.857143 438.857143 438.857143-196.461714 438.857143-438.857143S754.395429 73.142857 512 73.142857z m0-73.142857c282.770286 0 512 229.229714 512 512s-229.229714 512-512 512S0 794.770286 0 512 229.229714 0 512 0z" fill="#666666" p-id="5953"></path><path d="M521.142857 182.857143C495.908571 182.857143 475.428571 203.337143 475.428571 228.571429V548.571429a45.714286 45.714286 0 0 0 91.428572 0V228.571429c0-25.234286-20.48-45.714286-45.714286-45.714286z" fill="#666666" p-id="5954"></path><path d="M523.337143 507.611429a45.714286 45.714286 0 0 0-32.292572 78.043428l165.778286 160.548572a45.714286 45.714286 0 0 0 64.621714-64.585143l-165.778285-160.621715a45.568 45.568 0 0 0-32.329143-13.385142z" p-id="5955"></path></svg> 
                            {{ item.time }}
                            &nbsp;
                            <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                            {{ item.look }}
                        </span>
                        <span>技术栈：{{ item.technology }}</span>
                        <div class="api" v-if="item.api"><span>后端api：</span><a :href="item.api" class="api">{{ item.api }} </a></div>
                        <a :href="item.label">进入 →</a>
                        <!-- <span>项目亮点：</span> -->
                        <!-- <div class="wb">
                            <p>{{ item.wb_p1 }}</p>
                            <p>{{ item.wb_p2 }}</p>
                            <p>{{ item.wb_p3 }}</p>
                            <p>{{ item.wb_p4 }}</p>
                            <p>{{ item.wb_p5 }}</p>
                            <p>{{ item.wb_p6 }}</p>
                            <p>{{ item.wb_p7 }}</p>
                            <p>{{ item.wb_p8 }}</p>
                            <p>{{ item.wb_p9 }}</p>
                        </div> -->
                    </div>
                </div>
            <!-- </a> -->
            <!-- 分页部分 -->
            <div class="pagination">
                <a href="#" @click.prevent="changeVuePage(1)" :class="{ active: vueCurrentPage === 1 }" v-if="vueTotalPages > 1">第一页</a>
                <a href="#" @click.prevent="changeVuePage(vueCurrentPage - 1)" style="font-size: 20px;">&lt;</a>
                <span>{{ vueCurrentPage }}</span>
                <a href="#" @click.prevent="changeVuePage(vueCurrentPage + 1)" style="font-size: 20px;">&gt;</a>
                <a href="#" @click.prevent="changeVuePage(vueTotalPages)" :class="{ active: vueCurrentPage === vueTotalPages }" v-if="vueTotalPages > 1">最后一页</a>
            </div>
        </div>
    </div>
    <!---------------------------------------------------------------------------- 回到顶部按钮 ---------------------------------------------------------------------------->
    <button id="backToTop">
        <svg t="1757048304311" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1736" id="mx_n_1757048304312" width="30" height="30"><path d="M383.786667 640.853333a42.666667 42.666667 0 0 1-8.192 56.149334l-3.968 2.986666-64.64 42.496a42.666667 42.666667 0 0 0-16.085334 20.138667l-1.621333 5.034667L267.946667 853.333333H384a42.666667 42.666667 0 0 1 42.368 37.674667L426.666667 896a42.666667 42.666667 0 0 1-37.674667 42.368L384 938.666667H213.333333a42.666667 42.666667 0 0 1-42.325333-48.213334l0.938667-4.778666 34.56-138.666667a128.042667 128.042667 0 0 1 46.250666-70.570667l7.082667-5.12 64.853333-42.666666a42.666667 42.666667 0 0 1 59.093334 12.202666z m311.168-14.677333l4.352 2.517333 65.066666 42.794667a128 128 0 0 1 50.773334 67.2l2.346666 8.32 34.56 138.666667a42.666667 42.666667 0 0 1-36.565333 52.736L810.666667 938.666667h-170.666667a42.666667 42.666667 0 0 1-4.992-85.034667L640 853.333333h116.053333l-21.333333-85.674666a42.709333 42.709333 0 0 0-13.397333-21.888l-4.096-3.157334-64.853334-42.666666a42.666667 42.666667 0 0 1 37.76-75.861334l4.821334 2.133334z" fill="#1beff3" p-id="1737"></path><path d="M512 102.570667a85.333333 85.333333 0 0 0-60.586667 25.258666l-30.165333 30.165334a469.333333 469.333333 0 0 0-131.882667 403.2l52.48 341.290666A42.666667 42.666667 0 0 0 384 938.666667h256a42.666667 42.666667 0 0 0 42.154667-36.181334l52.48-341.333333a469.333333 469.333333 0 0 0-131.84-403.157333l-30.293334-30.293334A85.248 85.248 0 0 0 512 102.570667z m-30.421333 115.754666L512 187.946667l30.421333 30.378666 9.088 9.386667a384 384 0 0 1 98.816 320.426667L603.306667 853.333333H420.608l-46.933333-305.152a384 384 0 0 1 107.946666-329.856z" fill="#1beff3" p-id="1738"></path><path d="M512 384a42.666667 42.666667 0 0 1 42.368 37.674667L554.666667 426.666667v128a42.666667 42.666667 0 0 1-85.034667 4.992L469.333333 554.666667v-128a42.666667 42.666667 0 0 1 42.666667-42.666667z" fill="#1beff3" p-id="1739"></path></svg>
    </button>
    <!-- <script src="./js/backToTop.js"></script> -->
    <!---------------------------------------------------------------------------- 回到顶部按钮 ---------------------------------------------------------------------------->
   </div>
  </div>
</template>
 
<script>
export default {
    data() {
        return {
            itemsPerPage: 4, // 一页只能有四个
            vueCurrentPage: 1, // 当前页码
            staticCurrentPage: 1,
            searchQuery: '', // 获取搜索输入框的信息
            VueWebList: [
                {
                    label:'https://xiaomi-vue.pages.dev/',
                    imgurl:'./img/小米logo.jpg',
                    title:"使用Cloudflare Workers + github部署Vue仿小米商城", 
                    time:"2025.06-2025.07", 
                    look:"10",
                    technology:"HTML、CSS、JavaScript、vue3、vueRouter", 
                    wb_p1:"1、利用vue框架进行网站搭建",
                    wb_p2:"2、熟练运用HTML、css、javascript对网页页面做美化处理",
                    wb_p3:"3、运用vue3组件化拆分技术把页面拆成多个组件",
                    wb_p4:"4、运用v-for 进行商品、导航部分数据渲染",
                    wb_p5:"5、运用v-show动态控制元素的显示和隐藏",
                    wb_p6:"6、页面灵活运用flex弹性布局",
                    wb_p7:"7、VueRouter 多页面路由跳转"
                },
                { 
                    label:'http://47.79.40.65:8886/',
                    imgurl:'./img/tiktok-vue.jpg',
                    title:"使用PM2部署vue2 + JSON 密码管理系统", 
                    time:"2025.08-2025.09", 
                    look:"5",
                    technology:"vue2、vuex、Node.js、JSON、axios、PM2",
                    api: "http://47.79.40.65:3000/api", 
                    wb_p1:"1、可以收起、展开数据列表。适配电脑和移动端",
                    wb_p2:"2、当数据状态码更新，该项数据自动移到新状态栏中，其状态码也同步更改颜色",
                    wb_p3:"3、可通过对应按钮一键复制信息",
                    wb_p4:"4、可以在线新增数据，并同步数据到后端db.json文件中。在线添加数据时自动获取时间",
                    wb_p5:"5、确认添加数据后会弹窗提示哪一行数据错误（账号为：user000行出错了）。并自动跳过该行数据",
                    wb_p6:"6、每次更改状态、删除数据时都会弹窗（确定/取消）",
                    wb_p7:"7、每次添加数据、更改数据、删除数据成功后都会重新刷新页面",
                    wb_p8:"8、当账号更改为封号时弹窗要求输入封号原因（默认为永久封号）。如果点击取消按钮则提示：“操作已取消，因为未提供有效理由”并取消操作；如果有输入原因就将封号原因添加到后端的db.json 文件的reason字段中，并在封号栏的对应数据盒子对应位置渲染理由",
                    wb_p9:"9、可在搜索栏搜索数据、更改数据状态、复制数据（搜索依据是：账号或密码或邮箱）"
                },
                { 
                    label:'https://hm-shopping.pages.dev/#/home',
                    imgurl:'./img/hm-shopping.jpg',
                    title:"使用Cloudflare Workers + github部署Vue购物商城", 
                    time:"2025.01-2025.03", 
                    look:"6",
                    technology:"HTML、CSS、JavaScript、vue3、vueRouter", 
                    wb_p1:"1、利用vue框架进行网站搭建",
                    wb_p2:"2、熟练运用HTML、css、javascript对网页页面做美化处理",
                    wb_p3:"3、运用vue3组件化拆分技术把页面拆成多个组件",
                    wb_p4:"4、运用v-for 进行商品、导航部分数据渲染",
                    wb_p5:"5、运用v-show动态控制元素的显示和隐藏",
                    wb_p6:"6、页面灵活运用flex弹性布局",
                    wb_p7:"7、VueRouter 多页面路由跳转"
                },
                { 
                    label:'https://tiktok-demo.pages.dev/',
                    imgurl:'./img/tiktok-demo.jpg',
                    title:"使用Cloudflare Workers + github部署vue密码管理项目", 
                    time:"2025.09-2025.09", 
                    look:"7",
                    technology:"vue3、vueRouter、vuex、Node.js、MySQL、axios",
                    api: "https://gist.githubusercontent.com/xkai003/4886740985f4d6276636b3d35c6a3744/raw/9069e4ecd9e7f605d80e54ded6427f1d6750c1e4/tiktok-data.json", 
                    wb_p1:"1、应用vue框架搭建的多页面应用程序(测试账号是：XiaoTang；密码是：123456)",
                    wb_p2:"2、应用vue-router来实现导航跳转和路由重定向功能",
                    wb_p3:"3、应用vuex搭建多组件数据共享环境",
                    wb_p4:"4、后端通过node.js拿到数据库信息并打包成一个本地的api接口供前端访问",
                    wb_p5:"5、前端通过axios请求并拿到后端传过来的数据。最后将数据渲染到页面中",
                    wb_p6:"6、本站共提供三种身份登录：数据库验证登录、管理员验证登录、游客登陆",
                    wb_p7:"7、当登陆账户是管理员XiaoTang时显示用户信息导航项，否则就没有显示"
                },
                { 
                    label:'https://myclassroommanagementsystem.pages.dev/',
                    imgurl:'./img/Vue_我的课堂管理系统.jpg',
                    title:"使用Cloudflare Workers + github部署vue我的课堂管理系统", 
                    time:"2025.03-2025.04", 
                    look:"4",
                    technology:"vue3、vueRouter、vuex、Node.js、MySQL、axios",
                    api: "https://gist.githubusercontent.com/xkai003/dffaa48ea67e287c8b49cb918cfa9a4b/raw/3d7241f6fa70e693a37f9e0b9b7e7b23010a3ec6/MyClassroomManagementSystem.json",
                    wb_p1:"1、应用vue框架搭建的多页面应用程序",
                    wb_p2:"2、应用vue-router来实现导航跳转和路由重定向功能",
                    wb_p3:"3、应用vuex搭建多组件数据共享环境",
                    wb_p4:"4、后端通过node.js拿到数据库信息并打包成一个本地的api接口供前端访问",
                    wb_p5:"5、前端通过axios请求并拿到后端传过来的数据。最后将数据渲染到页面中",
                    wb_p6:"6、本站共提供三种身份登录：数据库验证登录、管理员验证登录、游客登陆",
                    wb_p7:"7、当登陆账户是管理员XiaoTang时显示用户信息导航项，否则就没有显示"
                },
                { 
                    label:'./works/jindon/index.html',
                    imgurl:'./img/京东log.png',
                    title:"京东", 
                    time:"2025-1-1", 
                    look:"3",
                    technology:"HTML、CSS、JavaScript", 
                    wb_p1:"1、应用前端相关知识仿写京东商城"
                },
                { 
                    label:'./works/cashbook/cashbook.html',
                    imgurl:'./img/小黑记账清单（有饼图）.png',
                    title:"阿茂成绩单", 
                    time:"2025-1-1", 
                    look:"8",
                    technology:"HTML、CSS、JavaScript、vue3、vueRouter", 
                    wb_p1:"1、随着人们的生活水平的提高，日常消费种类不断增多，想必你也遇到过面对这些琳琅满目的开支而感到苦恼"
                },
                { 
                    label:'./works/notebook/notebook.html',
                    imgurl:'./img/notebook.png',
                    title:"阿茂记事本", 
                    time:"2025-1-1", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript、vue3、vueRouter", 
                    wb_p1:"1、自己的人生自己来规划，人生短短三万天，我们要学会充分规划好每一天，正所谓：机会永远留给有准备的人。让我们动起手来一起规划明天的目标吧。"
                },
                { 
                    label:'./works/baohuhaiyang/baohuhaiyan.html',
                    imgurl:'./img/保护海洋2.jpg',
                    title:"保护海洋", 
                    time:"2025-1-1", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript、vue3、vueRouter", 
                    wb_p1:"1、生活污水成为海洋环境的重要污染源，日常生活习惯会造成海洋环境的污染。有研究表明，污水已经导致沙丁鱼等近10种鱼类产卵和发育受到影响。"
                },
                { 
                    label:'./works/xhz/index.html',
                    imgurl:'./img/xhz2.png',
                    title:"惜花芷", 
                    time:"2025-2-8", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript",
                    wb_p1:"1、这是一部电视剧"
                },
                { 
                    label:'./works/Beijing/tianganmen.html',
                    imgurl:'./img/天安门.jpg',
                    title:"北京", 
                    time:"2025-2-8", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript", 
                    wb_p1:"1、这是一个景点web"
                },
                { 
                    label:'./works/yxqx/index.html',
                    imgurl:'./img/易烊千玺.jpg',
                    title:"易烊千玺", 
                    time:"2025-2-18", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript", 
                    wb_p1:"这是一个期末作业"
                },
                { 
                    label:'http://a.350611.xyz:8088/jiangli/index.html',
                    imgurl:'./img/Nginx托管静态简历网页.jpg',
                    title:"Nginx托管静态简历网页", 
                    time:"2023-10-18", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript", 
                    wb_p1:"这是一个期末作业"
                },
                { 
                    label:'./works/Love/Love.html',
                    imgurl:'./img/love.jpg',
                    title:"HTML爱心", 
                    time:"2023-9-10", 
                    look:"1",
                    technology:"HTML、CSS、JavaScript", 
                    wb_p1:"这是一个用HTML编写的爱心"
                },
                { 
                    label:'./works/PythonLove.py',
                    imgurl:'./img/PythonLove.jpg',
                    title:"Python爱心", 
                    time:"2023-9-10", 
                    look:"1",
                    technology:"Python", 
                    wb_p1:"这是一个用Python编写的爱心"
                }
            ],
        }
    },
    computed: {
        // 搜索数据
        filteredVueWebList() {
            const query = this.searchQuery.toLowerCase();
            return this.VueWebList.filter(item => {
                return (
                    item.title.toLowerCase().includes(query) ||
                    item.technology.toLowerCase().includes(query) ||
                    (item.api && item.api.toLowerCase().includes(query)) || // Check if api exists before using includes
                    (item.wb_p1 && item.wb_p1.toLowerCase().includes(query)) ||
                    (item.wb_p2 && item.wb_p2.toLowerCase().includes(query)) ||
                    (item.wb_p3 && item.wb_p3.toLowerCase().includes(query)) ||
                    (item.wb_p4 && item.wb_p4.toLowerCase().includes(query)) ||
                    (item.wb_p5 && item.wb_p5.toLowerCase().includes(query)) ||
                    (item.wb_p6 && item.wb_p6.toLowerCase().includes(query)) ||
                    (item.wb_p7 && item.wb_p7.toLowerCase().includes(query))||
                    (item.wb_p8 && item.wb_p8.toLowerCase().includes(query))||
                    (item.wb_p9 && item.wb_p9.toLowerCase().includes(query))
                );
            });
        },
        // vueTotalPages：计算属性的名称，表示 "Vue 总页数"
        // this.VueWebList.length：获取 Vue 项目列表的数组长度（即有多少个项目）
        // this.itemsPerPage：每页显示的项目数量（在你的代码中是 4）
        // Math.ceil()：JavaScript 内置函数，向上取整
        // 计算示例
        // 假设你的 Vue 项目列表有：

        // 5 个项目 (VueWebList.length = 5)
        // 每页显示 4 个 (itemsPerPage = 4)
        // 计算过程：

        // <JAVASCRIPT>
        // 5 / 4 = 1.25
        // Math.ceil(1.25) = 2
        // 结果：需要 2 页
        vueTotalPages() {
            return Math.ceil(this.filteredVueWebList.length  / this.itemsPerPage);
        },
        
        staticTotalPages() {
            return Math.ceil(this.StaticWebList.length / this.itemsPerPage);
        },
        displayedVueWebList() {
            const start = (this.vueCurrentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;
            return this.filteredVueWebList.slice(start, end); // Use filtered list
        },
    },
    methods: {
        // 上下页切换动作
        changeVuePage(page) {
            this.vueCurrentPage = page;
            // 最小只能翻到第一页
            if(this.vueCurrentPage < 1){
                alert("已经是第一页了")
                return this.vueCurrentPage = 1
            }
            // 最大只能翻到最后一页
            if(this.vueCurrentPage > this.vueTotalPages){
                alert("已经是最后一页了")
                this.vueCurrentPage = this.vueTotalPages
            }
        },
    }
}
</script>

<style scoped>
.body {
    /* position: fixed; */
    /* margin: 0; */
    /* width: 99vw;
    height: 98vh; */
    /* display: flex;
    justify-content: center;
    align-items: center; */
    /* background-color: #abe1e3; */
    background-color: rgba(250, 246, 246, 0.8);
    /* 方格背景 */
    background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
    linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
    background-size: 20px 20px;
}
/* 搜索部分 */
.search-container{
    width: 100%;
    height: 50px;
    background-color: #f1d2d2;
}
.search-container input{
    width: 100%;
    height: 100%;
    font-size: 20px;
}
/* 搜索部分 end */
/* 复制成功 */
.toast {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: rgba(0, 0, 0, 0.8);
  color: white;
  padding: 10px 20px;
  border-radius: 8px;
  z-index: 9999;
  /* pointer-events: none; */
  display: none;
}
/* 复制成功 end */

/* 页脚 */
.foot{
    width: 100%;
    /* border: 1px solid red; */
    margin-bottom: 30px;
    display: flex;
    justify-content: space-between;
}
.foot a{
    display: block;
    width: 30%;
    font-size: 15px;
    margin-left: 10px;
    margin-right: 10px;
    text-align: center;
    line-height: 50px;
    color: black;
    text-decoration: none;
    white-space: nowrap;
    overflow: hidden;         /* 2. 隐藏超出容器的部分 */
    text-overflow: ellipsis;  /* 3. 将被隐藏的部分显示为省略号 */
    /* background-color: #e4e4e4;   */
}
.foot a:hover{
    color: red;
}
/* 页脚 end*/

/* 回到顶部按钮样式 */
#backToTop {
    position: fixed;
    bottom: 100px;
    right: 30px;
    display: none; /* 默认隐藏 */
    color: white;
    background-color: rgba(0, 0, 0, 0);
    border: none;
    border-radius: 25%;
    cursor: pointer;
}
#backToTop:hover {
    background-color: #c8f2f8;
}
/* 回到顶部按钮样式 end */
/* -----------------------侧边栏导航栏----------------------- */
/* 基本样式 */
body {
    font-family: "Arial", sans-serif;
    margin: 0;
    padding: 0;
    background-color: rgba(250, 246, 246, 0.8);
    /* background-color: #d3eec1; */
    /* 方格背景 */
    background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
    linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
    background-size: 20px 20px;
}

/* 隐藏的侧边栏样式 */
.sidebar {
    height: 100%;
    width: 0;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #fff;
    /* background-color: rgba(228, 227, 227, 0.8); */
    /* background-color: rgb(208, 213, 169); */
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
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
    font-size: 36px;
    margin-left: 50px;
}
.sidebar img{
    margin-left: 32%;
    width: 80px;
    height: 80px;
    border-radius: 50%; 
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
/* -----------------------侧边栏导航栏----------------------- */

*{
    margin: 0;
}
/* 头部 */
.herd{
    width: 100%;
    height: 200px;
    text-align: center;
}
.herd p{
    font-weight: bold;
    font-size: 100px;
    color: rgb(236, 210, 210);
    font-family:sans-serif;
}
.herd span{
    font-size: 30px;
    font-family: 'Times New Roman', Times, serif;
}
/* 头部 */
/* 展览台 */
.nrr{
    /* 这部分的作用是把展览台设置成一个整体，然后设置内容垂直居中 */
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    /* background-color: #f0c5c5; */
}
.nr{
    width: 80%;
    /* 改用限制最大长度，从而满足手机屏幕自适应 */
    max-width: 1000px;
    /* background-color: #eeeeec; */
    border-radius: 15px;/* 边框圆角 */
    padding: 20px;
}
.nr a{
    text-decoration: none;
}
.item {
    width: 100%;
    /* height: 300px; */
    /* padding: 10px 30px; */
    border-radius: 15px;
    margin-top: 30px;
    display: flex;
    flex-direction: row;
    border: 1px solid #fff;
    background-color: #fff;
    box-shadow: 2px 2px 20px -2px rgb(197, 196, 196);
    /* white-space: nowrap; */
    overflow: hidden;         /* 2. 隐藏超出容器的部分 */
}
.item:hover{
    border: 1px solid rgb(197, 196, 196);
    box-shadow:1px 20px 20px -2px rgb(197, 196, 196);
}

.item img {
    width: 20%;
    /* height: 90%; */
    border-radius: 5px;
    margin: 10px;
}
.item .desc{
    width: 100%;
    padding: 30px;
    border-radius: 15px;
    color: black;
    display: flex;
    flex-direction: column;
}
.item .desc a{
    color: black;
    text-decoration: none;
}
.item .desc a:hover{
    color: red;
}
.item .desc .title{
    /* margin-top: 10px; */
    font-size: 20px;
    font-weight: bolder;
    /* font-size: 30px; 标题文字大小 */
    text-align: center; /* 标题居中 */
} 
.item .desc .spanicon{
    color: #989898;
}
.item .desc .spanicon .icon{
    width: 15px;
    height: 15px;
}
.item .desc .wb {
    /* width: 90%; */
    display: block;
    /* width: 60%; */
    /* border: 1px solid red; */
    background-color: #f0c5c5;
    /* margin-right: 30px; */
    /* padding: 10px; */
    /* 关键：当内容在水平方向上溢出时，显示滚动条 */
    overflow-y: auto;/* 垂直滚动条 */
    /* padding: 8px 12px; */
    border-radius: 4px;
}
.item .desc .api{
    /* height: 50px; */
    /* background-color: #b18e8e; */
    /* line-height: 30px; */
    /* padding: 5px 0px 5px 0px; */
    max-width: 90%;
    overflow: hidden;         /* 2. 隐藏超出容器的部分 */
    text-overflow: ellipsis;  /* 3. 将被隐藏的部分显示为省略号 */
    white-space: nowrap;
}
/* 展览台 */
/* 回到顶部按钮样式 */
#backToTop {
    position: fixed;
    bottom: 50px;
    right: 30px;
    display: none; /* 默认隐藏 */
    color: white;
    background-color: rgba(0, 0, 0, 0);
    border: none;
    border-radius: 50%;
    cursor: pointer;
}
#backToTop:hover {
    background-color: #c8f2f8;
}
/* 分页部分 */
.pagination{
    width: 100%;
    height: 50px;
    margin-top: 50px;
    /* background-color: #f7cdcd; */
    display: flex;
    justify-content: center;
}
.pagination a{
    display: block;
    line-height: 50px;
    width: 80px;
    font-size: 15px;
    color: black;
    background-color: #fff;
    text-align: center;
}
.pagination span{
    display: block;
    width: 80px;
    background-color: #fff;
    text-align: center;
    line-height: 50px;
}
</style>