<template>
    <!----------------------------------------------------------------------------------- 正文 ----------------------------------------------------------------------------------->

<div class="body">
    <!-- 导航栏 -->
    <div class="nav-container">
      <div class="nav">
        <div class="left">
          <!-- <span class="logo-text">TMK</span> -->
          <img src="../../assets/index/logo.jpg" alt="">
        </div>
        <div class="right">
          <ul>
            <li><a href="#" class="active">首页</a></li>
            <li><a href="#zp">作品</a></li>
            <li><a href="#bj">笔记</a></li>
            <li><a href="#ly">旅游</a></li>
            <li><a href="">关于</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="center">
      <!-- Banner -->
      <div class="banner">
        <div class="banner-content">
            <h1>小凯的博客</h1>
            <p class="subtitle">记录生活，分享技术，探索世界</p>
            <!-- 时间 -->
            <div class="time">
                <span>{{ year }}</span>
                <span>年</span>
                <span>{{ month }}</span>
                <span>月</span>
                <span>{{ day }}</span>
                <span>日</span>
                <span>{{ hours }}</span>
                <span>:</span>
                <span>{{ minutes }}</span>
                <span>:</span>
                <span>{{ seconds }}</span>
            </div>
        <!-- 时间 -->
        </div>
        <div class="banner-overlay"></div>
      </div>
      <!-- marquee 跑马灯 -->
      <div class="marquee-container">
        <div class="marquee-text">你好,欢迎来到我的博客。这里将不定时更新我的作品集、笔记、旅游景点哦！！！</div>
      </div>

      <!-- 作品 -->
      <section class="section-box" id="zp">
        <div class="section-header">
          <div class="header-left">
            <span class="section-title">精选作品</span>
            <span class="section-desc">Projects</span>
          </div>
          <router-link class="more-link" to="/works">查看更多<span class="arrow">→</span></router-link>
        </div>
        <div class="scroll-container">
          <!-- <a :href="item.label" v-for="item in workslist.slice(0, 4)" :key="item.id" class="card-link" @click.prevent="workslook(item)"> -->
          <a href="https://imitateboos.pages.dev/" class="card-link">
            <div class="card">
              <div class="card-img">
                <img src="../../assets/index/BOOS.jpg" alt="封面">
                <div class="img-overlay"></div>
              </div>
              <div class="card-content">
                <h3 class="card-title">仿BOSS直聘</h3>
                <div class="card-meta">
                  <div class="meta-item">
                    <!-- 精选作品盒子的时间 -->
                    <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                    <span>2025.12-2025.12</span>
                    <!-- 精选作品盒子的浏览量 -->
                    <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                    <span>10</span>
                  </div>
                </div>
                <div class="card-tags">
                  <span class="tag">技术栈：HTML、CSS、JavaScript、vue3、vueRouter</span>
                </div>
              </div>
            </div>
          </a>
          <!--  -->
          <a href="https://xiaomi-vue.pages.dev/" class="card-link">
            <div class="card">
              <div class="card-img">
                <img src="../../assets/index/xiaomilogo.jpg" alt="封面">
                <div class="img-overlay"></div>
              </div>
              <div class="card-content">
                <h3 class="card-title">仿小米商城</h3>
                <div class="card-meta">
                  <div class="meta-item">
                    <!-- 精选作品盒子的时间 -->
                    <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                    <span>2025.06-2025.07</span>
                    <!-- 精选作品盒子的浏览量 -->
                    <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                    <span>10</span>
                  </div>
                </div>
                <div class="card-tags">
                  <span class="tag">技术栈：HTML、CSS、JavaScript、vue3、vueRouter</span>
                </div>
              </div>
            </div>
          </a>
          <!--  -->
          <a href="https://hm-shopping.pages.dev/#/home" class="card-link">
            <div class="card">
              <div class="card-img">
                <img src="../../assets/index/HMshopping.jpg" alt="封面">
                <div class="img-overlay"></div>
              </div>
              <div class="card-content">
                <h3 class="card-title">黑马购物商城</h3>
                <div class="card-meta">
                  <div class="meta-item">
                    <!-- 精选作品盒子的时间 -->
                    <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                    <span>2025-12-10</span>
                    <!-- 精选作品盒子的浏览量 -->
                    <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                    <span>10</span>
                  </div>
                </div>
                <div class="card-tags">
                  <span class="tag">技术栈：HTML、CSS、JavaScript、vue3、vueRouter</span>
                </div>
              </div>
            </div>
          </a>
          <!--  -->
          <a href="https://tiktok-demo.pages.dev/" class="card-link">
            <div class="card">
              <div class="card-img">
                <img src="../../assets/index/PasswordManagementSystem.jpg" alt="封面">
                <div class="img-overlay"></div>
              </div>
              <div class="card-content">
                <h3 class="card-title">密码管理系统</h3>
                <div class="card-meta">
                  <div class="meta-item">
                    <!-- 精选作品盒子的时间 -->
                    <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                    <span>2025.09-2025.09</span>
                    <!-- 精选作品盒子的浏览量 -->
                    <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                    <span>10</span>
                  </div>
                </div>
                <div class="card-tags">
                  <span class="tag">技术栈：vue2、vueRouter、vuex、Node.js、MySQL、axios</span>
                </div>
              </div>
            </div>
          </a>
        </div>
      </section>

      <!-- 笔记 -->
      <section class="section-box" id="bj">
        <div class="section-header">
          <div class="header-left">
            <span class="section-title">学习笔记</span>
            <span class="section-desc">Notes</span>
          </div>
          <router-link class="more-link" to="/notes">查看更多<span class="arrow">→</span></router-link>
        </div>
        <div class="scroll-container">
          <!-- v-for="item in noteslist.slice(0, 4)" 限制只显示前四条数据 -->
          <!-- <a :href="item.label" v-for="item in noteslist.slice(0, 4)" :key="item.id" class="card-link" @click.prevent="noteslook(item)"> -->
          <a href="./notes/vscolod_github+cloudflare/vscolod_github+cloudflare.html" class="card-link">
            <div class="note-card">
              <div class="card-content">
                <span class="note-icon">📝</span>
                <h3 class="card-title">本地项目上传到github上并部署到cloudflare</h3>
                <div class="card-meta">
                    <!-- 学习笔记盒子的时间 -->
                  <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                  <span>2025.10.11</span>
                  <!-- 学习笔记盒子的浏览量 -->
                  <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" style="margin-left: 5px;" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                  <span>3</span>
                </div>
                <div class="card-tags">
                  <span class="tag secondary">vscolod、github、cloudflare</span>
                </div>
              </div>
            </div>
          </a>
          <!--  -->
          <a href="./notes/WindTerm_PM2/WindTerm_PM2.html" class="card-link">
            <div class="note-card">
              <div class="card-content">
                <span class="note-icon">📝</span>
                <h3 class="card-title">使用 PM2 部署 Vue 应用指南</h3>
                <div class="card-meta">
                    <!-- 学习笔记盒子的时间 -->
                  <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                  <span>2025.07.10</span>
                  <!-- 学习笔记盒子的浏览量 -->
                  <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" style="margin-left: 5px;" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                  <span>3</span>
                </div>
                <div class="card-tags">
                  <span class="tag secondary">PM2</span>
                </div>
              </div>
            </div>
          </a>
          <!--  -->
          <a href="./notes/pm2+api/pm2+api.html" class="card-link">
            <div class="note-card">
              <div class="card-content">
                <span class="note-icon">📝</span>
                <h3 class="card-title">使用PM2搭建后端api接口</h3>
                <div class="card-meta">
                    <!-- 学习笔记盒子的时间 -->
                  <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                  <span>2025.07.10</span>
                  <!-- 学习笔记盒子的浏览量 -->
                  <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" style="margin-left: 5px;" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                  <span>3</span>
                </div>
                <div class="card-tags">
                  <span class="tag secondary">PM2、MySQL</span>
                </div>
              </div>
            </div>
          </a>
          <!--  -->
          <a href="https://md-myblog.pages.dev/" class="card-link">
            <div class="note-card">
              <div class="card-content">
                <span class="note-icon">📝</span>
                <h3 class="card-title">MarkDown笔记</h3>
                <div class="card-meta">
                    <!-- 学习笔记盒子的时间 -->
                  <svg class="icon" viewBox="0 0 1024 1024" width="14" height="14"><path d="M512 73.143C269.605 73.143 73.143 269.605 73.143 512s196.462 438.857 438.857 438.857 438.857-196.462 438.857-438.857S754.395 73.143 512 73.143zm0-73.143c282.77 0 512 229.23 512 512s-229.23 512-512 512S0 794.77 0 512 229.23 0 512 0z" fill="#999"/><path d="M521.143 182.857c-25.234 0-45.714 20.48-45.714 45.714v320l-45.715 0a45.714 45.714 0 0 0 91.429 0V228.57c0-25.233-20.48-45.714-45.714-45.714z" fill="#999"/><path d="M523.337 507.611a45.714 45.714 0 0 0-32.292 78.044l165.778 160.548a45.714 45.714 0 0 0 64.622-64.585L555.666 521a45.568 45.568 0 0 0-32.33-13.385z" fill="#999"/></svg>
                  <span>2025.07.10</span>
                  <!-- 学习笔记盒子的浏览量 -->
                  <svg t="1763740826758" class="icon" viewBox="0 0 1024 1024" style="margin-left: 5px;" width="14" height="14" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7767"><path d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z" p-id="7768"></path></svg>
                  <span>3</span>
                </div>
                <div class="card-tags">
                  <span class="tag secondary">MarkDown笔记</span>
                </div>
              </div>
            </div>
          </a>
        </div>
      </section>

      <!-- 旅游 -->
      <section class="section-box" id="ly">
        <div class="section-header">
          <div class="header-left">
            <span class="section-title">旅游足迹</span>
            <span class="section-desc">Travel</span>
          </div>
          <router-link class="more-link" to="/travel">查看更多<span class="arrow">→</span></router-link>
        </div>
        <div class="scroll-container">
          <!-- v-for="item in travellist.slice(0, 4)" 限制只显示前四条数据 -->
          <!-- <a :href="item.label" v-for="item in travellist.slice(0, 4)" :key="item.id" class="card-link travel-link"> -->
          <a href="" class="card-link travel-link">
            <div class="card travel-card">
              <div class="card-img">
                <img src="https://www.yuexiu.gov.cn/img/0/764/764154/8664487.png" alt="封面">
              </div>
              <div class = "travel-info">
              <h3 class="location">越秀公园</h3>
              <p class="city">广州</p>
                <p class="station">地铁越秀公园站B1口</p>
                </div>
            </div>
          </a>
          <!--  -->
          <a href="" class="card-link travel-link">
            <div class="card travel-card">
              <div class="card-img">
                <img src="https://www.yuexiu.gov.cn/img/0/764/764782/8665100.png" alt="封面">
              </div>
              <div class = "travel-info">
              <h3 class="location">圣心大教堂</h3>
              <p class="city">广州</p>
                <p class="station">地铁一德路站B口</p>
                </div>
            </div>
          </a>
          <!--  -->
          <a href="" class="card-link travel-link">
            <div class="card travel-card">
              <div class="card-img">
                <img src="https://aos-comment.amap.com/B0FFMEK0R5/comment/e9ede5b444706eec53044ca4c14cd049_2048_2048_80.jpg" alt="封面">
              </div>
              <div class = "travel-info">
              <h3 class="location">粤海关</h3>
              <p class="city">广州</p>
                <p class="station">地铁8号线文化公园站A口</p>
                </div>
            </div>
          </a>
          <!--  -->
          <a href="" class="card-link travel-link">
            <div class="card travel-card">
              <div class="card-img">
                <img src="https://huacheng.gz-cmc.com/upload/news/image/2022/12/01/38c405194bd4459783bdc76bccea358a.jpeg" alt="封面">
              </div>
              <div class = "travel-info">
              <h3 class="location">广东省博物馆</h3>
              <p class="city">广州</p>
                <p class="station">地铁apm号线大剧院站A口</p>
                </div>
            </div>
          </a>
        </div>
      </section>
    </div>
    
    <!-- 页脚 -->
    <div class="indexfoot">
      <p>© 2026小凯的博客 Xiaokai's Blog</p>
    </div>
  </div>
