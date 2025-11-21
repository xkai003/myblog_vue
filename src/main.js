import { createApp } from 'vue'
import App from './App.vue'
import router from './router' // 正确： 导入路由实例 (从 router.js)

const app = createApp(App)

app.use(router).mount('#app') // 正确： 使用路由
