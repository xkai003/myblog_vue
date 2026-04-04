<template>
  <div class="page-body">
    <div class="main-container">
      <!-- 头部区域 -->
      <div class="header-box">
        <p class="hello-text">Hello</p>
        <span class="welcome-text">Welcome to my world!</span>
      </div>

      <div class="content-wrapper">
        <div class="content-card" id="app">
          <!-- 搜索框（仅第一页显示） -->
          <div 
            class="search-container" 
            v-if="vueCurrentPage == 1"
          >
            <input 
              type="text" 
              placeholder="请输入你要搜索的内容" 
              v-model="searchQuery"
            >
          </div>

          <!-- 列表项 -->
          <div 
            class="item-card" 
            v-for="item in displayedVueWebList" 
            :key="item.id"
          >
            <div class="item-desc">
              <a :href="item.label" class="item-title">{{ item.title }}</a>
              
              <div class="item-info">
                <span class="info-item">
                  <svg class="icon" viewBox="0 0 1024 1024">
                    <path d="M512 73.142857C269.604571 73.142857 73.142857 269.604571 73.142857 512s196.461714 438.857143 438.857143 438.857143 438.857143-196.461714 438.857143-438.857143S754.395429 73.142857 512 73.142857z m0-73.142857c282.770286 0 512 229.229714 512 512s-229.229714 512-512 512S0 794.770286 0 512 229.229714 0 512 0z" fill="#666"></path>
                    <path d="M521.142857 182.857143C495.908571 182.857143 475.428571 203.337143 475.428571 228.571429V548.571429a45.714286 45.714286 0 0 0 91.428572 0V228.571429c0-25.234286-20.48-45.714286-45.714286-45.714286z" fill="#666"></path>
                    <path d="M523.337143 507.611429a45.714286 45.714286 0 0 0-32.292572 78.043428l165.778286 160.548572a45.714286 45.714286 0 0 0 64.621714-64.585143l-165.778285-160.621715a45.568 45.568 0 0 0-32.329143-13.385142z"></path>
                  </svg>
                  {{ item.time }}
                </span>
                <span class="info-item">
                  <svg class="icon" viewBox="0 0 1024 1024">
                    <path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" fill="#666"></path>
                  </svg>
                  {{ item.look }}
                </span>
              </div>

              <span class="tech-stack">技术栈：{{ item.technology }}</span>
              <div class="api-box" v-if="item.api">
                <span>后端API：</span>
                <a :href="item.api" class="api-link">{{ item.api }}</a>
              </div>
              
              <a :href="item.label" class="go-link">进入 →</a>
            </div>
          </div>

          <!-- 分页 -->
          <div class="pagination">
            <a 
              href="#" 
              @click.prevent="changeVuePage(1)" 
              :class="{ active: vueCurrentPage === 1 }" 
              v-if="vueTotalPages > 1"
            >
              第一页
            </a>
            <a href="#" @click.prevent="changeVuePage(vueCurrentPage - 1)">&lt;</a>
            <span class="page-num">{{ vueCurrentPage }}</span>
            <a href="#" @click.prevent="changeVuePage(vueCurrentPage + 1)">&gt;</a>
            <a 
              href="#" 
              @click.prevent="changeVuePage(vueTotalPages)" 
              :class="{ active: vueCurrentPage === vueTotalPages }" 
              v-if="vueTotalPages > 1"
            >
              最后一页
            </a>
          </div>
        </div>
      </div>

      <!-- 回到顶部 -->
      <button id="backToTop" class="back-top-btn">
        <svg viewBox="0 0 1024 1024" width="30" height="30">
          <path d="M383.786667 640.853333a42.666667 42.666667 0 0 1-8.192 56.149334l-3.968 2.986666-64.64 42.496a42.666667 42.666667 0 0 0-16.085333 20.138667l-1.621333 5.034667L267.946667 853.333333H384a42.666667 42.666667 0 0 1 42.368 37.674667L426.666667 896a42.666667 42.666667 0 0 1-37.674667 42.368L384 938.666667H213.333333a42.666667 42.666667 0 0 1-42.325333-48.213334l0.938667-4.778666 34.56-138.666667a128.042667 128.042667 0 0 1 46.250666-70.570667l7.082667-5.12 64.853333-42.666666a42.666667 42.666667 0 0 1 59.093334 12.202666z m311.168-14.677333l4.352 2.517333 65.066666 42.794667a128 128 0 0 1 50.773334 67.2l2.346666 8.32 34.56 138.666667a42.666667 42.666667 0 0 1-36.565333 52.736L810.666667 938.666667h-170.666667a42.666667 42.666667 0 0 1-4.992-85.034667L640 853.333333h116.053333l-21.333333-85.674666a42.709333 42.709333 0 0 0-13.397333-21.888l-4.096-3.157334-64.853334-42.666666a42.666667 42.666667 0 0 1 37.76-75.861334l4.821334 2.133334z" fill="#1beff3"></path>
          <path d="M512 102.570667a85.333333 85.333333 0 0 0-60.586667 25.258666l-30.165333 30.165334a469.333333 469.333333 0 0 0-131.882667 403.2l52.48 341.290666A42.666667 42.666667 0 0 0 384 938.666667h256a42.666667 42.666667 0 0 0 42.154667-36.181334l52.48-341.333333a469.333333 469.333333 0 0 0-131.84-403.157333l-30.293334-30.293334A85.248 85.248 0 0 0 512 102.570667z m-30.421333 115.754666L512 187.946667l30.421333 30.378666 9.088 9.386667a384 384 0 0 1 98.816 320.426667L603.306667 853.333333H420.608l-46.933333-305.152a384 384 0 0 1 107.946666-329.856z" fill="#1beff3"></path>
          <path d="M512 384a42.666667 42.666667 0 0 1 42.368 37.674667L554.666667 426.666667v128a42.666667 42.666667 0 0 1-85.034667 4.992L469.333333 554.666667v-128a42.666667 42.666667 0 0 1 42.666667-42.666667z" fill="#1beff3"></path>
        </svg>
      </button>
    </div>
  </div>
