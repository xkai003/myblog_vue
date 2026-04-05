<template>
  <div class="box">
    <div class="center">
      <div class="header">
        <div class="header-content">
          <div class="header-text">
            <h1>后台管理系统</h1>
            <p>博客灵魂聚焦地</p>
          </div>
          <div class="header-actions">
            <span class="welcome-text">欢迎，{{ getCurrentUser() }}</span>
            <button @click="logout" class="logout-btn">退出登录</button>
          </div>
        </div>
      </div>
      <div class="form">
        <!-- <p>用户</p> -->
        <div class="nav">
          <router-link to="/management_works">作品</router-link>
          <router-link to="/management_notes">笔记</router-link>
          <router-link to="/management_travel">旅游</router-link>
          <router-link to="/management_userinfo" style="color: #fff; background-color: #60cdf8;">用户</router-link>
        </div>
        <div class="username">
          <span>用户名：</span>
          <input type="text" placeholder="请输入标题(不超过45字)" v-model="username">
        </div>
        <div class="password">
          <span>密码：</span>
          <input type="text" placeholder="请输入链接(不超过45字)" v-model="password">
        </div>
        <div class="btn">
          <button @click="submit()">提交</button>
          <button @click="reset()">重置</button>
        </div>
      </div>
      <div class="food">
        <p>用户列表</p>
        <div class="userinfoslist">
          <ul>
            <li>用户名</li>
            <li>密码</li>
            <li>添加时间</li>
            <li>操作</li>
          </ul>
          <!--  -->
          <ul v-for="item in userinfoslist" :key="item.id">
            <li>{{ item.username }}</li>
            <li>{{ item.password }}</li>
            <li>{{ item.time }}</li>
            <li>
              <button @click="edit(item)">编辑</button>
              <button @click="del(item.id)">删除</button>
            </li>
          </ul>
        </div>
      </div>
      <!-- 编辑用户弹窗 -->
      <div class="edit" v-show="isshow">
        <div class="edit-form">
          <h3>编辑用户</h3>
          <div class="username">
            <span>用户名：</span>
            <input type="text" placeholder="请输入标题(不超过45字)" v-model="editusername">
          </div>
          <div class="password">
            <span>密码：</span>
            <input type="text" placeholder="请输入链接(不超过45字)" v-model="editpassword">
          </div>
          <div class="time">
            <span>时间：</span>
            <textarea placeholder="请输入技术栈(不超过45字)" v-model="edittime"></textarea>
          </div>
          <div class="btn">
            <button @click="editsubmit()">提交</button>
            <button @click="this.isshow = false">取消</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      username: '',
      password: '',
      time: '',
      userinfoslist: [],
      // 编辑信息
      isshow: false,
      editusername: '',
      editpassword: '',
      edittime: '',
      selectedId: null // 用于存储当前选中的用户的 ID
    }
  },
  methods: {
    // 获取当前登录用户
    getCurrentUser() {
      return sessionStorage.getItem('username');
    },
    // 退出登录
    logout() {
      sessionStorage.removeItem('isLoggedIn');
      sessionStorage.removeItem('username');
      this.$router.push('/login');
    },
    // 添加用户
    async submit () {
      // 获取时间当前时间
        const getTimestamp = function() {
          const now = new Date();
          const YYYY = now.getFullYear();
          const MM = String(now.getMonth() + 1).padStart(2, '0');
          const DD = String(now.getDate()).padStart(2, '0');
          const HH = String(now.getHours()).padStart(2, '0');
          const mm = String(now.getMinutes()).padStart(2, '0');
          const ss = String(now.getSeconds()).padStart(2, '0');
          return `${YYYY}-${MM}-${DD} ${HH}:${mm}:${ss}`;
        }

      // alert("您输入的信息如下" + '\n' + this.username + '\n' + this.password + '\n' + this.time)
      const newUserinfos = {
        id: Date.now(), // 用时间戳生成唯一 ID
        username: this.username,
        password: this.password,
        time: getTimestamp(), //把时间传递给我i服务器
      }

      if (!newUserinfos.id || !newUserinfos.username || !newUserinfos.password || !newUserinfos.time) {
        alert('请填写用户信息！')
        return
      }

      try {
        const res = await axios.post('http://localhost:3000/userinfo', newUserinfos)
        if (res.status === 201) {
          alert('添加用户成功！')
          // 重新刷新页面
          location.reload()
        } else {
          // 改进：解析 JSON 响应并显示错误消息
          try {
            const errorData = res.data
            alert(`添加失败: ${errorData.error || '未知错误'}. 详细信息: ${errorData.details || '无'}`)
          } catch (parseError) {
            alert(`添加失败，但无法解析错误信息。状态码：${res.status}`)
          }
        }
      } catch (error) {}
    },
    // 重置动作
    reset() {
      this.username = ''
      this.password = ''
      this.time = ''
    },

    // 编辑用户
    edit(item) {
      this.isshow = true,
      this.selectedId = item.id // 存储当前要修改的用户的 ID
      this.editusername = item.username
      this.editpassword = item.password
      this.edittime = item.time
    },
    // 提交编辑信息
    async editsubmit() {
      if (!this.selectedId) {
        alert('请先选择要修改的用户')
        return
      }
      try {
        // 发送 PUT 或 PATCH 请求到你的 API 以更新数据
        const apiUrl = `http://localhost:3000/userinfo/${this.selectedId}` // 替换为你的更新 API
        const response = await axios.put(apiUrl, { //  或者 Axios.patch()
          id: this.selectedId,
          username: this.editusername,
          password: this.editpassword,
          time: this.edittime
        })
        if (response.status === 200) {
          alert('修改成功！')
          this.isshow = false,
          // 重新刷新页面
          location.reload()
        } else {
          alert(`修改失败: ${response.data.error || '未知错误'}`)
        }
      } catch (error) {
        
      }
    },
    
    // 删除用户
    async del (id) {
      if (!id) return
      const confirmed = confirm('确定要删除该用户吗？')
      if (confirmed) {
        try {
          const apiUrl = `http://localhost:3000/userinfo/${id}`
          const response = await axios.delete(apiUrl)
          if (response.status === 200) {
            alert('删除成功！')
            // 重新刷新页面
            location.reload()
          } else {
            alert(`删除失败: ${response.data.error || '未知错误'}`)
          }
        } catch (error) {
          alert('删除数据失败，请检查网络。') // 更友好的报错
          console.error(error) // 方便调试
        }
      }
    },
  },
  // 请求后端数据
  async created() {
    try {
      const res = await axios.get('http://localhost:3000')
      console.log("后端数据：", res.data)
      this.userinfoslist = res.data.userinfo
    }catch(error){
      console.log("请求失败")
    }
  },
}
</script>

