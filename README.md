# Vue  + MySQL 个人博客系统
### 本站的工作流程图如下
![本站的工作流程图](/readme-image/流程图.jpg "Magic Gardens")

### 管理页功能
<table border="1">
    <tr>
        <td style="width: 50px">页面</td>
        <td style="width: 100px">功能列表</td>
    </tr>
    <tr>
        <td>作品</td>
        <td>
            1、添加作品<br>
            2、修改作品<br>
            3、删除作品<br>
        </td>
    </tr>
    <tr>
        <td>笔记</td>
        <td>
            1、添加笔记<br>
            2、修改笔记<br>
            3、删除笔记<br>
        </td>
    </tr>
    <tr>
        <td>旅游</td>
        <td>
            1、添加旅游<br>
            2、修改旅游<br>
            3、删除旅游<br>
        </td>
    </tr>
</table>

### 导入数据库
步骤一：打开MySQL Workbench软件并登录进去<br>
![本站的工作流程图](/readme-image/导入数据库1.png "Magic Gardens")<br>
步骤二：点击 File → Run SQL Script → 选择以下的sql文件 → 点击打开按钮<br>
![本站的工作流程图](/readme-image/导入数据库2.png "Magic Gardens")<br>
步骤三：按照以下红框信息填写 → 点击 Run <br>
![本站的工作流程图](/readme-image/导入数据库3.png "Magic Gardens")<br>
步骤三：导入成功后关闭这个窗口即可<br>
步骤四：右键点击数据库 Refresh All 刷新数据库就可以看见刚才导入的数据库了

### 启动项目
步骤一：进入mysql文件夹并打开终端<br>
步骤二：在终端输入以下命令启动后端<br>
<code>node index.js</code><br>
步骤三：进入myblog_vue文件夹<br>
步骤四：在终端输入以下命令启动前端<br>
<code>npm run serve</code><br>
前端Vue ：http://localhost:5173/<br>
后端数据库mysql：http://localhost:3000