<!----------------------------------------------------------------------------------- 正文 ----------------------------------------------------------------------------------->
</template>

<script>
export default {
    data() {
        return {
            currentTime: new Date(),
            timer: null
        }
    },
    mounted() {
        this.updateTime();
        this.timer = setInterval(this.updateTime, 1000);
    },
    beforeUnmount() {
        if (this.timer) {
            clearInterval(this.timer);
        }
    },
    methods: {
        updateTime() {
            this.currentTime = new Date();
        },
        formatNumber(num) {
            return num.toString().padStart(2, '0');
        }
    },
    computed: {
        year() {
            return this.currentTime.getFullYear();
        },
        month() {
            return this.formatNumber(this.currentTime.getMonth() + 1);
        },
        day() {
            return this.formatNumber(this.currentTime.getDate());
        },
        hours() {
            return this.formatNumber(this.currentTime.getHours());
        },
        minutes() {
            return this.formatNumber(this.currentTime.getMinutes());
        },
        seconds() {
            return this.formatNumber(this.currentTime.getSeconds());
        }
    }
}
</script>

<style scoped>
/* 全局变量定义 */
:root {
  color: rgb(228, 226, 226);
  --primary-color: #3498db;            /* Main blue color */
  --secondary-color: #2ecc71;          /* Green accent */
  --accent-color: #e74c3c;            /* Red focus color */
  --bg-color: #f8f9fa;                /* Light background */
  --card-bg: #ffffff;                 /* Card background */
  --text-main: #34495e;               /* Dark gray text */
  --text-secondary: #7f8c8d;          /* Light gray text */
  --shadow-sm: 0 2px 4px rgba(0,0,0,0.05); /* Subtle shadow */
  --shadow-md: 0 4px 8px rgba(0,0,0,0.08); /* Medium shadow */
  --radius-lg: 12px;                 /* Large rounded corners */
  --radius-md: 8px;                  /* Medium rounded corners */
  --font-main: 'Nunito Sans', sans-serif;    /* Main font */
  --font-headers: 'Montserrat', sans-serif; /* Header font */
}

