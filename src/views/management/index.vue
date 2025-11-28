<template>
    <div class="admin-container">
      <div class="header">
        <div class="header-content">
          <div class="header-text">
            <h1>后台管理系统</h1>
            <p>管理你的博客内容</p>
          </div>
          <div class="header-actions">
            <span class="welcome-text">欢迎，tmk000</span>
            <button class="logout-btn">退出登录</button>
          </div>
        </div>
      </div>

      <div class="tabs">
        <button>00</button>
      </div>

      <!-- 作品管理 -->
      <div class="tab-content">
        <h2>添加作品</h2>
        <form class="admin-form">
            <div class="form-group">
            <label>标题:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>链接:</label>
            <input type="url" required>
            </div>
            <div class="form-group">
            <label>技术栈:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>时间:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>查看次数:</label>
            <input type="number" required>
            </div>
            <div class="form-group">
            <label>后端API (可选):</label>
            <input type="url">
            </div>
            <div class="form-group">
            <label>项目亮点描述:</label>
            <textarea rows="3" placeholder="亮点1"></textarea>
            <textarea rows="3" placeholder="亮点2"></textarea>
            <textarea rows="3" placeholder="亮点3"></textarea>
            </div>
            <button type="submit" class="submit-btn">添加作品</button>
        </form>

        <h3>现有作品列表</h3>
        <div class="items-list">
            <div class="item-card">
              <h4>1</h4>
              <p>1</p>
              <button class="delete-btn">删除</button>
            </div>
        </div>

        <!-- 笔记管理 -->
        <div class="tab-content">

        <h2>添加笔记</h2>
        <form class="admin-form">
            <div class="form-group">
            <label>标题:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>链接:</label>
            <input type="url" required>
            </div>
            <div class="form-group">
            <label>描述:</label>
            <textarea rows="4" required></textarea>
            </div>
            <div class="form-group">
            <label>时间:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>查看次数:</label>
            <input type="number" required>
            </div>
            <button type="submit" class="submit-btn">添加笔记</button>
        </form>
        <h3>现有笔记列表</h3>
        <div class="items-list">
              <div class="item-card">
                <h4>h4</h4>
                <p>p</p>
                <button class="delete-btn">删除</button>
              </div>
        </div>

        <!-- 旅游管理 -->
        <div class="tab-content">
        <h2>添加旅游记录</h2>
        <form class="admin-form">
            <div class="form-group">
            <label>标题:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>链接:</label>
            <input type="url" required>
            </div>
            <div class="form-group">
            <label>地点:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>描述:</label>
            <textarea rows="4" required></textarea>
            </div>
            <div class="form-group">
            <label>时间:</label>
            <input type="text" required>
            </div>
            <div class="form-group">
            <label>查看次数:</label>
            <input type="number" required>
            </div>
            <button type="submit" class="submit-btn">添加旅游记录</button>
        </form>

        <h3>现有旅游记录列表</h3>
        <div class="items-list">
            <div class="item-card">
            <h4>标题</h4>
            <p>说明</p>
            <button class="delete-btn">删除</button>
            </div>
        </div>
        </div>

        <!-- 保存按钮 -->
        <div class="save-section">
        <button class="save-btn">保存到 GitHub Gist</button>
        </div>
      </div>
      </div>
    </div>
</template>



<style scoped>
.admin-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(250, 246, 246, 0.8);
  min-height: 100vh;
}

.header {
  margin-bottom: 30px;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
}

.header-text {
  text-align: left;
}

.header-text h1 {
  color: #333;
  margin-bottom: 10px;
}

.header-text p {
  color: #666;
  font-size: 16px;
  margin: 0;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 15px;
}

.welcome-text {
  color: #666;
  font-size: 14px;
  font-weight: 500;
}

.logout-btn {
  background-color: #dc3545;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.3s;
}

.logout-btn:hover {
  background-color: #c82333;
}

.tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 30px;
  gap: 10px;
}

.tab-button {
  padding: 10px 20px;
  border: 1px solid #ddd;
  background-color: #fff;
  cursor: pointer;
  transition: all 0.3s;
  border-radius: 5px 5px 0 0;
}

.tab-button.active {
  background-color: #007bff;
  color: white;
  border-color: #007bff;
}

.tab-button:hover {
  background-color: #f8f9fa;
}

.tab-button.active:hover {
  background-color: #0056b3;
}

.tab-content {
  background-color: #fff;
  padding: 30px;
  border-radius: 0 10px 10px 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  margin-bottom: 30px;
}

.admin-form {
  margin-bottom: 40px;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
  box-sizing: border-box;
}

.form-group textarea {
  resize: vertical;
  min-height: 80px;
}

.submit-btn {
  background-color: #28a745;
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s;
}

.submit-btn:hover {
  background-color: #218838;
}

.items-list {
  margin-top: 20px;
}

.item-card {
  background-color: #f8f9fa;
  padding: 15px;
  border-radius: 8px;
  margin-bottom: 15px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.item-card h4 {
  margin: 0 0 5px 0;
  color: #333;
}

.item-card p {
  margin: 0;
  color: #666;
  font-size: 14px;
}

.delete-btn {
  background-color: #dc3545;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.delete-btn:hover {
  background-color: #c82333;
}

.save-section {
  text-align: center;
  margin-top: 40px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.save-btn {
  background-color: #007bff;
  color: white;
  padding: 15px 30px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 18px;
  transition: background-color 0.3s;
  margin-bottom: 20px;
}

.save-btn:hover:not(:disabled) {
  background-color: #0056b3;
}

.save-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.message {
  padding: 10px 20px;
  border-radius: 5px;
  font-weight: bold;
}

.message.success {
  background-color: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.message.error {
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}

h2, h3 {
  color: #333;
  margin-bottom: 20px;
  border-bottom: 2px solid #007bff;
  padding-bottom: 10px;
}
</style>