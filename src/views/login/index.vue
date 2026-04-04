<template>
  <div class="login-container">
    <div class="login-card">
      <div class="login-header">
        <h1>管理员登录</h1>
        <p>请输入管理员账号和密码</p>
      </div>

      <form @submit.prevent="handleLogin" class="login-form">
        <div class="form-group">
          <label for="username">用户名:</label>
          <input
            id="username"
            v-model="loginForm.username"
            type="text"
            required
            placeholder="请输入用户名"
          />
        </div>

        <div class="form-group">
          <label for="password">密码:</label>
          <input
            id="password"
            v-model="loginForm.password"
            type="password"
            required
            placeholder="请输入密码"
          />
        </div>

        <button type="submit" class="login-btn">登录</button>
      </form>

      <div v-if="errorMessage" class="error-message">
        {{ errorMessage }}
      </div>
    </div>  
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Login',
  data() {
    return {
      loginForm: {
        username: '',
        password: ''
      },
      loading: false,
      errorMessage: '',
      userinfo: []
    };
  },

  async created() {
    await this.fetchUserinfo();
  },

  methods: {
    async fetchUserinfo() {
      try {
        // 访问后端接口并拿到数据
        const response = await axios.get('http://localhost:3000');
        console.log("用户信息是：", response.data.userinfo)
        this.userinfo = response.data.userinfo || [];
      } catch (error) {
        console.error('获取用户信息失败:', error);
        this.errorMessage = '获取用户信息失败，请稍后重试';
      }
    },

    handleLogin() {
      if (this.loading) return;

      this.loading = true;
      this.errorMessage = '';

      // 验证用户凭据
      const user = this.userinfo.find(
        u => u.username === this.loginForm.username && u.password === this.loginForm.password
      );

      if (user) {
        // 登录成功，保存登录状态到 sessionStorage
        sessionStorage.setItem('isLoggedIn', 'true');
        sessionStorage.setItem('username', user.username);

        // 获取重定向路径，如果没有则默认跳转到管理页面
        alert("登录成功，即将跳转到管理页面")
        const redirectPath = this.$route.query.redirect || '/management_works';
        this.$router.push(redirectPath);
      } else {
        this.errorMessage = '用户名或密码错误';
      }

      this.loading = false;
    }
  }
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 20px;
}

.login-card {
  background: white;
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.login-header {
  text-align: center;
  margin-bottom: 30px;
}

.login-header h1 {
  color: #333;
  margin-bottom: 10px;
  font-size: 28px;
}

.login-header p {
  color: #666;
  font-size: 16px;
  margin: 0;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group label {
  color: #555;
  font-weight: 600;
  font-size: 14px;
}

.form-group input {
  padding: 12px 16px;
  border: 2px solid #e1e5e9;
  border-radius: 8px;
  font-size: 16px;
  transition: border-color 0.3s ease;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #667eea;
  box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.login-btn {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  padding: 14px 20px;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  margin-top: 10px;
}

.login-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}

.login-btn:disabled {
  opacity: 0.7;
  cursor: not-allowed;
  transform: none;
}

.error-message {
  background-color: #fee;
  color: #c33;
  padding: 12px 16px;
  border-radius: 8px;
  border: 1px solid #fcc;
  text-align: center;
  font-size: 14px;
  margin-top: 16px;
}
</style>