.body{
    background-color: rgba(250, 246, 246, 0.8);
    /* 方格背景 */
    background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
    linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
    background-size: 20px 20px;
}

/* --- 导航栏 --- */
.nav-container {
  /* position: sticky; */
  top: 0;
  z-index: 100;
  width: 100%;
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(15px);
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
  box-shadow: var(--shadow-sm);
}

.nav {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  height: 70px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* .nav .left .logo-text {
  font-size: 28px;                     Larger logo
  font-weight: 700;
  color: var(--primary-color);          Use primary color
  letter-spacing: -1px;
  font-family: var(--font-headers);      Distinct font for logo
} */
 .nav .left img{
  width: 50px;
  height: 50px;
 }

.nav .right ul {
  list-style: none;
  display: flex;
  gap: 30px;
  padding: 0;
  margin: 0;
}

.nav .right ul li a {
  text-decoration: none;
  color: var(--text-secondary);
  font-weight: 500;
  font-size: 16px;
  padding: 8px 0;
  position: relative;
  transition: color 0.3s;
}

.nav .right ul li a:hover,
.nav .right ul li a.active {
  color: var(--primary-color);
}

/* Navigation underline animation */
.nav .right ul li a::after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: 0;
  left: 0;
  background-color: var(--accent-color);
  transition: width 0.3s ease;
}