</template>
 
<script>
import axios from 'axios'
export default {
    data() {
        return {
            itemsPerPage: 4, // 一页只能有四个
            vueCurrentPage: 1, // 当前页码
            staticCurrentPage: 1,
            searchQuery: '', // 获取搜索输入框的信息
            VueWebList: []
        }
    },
    async created() {
        try {
            const res = await axios.get('http://localhost:3000')
            console.log("后端数据：", res.data)
            this.VueWebList = res.data.works
        }catch(error){
            console.log("请求失败")
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
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* 深色主体 */
.page-body {
  min-height: 100vh;
  background: #121212;
  padding: 20px;
  font-family: "Microsoft YaHei", sans-serif;
  scroll-behavior: smooth;
}

.main-container {
  max-width: 1000px;
  margin: 0 auto;
}

/* 头部 */
.header-box {
  text-align: center;
  margin-bottom: 30px;
  padding: 30px 20px;
  background: #1a1a1a;
  border-radius: 16px;
  transition: all 0.3s ease;
}
.header-box:hover {
  transform: translateY(-4px);
}

.hello-text {
  font-size: 28px;
  font-weight: bold;
  color: #fff;
  margin: 0 0 10px 0;
}

.welcome-text {
  font-size: 16px;
  color: #aaa;
  letter-spacing: 1px;
}

/* 内容 */
.content-wrapper {
  margin-bottom: 40px;
}

.content-card {
  background: #181818;
  border-radius: 16px;
  padding: 28px;
}

/* 搜索框 */
.search-container {
  margin-bottom: 28px;
}
.search-container input {
  width: 100%;
  padding: 14px 18px;
  border: 1px solid #333;
  border-radius: 10px;
  font-size: 15px;
  outline: none;
  background: #222;
  color: #eee;
  transition: all 0.3s ease;
}
.search-container input:focus {
  border-color: #00eaff;
  box-shadow: 0 0 12px rgba(0,234,255,0.2);
}

/* 卡片 + 旋转流光核心 */
.item-card {
  padding: 24px;
  margin-bottom: 16px;
  background: #222;
  border-radius: 12px;
  transition: all 0.3s ease;
  position: relative;
  z-index: 1;
  overflow: hidden;
}
.item-card:last-child {
  margin-bottom: 0;
}
.item-card:hover {
  transform: translateY(-5px) scale(1.01);
}

/* 旋转流光 */
.item-card::before {
  content: '';
  position: absolute;
  width: 150%;
  height: 150%;
  top: 50%;
  left: 50%;
  z-index: -2;
  background: conic-gradient(#00eaff, #0088ff, #ff00cc, #00eaff);
  animation: rotateLight 3s linear infinite;
  transform: translate(-50%, -50%) rotate(0deg);
  opacity: 0;
  transition: opacity 0.3s;
}
/* 遮罩层 */
.item-card::after {
  content: '';
  position: absolute;
  inset: 2px;
  background: #222;
  border-radius: 10px;
  z-index: -1;
}
/* hover 显示旋转光效 */
.item-card:hover::before {
  opacity: 1;
}

@keyframes rotateLight {
  0% {
    transform: translate(0%, 0%) rotate(0deg);
  }
  10% {
    transform: translate(10%, 10%) rotate(10deg);
  }
  /* 100% {
    transform: translate(-50%, -50%) rotate(360deg);
  } */
}

/* 文字样式 */
.item-desc {
  line-height: 1.9;
  position: relative;
  z-index: 2;
}
.item-title {
  font-size: 19px;
  font-weight: 600;
  color: #00eaff;
  text-decoration: none;
  margin-bottom: 10px;
  display: inline-block;
  transition: 0.3s;
}
.item-title:hover {
  color: #fff;
}

.item-info {
  display: flex;
  gap: 24px;
  margin: 10px 0;
  color: #888;
  font-size: 14px;
}
.info-item {
  display: flex;
  align-items: center;
  gap: 5px;
}
.icon {
  width: 16px;
  height: 16px;
  filter: brightness(0.6);
}

.tech-stack {
  color: #ccc;
  padding: 4px 8px;
  background: #2a2a2a;
  border-radius: 6px;
  margin: 6px 0;
}
.api-box {
  color: #888;
  margin: 8px 0;
}
.api-link {
  color: #00aaff;
  text-decoration: none;
}
.api-link:hover {
  color: #00eaff;
}

/* 进入按钮 */
.go-link {
  display: inline-block;
  margin-top: 12px;
  padding: 6px 14px;
  color: #000;
  background: #00eaff;
  border-radius: 8px;
  text-decoration: none;
  transition: 0.3s;
}
.go-link:hover {
  background: #0088ff;
  color: #fff;
  transform: translateX(6px);
}

/* 分页 */
.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 14px;
  margin-top: 36px;
}
.pagination a {
  color: #888;
  padding: 8px 14px;
  border-radius: 8px;
  transition: 0.3s;
  text-decoration: none;
}
.pagination a:hover {
  background: #2a2a2a;
  color: #00eaff;
}
.pagination a.active {
  background: #0088ff;
  color: #fff;
}
.page-num {
  color: #ccc;
  font-weight: 500;
}

/* 回到顶部 */
.back-top-btn {
  position: fixed;
  bottom: 40px;
  right: 30px;
  width: 56px;
  height: 56px;
  border-radius: 50%;
  background: #1a1a1a;
  border: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: 0.3s;
}
.back-top-btn:hover {
  transform: translateY(-6px);
  background: #2a2a2a;
}
</style>