<template>
  <div class="box">
    <div class="center">
      <div class="form">
        <!-- <p>笔记</p> -->
        <div class="nav">
          <router-link to="/management_works">作品</router-link>
          <router-link to="/management_notes" style="color: #fff; background-color: #60cdf8;">笔记</router-link>
          <router-link to="/management_travel">旅游</router-link>
        </div>
        <div class="title">
          <span>标题：</span>
          <input type="text" placeholder="请输入标题(不超过45字)" v-model="title">
        </div>
        <div class="label">
          <span>链接：</span>
          <input type="text" placeholder="请输入链接(不超过45字)" v-model="label">
        </div>
        <div class="technology">
          <span>技术栈：</span>
          <textarea placeholder="请输入技术栈(不超过45字)" v-model="technology"></textarea>
        </div>
        <div class="btn">
          <button @click="submit()">提交</button>
          <button @click="reset()">重置</button>
        </div>
      </div>
      <div class="food">
        <p>笔记列表</p>
        <div class="noteslist">
          <ul>
            <li>标题</li>
            <li>链接</li>
            <li>技术栈</li>
            <li>操作</li>
          </ul>
          <!--  -->
          <ul v-for="item in noteslist" :key="item.id">
            <li>{{ item.title }}</li>
            <li>{{ item.label }}</li>
            <li>{{ item.technology }}</li>
            <li>
              <button @click="edit(item)">编辑</button>
              <button @click="del(item.id)">删除</button>
            </li>
          </ul>
        </div>
      </div>
      <!-- 编辑笔记弹窗 -->
       <div class="edit" v-show="isshow">
        <div class="edit-form">
          <h3>编辑笔记</h3>
          <div class="title">
            <span>标题：</span>
            <input type="text" placeholder="请输入标题(不超过45字)" v-model="edittitle">
          </div>
          <div class="label">
            <span>链接：</span>
            <input type="text" placeholder="请输入链接(不超过45字)" v-model="editlabel">
          </div>
          <div class="technology">
            <span>技术栈：</span>
            <textarea placeholder="请输入技术栈(不超过45字)" v-model="edittechnology"></textarea>
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
      title: '',
      label: '',
      technology: '',
      noteslist: [],
      // 编辑信息
      isshow: false,
      edittitle: '',
      editlabel: '',
      edittechnology: '',
      selectedId: null // 用于存储当前选中的学生的 ID
    }
  },
  methods: {
    // 添加笔记
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

      // alert("您输入的信息如下" + '\n' + this.title + '\n' + this.label + '\n' + this.technology)
      const newNotes = {
        id: Date.now(), // 用时间戳生成唯一 ID
        title: this.title,
        label: this.label,
        time: getTimestamp(), //把时间传递给我i服务器
        look: "5",
        technology: this.technology
      }

      if (!newNotes.id || !newNotes.title || !newNotes.label || !newNotes.technology) {
        alert('请填写笔记信息！')
        return
      }

      try {
        const res = await axios.post('http://localhost:3000/notes', newNotes)
        if (res.status === 201) {
          alert('添加笔记成功！')
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
      this.title = ''
      this.label = ''
      this.technology = ''
    },

    // 删除笔记
    async del (id) {
      if (!id) return
      const confirmed = confirm('确定要删除该笔记吗？')
      if (confirmed) {
        try {
          const apiUrl = `http://localhost:3000/notes/${id}`
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

    // 编辑笔记
    edit(item) {
      this.isshow = true,
      this.selectedId = item.id // 存储当前要修改的学生的 ID
      this.edittitle = item.title
      this.editlabel = item.label
      this.edittechnology = item.technology
    },
    // 提交编辑信息
    async editsubmit() {
      if (!this.selectedId) {
        alert('请先选择要修改的学生')
        return
      }
      try {
        // 发送 PUT 或 PATCH 请求到你的 API 以更新数据
        const apiUrl = `http://localhost:3000/notes/${this.selectedId}` // 替换为你的更新 API
        const response = await axios.put(apiUrl, { //  或者 Axios.patch()
          title: this.edittitle,
          label: this.editlabel,
          technology: this.edittechnology
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
    }
  },
  // 请求后端数据
  async created() {
    try {
      const res = await axios.get('http://localhost:3000')
      console.log("后端数据：", res.data)
      this.noteslist = res.data.notes
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
.box .form .label,
.box .form .title,
.box .form .technology{
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
.food .noteslist ul{
  display: flex;
  justify-content: space-between;
  margin: 0;
  padding: 0;
  list-style: none;
}
.food .noteslist ul li{
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
.food .noteslist ul li button{
  border: none;
  margin-left: 10px;
  padding: 10px;
}
.food .noteslist ul li button:hover{
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
.edit .edit-form .title,
.edit .edit-form .label,
.edit .edit-form .technology{
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}
.edit .edit-form .title input,
.edit .edit-form .label input{
  width: 85%;
  height: 30px;
}
.edit .edit-form .technology textarea{
  width: 85%;
  height: 60px;
}
</style>