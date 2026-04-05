<template>
  <div class="register-container">
    <div class="register-card">
      <div class="register-header">
        <h1>注册账号</h1>
        <p>此注册信息会添加到数据库</p>
      </div>

      <form @submit.prevent="handleRegister" class="register-form">
        <div class="form-group">
          <label for="username">用户名:</label>
          <input
            id="username"
            v-model="username"
            type="text"
            required
            placeholder="请输入用户名"
          />
        </div>

        <div class="form-group">
          <label for="password">密码:</label>
          <input
            id="password"
            v-model="password"
            type="password"
            required
            placeholder="请输入密码"
          />
        </div>

        <button type="submit" class="register-btn">注册</button>
      </form>
      <div class="more">
        <router-link to="/login">登陆</router-link>
      </div>

      <div v-if="errorMessage" class="error-message">
        {{ errorMessage }}
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'Register',
    data() {
    return {
        username: '',
        password: '',
        errorMessage: ''
    };
    },
    methods: {
        // 生成标准时间戳
        getTimestamp() {
        const now = new Date();
        const YYYY = now.getFullYear();
        const MM = String(now.getMonth() + 1).padStart(2, '0');
        const DD = String(now.getDate()).padStart(2, '0');
        const HH = String(now.getHours()).padStart(2, '0');
        const mm = String(now.getMinutes()).padStart(2, '0');
        const ss = String(now.getSeconds()).padStart(2, '0');
        return `${YYYY}-${MM}-${DD} ${HH}:${mm}:${ss}`;
        },

        // 统一注册处理函数
        async handleRegister() {
            // 清空之前的错误
            this.errorMessage = '';

            // 前端校验
            if (!this.username.trim()) {
                this.errorMessage = '请输入用户名';
                alert('请输入用户名');
                return;
            }
            if (!this.password.trim()) {
                this.errorMessage = '请输入密码';
                alert('请输入密码');
                return;
            }

            // 构造用户数据
            const userData = {
                id: Date.now(),
                username: this.username,
                password: this.password,
                time: this.getTimestamp()
            };

            try {
                // 请求接口
                const res = await axios.post('http://localhost:3000/userinfo', userData);

                if (res.status === 201) {
                // 提示成功信息
                this.errorMessage = '注册成功，即将跳转到登录页面';
                this.errorMessage = 'success'; // 标记成功状态

                // 延迟1秒跳转到登录页
                setTimeout(() => {
                    const redirectPath = this.$route.query.redirect || '/login';
                    this.$router.push(redirectPath);
                    // 清空表单
                    this.username = '';
                    this.password = '';
                }, 1000);
                }
            } catch (err) {
                console.error('注册失败：', err);
                const msg = err.response?.data?.error || '注册失败，请稍后重试';
                this.errorMessage = msg;
            }
        }
    }
}
</script>

<style scoped>
.register-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 20px;
}

.register-card {
  background: white;
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
  display: flex;
  flex-direction: column;
}

.register-header {
  text-align: center;
  margin-bottom: 30px;
}

.register-header h1 {
  color: #333;
  margin-bottom: 10px;
  font-size: 28px;
}

.register-header p {
  color: #666;
  font-size: 16px;
  margin: 0;
}

.register-form {
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

.register-btn {
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

.register-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}

.register-btn:disabled {
  opacity: 0.7;
  cursor: not-allowed;
  transform: none;
}
.more{
  padding: 5px 0px;
  /* background-color: #fcc2c2; */
}
.more a{
  float: right;
  margin-left: 8px;
  text-decoration: none;
  color: #764ba2;
}
.more a:hover{
  color: #f53b1a;
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