.nav .right ul li a:hover::after,
.nav .right ul li a.active::after {
  width: 100%;
}

/* --- 内容区域 --- */
.center {
  max-width: 1200px;
  margin: 0 auto;
  padding: 30px 20px 60px;
  background-color: #fff;
  border: 1px solid rgba(0, 0, 0, 0.06);
}

/* --- Banner --- */
.banner {
  width: 100%;
  height: 360px;
  border-radius: var(--radius-lg);
  margin-top: 20px;
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: white;
  box-shadow: var(--shadow-md);
  background: url(../../assets/avatar.jpg) center/cover no-repeat;
}

.banner-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.6));
  z-index: 1;
}

.banner-content {
  position: relative;
  z-index: 2;
  animation: fadeInUp 0.8s ease-out;
  padding: 20px;
}

.banner h1 {
  font-size: 56px;                 /* Increase font size */
  font-weight: 700;
  margin-bottom: 15px;
  letter-spacing: 2px;
  font-family: var(--font-headers); /* Use header font */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Add shadow */
}

.banner .subtitle {
  font-size: 20px;                 /* Increase font size */
  opacity: 0.9;
  margin-bottom: 20px;
  font-weight: 300;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Add subtle shadow */
}
/* --- marquee 跑马灯 --- */
.marquee-container {
  width: 100%;
  overflow: hidden; /* 超出部分隐藏 */
  position: relative; /*  绝对定位 */
  white-space: nowrap; /* 禁止文本换行 */
}
.marquee-text {
  color: red;
  display: inline-block; /* 保持文字一行，且能被动画位移 */
  white-space: nowrap; /* 关键：禁止文字换行 */
  padding-left: 100%; /* 初始位置：文字从容器右侧外开始 */
  animation: marquee 15s linear infinite; /* 15秒匀速滚动，无限循环 */
}

