<template>
  <div class="box">
    <div class="center">
      <div class="form">
        <!-- <p>旅游</p> -->
        <div class="nav">
          <router-link to="/management_works">作品</router-link>
          <router-link to="/management_notes">笔记</router-link>
          <router-link to="/management_travel" style="color: #fff; background-color: #60cdf8;">旅游</router-link>
        </div>
        <div class="name">
          <span>标题：</span>
          <input type="text" placeholder="请输入标题(不超过45字)" v-model="name">
        </div>
        <div class="location">
          <span>地点：</span>
          <input type="text" placeholder="请输入地点(不超过45字)" v-model="location">
        </div>
        <div class="image">
          <span>图片：</span>
          <input type="text" placeholder="请输入图片(不超过45字)" v-model="image">
        </div>
        <div class="description">
          <span>描述：</span>
          <textarea placeholder="请输入描述(不超过45字)" v-model="description"></textarea>
        </div>
        <div class="btn">
          <button @click="submit()">提交</button>
          <button @click="reset()">重置</button>
        </div>
      </div>
      <div class="food">
        <p>旅游列表</p>
        <div class="travellist">
          <ul>
            <li>标题</li>
            <li>地点</li>
            <li>图片</li>
            <li>描述</li>
            <li>操作</li>
          </ul>
          <!--  -->
          <ul v-for="item in travellist" :key="item.id">
            <li>{{ item.name }}</li>
            <li>{{ item.location }}</li>
            <li>{{ item.image }}</li>
            <li>{{ item.description }}</li>
            <li>
              <button @click="edit(item)">编辑</button>
              <button @click="del(item.id)">删除</button>
            </li>
          </ul>
        </div>
      </div>
      <!-- 编辑旅游弹窗 -->
       <div class="edit" v-show="isshow">
        <div class="edit-form">
          <h3>编辑旅游</h3>
          <div class="name">
            <span>标题：</span>
            <input type="text" placeholder="请输入标题(不超过45字)" v-model="editname">
          </div>
          <div class="location">
            <span>地点：</span>
            <input type="text" placeholder="请输入地点(不超过45字)" v-model="editlocation">
          </div>
          <div class="image">
            <span>图片：</span>
            <input type="text" placeholder="请输入图片链接(不超过45字)" v-model="editimage">
            <!-- <textarea placeholder="请输入图片链接" v-model="editimage"></textarea> -->
          </div>
          <div class="description">
            <span>描述：</span>
            <textarea placeholder="请输入描述(不超过45字)" v-model="editdescription"></textarea>
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
      name: '',
      location: '',
      image: '',
      description: '',
      travellist: [],
      // 编辑信息
      isshow: false,
      editname: '',
      editlocation: '',
      editimage: '',
      editdescription: '',
      selectedId: null // 用于存储当前选中的旅游的 ID
    }
  },
  methods: {
    // 添加旅游
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

      // alert("您输入的信息如下" + '\n' + this.name + '\n' + this.location + '\n' + this.image)
      const newtravel = {
        id: Date.now(), // 用时间戳生成唯一 ID
        name: this.name,
        location: this.location,
        time: getTimestamp(), //把时间传递给我i服务器
        look: "5",
        image: this.image,
        description: this.description,
      }

      if (!newtravel.id || !newtravel.name || !newtravel.location || !newtravel.image || !this.description) {
        alert('请填写所有课程信息！')
        return
      }

      try {
        const res = await axios.post('http://localhost:3000/travel', newtravel)
        if (res.status === 201) {
          alert('添加旅游成功！')
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
      this.name = ''
      this.location = ''
      this.image = ''
      this.description = ''
      this.editdescription = ''
    },

    // 删除旅游
    async del (id) {
      if (!id) return
      const confirmed = confirm('确定要删除该旅游吗？')
      if (confirmed) {
        try {
          const apiUrl = `http://localhost:3000/travel/${id}`
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

    // 编辑旅游
    edit(item) {
      this.isshow = true,
      this.selectedId = item.id // 存储当前要修改的旅游的 ID
      this.editname = item.name
      this.editlocation = item.location
      this.editimage = item.image
      this.editdescription = item.description
    },
    // 提交编辑信息
    async editsubmit() {
      if (!this.selectedId) {
        alert('请先选择要修改的旅游')
        return
      }
      try {
        // 发送 PUT 或 PATCH 请求到你的 API 以更新数据
        const apiUrl = `http://localhost:3000/travel/${this.selectedId}` // 替换为你的更新 API
        const response = await axios.put(apiUrl, { //  或者 Axios.patch()
          name: this.editname,
          location: this.editlocation,
          image: this.editimage,
          description: this.editdescription
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
      this.travellist = res.data.travel
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
.box .form .location,
.box .form .name,
.box .form .image,
.box .form .description{
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
.food .travellist ul{
  display: flex;
  justify-content: space-between;
  margin: 0;
  padding: 0;
  list-style: none;
}
.food .travellist ul li{
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
.food .travellist ul li button{
  border: none;
  margin-left: 10px;
  padding: 10px;
}
.food .travellist ul li button:hover{
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
  /* height: 300px; */
  padding: 20px;
  background-color: #fff;
}
.edit .edit-form h3{
  text-align: center;
}
.edit .edit-form .name,
.edit .edit-form .location,
.edit .edit-form .image,
.edit .edit-form .description{
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}
.edit .edit-form .name input,
.edit .edit-form .location input,
.edit .edit-form .image input{
  width: 85%;
  height: 30px;
}
.edit .edit-form .description textarea{
  width: 85%;
  height: 60px;
}
</style>