<style scoped>
.box{
  width: 100%;
  height: 100%;
  background-color: rgba(250, 246, 246, 0.8);
  /* 方格背景 */
  background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
  linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
  background-size: 20px 20px;
}
.box .center{
  max-width: 1200px;
  /* min-height: 100vh; */
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
.box .center .header {
  margin-bottom: 30px;
}
.box .center .header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
}
.box .center .header-text {
  text-align: left;
}
.box .center .header-text h1 {
  color: #333;
  margin-bottom: 10px;
}
.box .center .header-text p {
  color: #666;
  font-size: 16px;
  margin: 0;
}
.box .center .header-actions {
  display: flex;
  align-items: center;
  gap: 15px;
}
.box .center .welcome-text {
  color: #666;
  font-size: 14px;
  font-weight: 500;
}
.box .center .logout-btn {
  background-color: #dc3545;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.3s;
}
.box .center .logout-btn:hover {
  background-color: #c82333;
}
.box .center .nav{
  width: 100%;
  height: 35px;
  /* border: 1px solid red; */
  display: flex;
  justify-content: center;
  margin-bottom: 30px;
}
.box .center .nav a{
  display: block;
  width: 100px;
  line-height: 35px;
  text-align: center;
  text-decoration: none;
  color: black;
  background-color: #fff;
  border: 1px solid rgb(175, 181, 182);
  margin-left: 20px;
  float: left;
}
.box .center .nav a:hover{
  background-color: rgb(240, 205, 241);
}
/* .box .center .form p{
  font-size: 25px;
  text-align: center;
} */
/* .box .center .form{
  border: 1px solid red;
} */
.box .form .password,
.box .form .username,
.box .form .time{
  display: flex;
  justify-content: space-between;
  margin: 10px;
  /* border: 1px solid red; */
}
.box .form div span{
  line-height: 60px;
  font-size: 20px;
}
.box .form div input{
  width: 90%;
  height: 50px;
}
.box .form div textarea{
  width: 90%;
  height: 100px;
}
.box .btn{
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 30px;
}
.box .btn button{
  width: 100px;
  height: 40px;
  margin-left: 30px;
  border: none;
}
.box button:hover{
  cursor: pointer;
  background-color: rgb(240, 205, 241);
  border: none;
}

/* food */
.food{
  /* border: 1px solid red; */
  margin-top: 100px;
}
.food p{
  text-align: center;
  font-size: 25px;
}
.food .userinfoslist ul{
  display: flex;
  justify-content: space-between;
  margin: 0;
  padding: 0;
  list-style: none;
}
.food .userinfoslist ul li{
  width: 40%;
  /* max-width: 20ch;  用 ch 单位设置宽度 (20ch 约等于 20个字符的宽度) */
  white-space: nowrap;      /* 1. 强制文本不换行 */
  overflow: hidden;         /* 2. 隐藏超出容器的部分 */
  text-overflow: ellipsis;  /* 3. 将被隐藏的部分显示为省略号 */
  padding: 20px 0px 20px 20px;
  text-align: center;
  /* background-color: #dfb5b5; */
  border-bottom: 1px solid rgba(184, 180, 180, 0.8);
}
.food .userinfoslist ul li button{
  border: none;
  margin-left: 10px;
  padding: 10px;
}
.food .userinfoslist ul li button:hover{
  cursor: pointer;
  background-color: rgb(240, 205, 241);
  border: none;
}
/* edit */
.edit{
  position:fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
}
.edit .edit-form{
  margin: 300px auto;
  width: 500px;
  height: 300px;
  padding: 20px;
  background-color: #fff;
}
.edit .edit-form h3{
  text-align: center;
}
.edit .edit-form .username,
.edit .edit-form .password,
.edit .edit-form .time{
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}
.edit .edit-form .username input,
.edit .edit-form .password input{
  width: 85%;
  height: 30px;
}
.edit .edit-form .time textarea{
  width: 85%;
  height: 60px;
}
</style>