/* 鼠标悬停停止滚动 */
.marquee-text:hover {
  animation-play-state: paused; /* 推荐用 paused 而非 none，恢复时更流畅 */
}
/* 跑马灯动画效果 */
@keyframes marquee {
  /* 开始 */
  0% {
    transform: translateX(0%); 
  }
  /* 消失 */
  100% {
    transform: translateX(-100%);
  }
}


/* --- 通用 Section --- */
.section-box {
  margin-top: 60px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin-bottom: 25px;
  padding-bottom: 10px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.06);
}

.section-title {
  font-size: 32px;                 /* Larger title */
  font-weight: 700;
  color: var(--text-main);
  margin-right: 10px;
  font-family: var(--font-headers);
}

.section-desc {
  font-size: 14px;
  color: var(--text-secondary);
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.more-link {
  text-decoration: none;
  color: var(--text-secondary);
  font-size: 14px;
  display: flex;
  align-items: center;
  transition: all 0.3s;
}

.more-link:hover {
  color: var(--primary-color);
  transform: translateX(5px);
}

.more-link .arrow {
  margin-left: 5px;
  font-size: 16px;
}

/* --- 滚动容器 --- */
.scroll-container {
  display: flex;
  overflow-x: auto;
  gap: 25px;
  padding: 10px 5px 30px 5px;
  scrollbar-width: none;
}

.scroll-container::-webkit-scrollbar {
  display: none;
}

/* --- 卡片通用样式 --- */
.card-link {
  text-decoration: none;
  color: inherit;
  flex: 0 0 320px;
  /* transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; */
    border: 1px solid rgb(197, 196, 196);
    background-color: #fff;
    /* box-shadow:1px 20px 20px -2px rgb(197, 196, 196); */
}

.card {
  background: var(--card-bg);
  border-radius: var(--radius-md);
  overflow: hidden;
  /* box-shadow: var(--shadow-sm); */
  /* transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1); */
  height: 100%;
  display: flex;
  flex-direction: column;
  /* border: 1px solid rgba(0, 0, 0, 0.03); */
}

.card:hover {
  /* transform: translateY(-5px); */
  /* box-shadow: var(--shadow-md); */
  box-shadow:  0 20px 30px rgba(0,0,0,0.08);
}

.card-img {
  width: 100%;
  height: 200px;     /* Adjust the image size */
  overflow: hidden;
  position: relative;
}

.card-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.travel-info {
  padding: 15px;           /* Adjust spacing inside the info */
}

.location {
  font-size: 20px;                     /* Increase title size */
  font-weight: 600;
  margin: 0 0 10px 0;
  line-height: 1.4;
  color: var(--text-main);
}

.city {
  color: var(--text-secondary);        /* City color */
  margin-bottom: 3px;
  max-height: 30px;
  overflow: hidden;/* 超出部分隐藏 */
}
.station {
  font-size: 14px;
  color: var(--text-secondary);
  border-radius: 5px;
  margin: 0px;
  max-height: 33px;
  padding: 10px;
  overflow: hidden;/* 超出部分隐藏 */
  background-color: #f0efd5;
}

.card:hover .card-img img {
  transform: scale(1.05);
}

.card-content {
  padding: 20px;
  /* background-color: #ddc1c1; */
  /* margin-bottom: 5px; */
  /* flex: 1;
  display: flex;
  flex-direction: column;  */
}

.card-title {
  font-size: 20px;                     /* Increase title size */
  font-weight: 600;
  margin: 0 0 10px 0;
  line-height: 1.4;
  color: var(--text-main);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.card-meta {
  display: flex;
  align-items: center;
  color: var(--text-secondary);
  font-size: 13px;
  margin-bottom: 12px;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 6px;
}

.card-tags {
  margin-top: auto;
}

.tag {
  display: inline-block;
  background-color: rgba(52, 152, 219, 0.15); /* Lighter blue */
  color: var(--primary-color);           /* Primary color tag */
  padding: 6px 12px;                    /* Adjust padding */
  border-radius: 6px;
  font-size: 12px;
  max-height: 30px;
  overflow: hidden;/* 超出部分隐藏 */
}

/* --- 笔记卡片特殊样式 --- */
.note-card {
  background: linear-gradient(145deg, #ffffff, #f0f0f0);
  height: 100%;
}
.note-card:hover{
  box-shadow:  0 20px 30px rgba(0,0,0,0.08);
}

.note-icon {
  font-size: 36px;
  margin-bottom: 15px;
  display: block;
  color: var(--secondary-color)         /* Green icon */
}

.tag.secondary {
  background-color: rgba(46, 204, 113, 0.15); /* Lighter green */
  color: var(--secondary-color);        /* Green tag */
}

/* --- 旅游卡片特殊样式 --- */
.travel-link {
  flex: 0 0 320px;
}

.travel-card {
  position: relative;
  height: 350px; /* reduced height slightly*/
  display: flex;
  flex-direction: column;

}

.travel-info {
  padding: 15px; /* adjust the padding*/
  border-top: 1px solid rgba(0,0,0,0.05); /*Add a border*/
  flex-grow: 1;/* occupy remaining space*/
}

.travel-info h3 {
  font-size: 18px;
}

/* 动画定义 */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .nav-container {
    padding: 0 10px;
  }

  .nav .right ul {
    gap: 15px;
  }

  .nav .right ul li a {
    font-size: 14px;
  }

  .banner h1 {
    font-size: 40px;
  }

  .banner .subtitle {
    font-size: 16px;
  }

  .card-link {
    flex: 0 0 260px;
  }

  .section-title {
    font-size: 28px;
  }
}

@media (max-width: 576px) {
  .nav .left .logo-text {
    font-size: 24px;
  }

  .banner h1 {
    font-size: 32px;
  }

  .banner .subtitle {
    font-size: 14px;
  }

  .card-link {
    flex: 0 0 85%;
  }

  .scroll-container {
    padding-left: 0;
    padding-right: 0;
  }
}
/* 工具栏 */
.home-tool-bar{
  position: fixed;
  bottom: 100px;
  right: 0px;
  text-align: center;
  display: flex;
  flex-direction: column;
  display: none;
  color: black;
  background-color: white;
  border-radius: 15px;
  border: 1px solid #cac9c9;
  overflow: hidden;
}
.home-tool-bar button{
  border: none;
  background-color: white;
}
.home-tool-bar button:hover{
  cursor: pointer;
}
.home-tool-bar .home-tool-bar-box{
  padding: 5px;
  border-bottom: 1px solid #cac9c9;
}
.desc{
    opacity: 0; /* 初始隐藏 */
    visibility: hidden; /* 防止隐藏时占用空间 */
    position: fixed; /* 绝对定位，基于 li 的相对定位 */
    right: 70px;
    padding: 8px;
    border-radius: 5px;
    text-align: center;
    color: black;
    font-size: 15px;
    background-color: #f3f2f2;
    display: flex;
    flex-direction: row;
    /* transition: opacity 0.5s ease; 平滑显示/隐藏 */
}
/* ---- 三角形 ---- */
/* 通用样式，方便展示 */
.triangle-container {
  position: fixed; /* 绝对定位*/
  right: 50px;
  width: 20px;
  height: 20px;
  /* background-color: #63ee39; */
}
/* 基础三角形样式 */
.triangle {
  width: 0;
  height: 0;
  border-style: solid;
}
/* 向右的三角形 */
.triangle-right {
  margin-top: -5px;
  border-width: 15px 0 15px 15px;
  border-color: transparent transparent transparent #f3f2f2;
}
/* 页脚 */
.indexfoot {
  /* background-color: white; */
  font-size: 15px;
  color: #cac9c9;
  text-align: center;
}
.indexfoot p{
  font-size: 15px;
  line-height: 60px;
}
</style>