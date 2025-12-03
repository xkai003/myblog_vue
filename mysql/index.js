const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise'); // 使用支持 Promise 的 mysql2
const app = express();

app.use(cors());
app.use(express.json());

// 创建数据库连接池
const db = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'myblog',
});

// 示例路由。如果请求成功后直接访问 http://localhost:3000/ 就可以看到请求过来的数据
app.get('/', async (req, res) => {
  try {
    // travel
    const [travel] = await db.query('SELECT * FROM travel');
    // notes
    const [notes] = await db.query('SELECT * FROM notes');
    // works
    const [works] = await db.query('SELECT * FROM works');
    

    res.json({
      travel,
      notes,
      works
    });
  } catch (err) {
    console.error('服务器错误:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// ====================== works 作品表 ======================
// ------ 添加数据 ------
app.post('/works', async (req, res) => {
  const { id, title, label, time, look, technology } = req.body;

  if (!id || !title || !label || !time || !look || !technology) {
    return res.status(400).json({ error: '缺少课程信息字段', details: '请检查请求体是否包含所有必需字段' });
  }

  try {
    const query = `
      INSERT INTO works (id, title, label, time, look, technology)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
    const [result] = await db.query(query, [id, title, label, time, look, technology]);

    res.status(201).json({
      message: '课程添加成功',
      newId: result.insertId,
      course: req.body
    });
  } catch (err) {
    console.error('添加课程失败:', err);
    // 改进：返回更详细的错误信息，包含原始错误和堆栈信息
    res.status(500).json({
      error: 'Internal Server Error',
      details: err.message,
      stack: err.stack  // 注意：在生产环境中，避免将完整的堆栈信息暴露给客户端
    });
  }
});
// ------ 编辑作品 ------
app.put('/works/:id', async (req, res) => {
  console.log("Received PUT request to /works/:id"); // 确认请求已到达
  console.log("Request parameters (params):", req.params); // 输出所有 URL 参数
  console.log("Request body (body):", req.body);       // 输出请求体
  const userId = req.params.id;
  const { title, label, technology } = req.body;

  if (!title || !label || !technology) {
    console.log("Error: Missing title or label or technology"); // 检查是否有缺少用户名或密码的错误
    return res.status(400).json({ error: '缺少用户名或密码' });
  }

  let connection;
  try {
    connection = await db.getConnection();
    // 构建 SQL UPDATE 语句
    const query = `
      UPDATE works
      SET title = ?, label = ?, technology = ?
      WHERE id = ?
    `;
    //  执行查询
    const [result] = await db.query(query, [title, label, technology, userId]);
    //  检查是否有行受到影响
    if (result.affectedRows === 0) {
      console.log("Error: User not found with ID:", userId); // 输出没找到用户的错误
      return res.status(404).json({ error: '未找到要更新的用户' });
    }

    console.log("User information updated successfully. User ID:", userId); // 成功的log
    res.json({ message: '用户信息更新成功', updatedId: userId });
  } catch (err) {
    console.error('更新用户信息失败:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  } finally {
    if (connection) {
      connection.release();
    }
  }
});
// ------ 删除数据 ------
app.delete('/works/:id', async (req, res) => {
  const courseId = req.params.id; // 获取 URL 参数中的 ID
  console.log(`尝试删除 ID 为 ${courseId} 的课程`);
  
  try {
    // 执行 SQL DELETE 语句
    const [result] = await db.query('DELETE FROM works WHERE id = ?', [courseId]);
    
    // 检查是否有行受到影响
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: '未找到要删除的课程' });
    }

    res.json({ message: '课程删除成功', deletedId: courseId });
  } catch (err) {
    console.error('删除课程失败:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// ====================== notes 笔记表 ======================
// ------ 添加数据 ------
app.post('/notes', async (req, res) => {
  const { id, title, label, time, look, technology } = req.body;

  if (!id || !title || !label || !time || !look || !technology) {
    return res.status(400).json({ error: '缺少课程信息字段', details: '请检查请求体是否包含所有必需字段' });
  }

  try {
    const query = `
      INSERT INTO notes (id, title, label, time, look, technology)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
    const [result] = await db.query(query, [id, title, label, time, look, technology]);

    res.status(201).json({
      message: '课程添加成功',
      newId: result.insertId,
      course: req.body
    });
  } catch (err) {
    console.error('添加课程失败:', err);
    // 改进：返回更详细的错误信息，包含原始错误和堆栈信息
    res.status(500).json({
      error: 'Internal Server Error',
      details: err.message,
      stack: err.stack  // 注意：在生产环境中，避免将完整的堆栈信息暴露给客户端
    });
  }
});
// ------ 编辑笔记 ------
app.put('/notes/:id', async (req, res) => {
  console.log("Received PUT request to /notes/:id"); // 确认请求已到达
  console.log("Request parameters (params):", req.params); // 输出所有 URL 参数
  console.log("Request body (body):", req.body);       // 输出请求体
  const userId = req.params.id;
  const { title, label, technology } = req.body;

  if (!title || !label || !technology) {
    console.log("Error: Missing title or label or technology"); // 检查是否有缺少用户名或密码的错误
    return res.status(400).json({ error: '缺少用户名或密码' });
  }

  let connection;
  try {
    connection = await db.getConnection();
    // 构建 SQL UPDATE 语句
    const query = `
      UPDATE notes
      SET title = ?, label = ?, technology = ?
      WHERE id = ?
    `;
    //  执行查询
    const [result] = await db.query(query, [title, label, technology, userId]);
    //  检查是否有行受到影响
    if (result.affectedRows === 0) {
      console.log("Error: User not found with ID:", userId); // 输出没找到用户的错误
      return res.status(404).json({ error: '未找到要更新的用户' });
    }

    console.log("User information updated successfully. User ID:", userId); // 成功的log
    res.json({ message: '用户信息更新成功', updatedId: userId });
  } catch (err) {
    console.error('更新用户信息失败:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  } finally {
    if (connection) {
      connection.release();
    }
  }
});
// ------ 删除数据 ------
app.delete('/notes/:id', async (req, res) => {
  const courseId = req.params.id; // 获取 URL 参数中的 ID
  console.log(`尝试删除 ID 为 ${courseId} 的课程`);
  
  try {
    // 执行 SQL DELETE 语句
    const [result] = await db.query('DELETE FROM notes WHERE id = ?', [courseId]);
    
    // 检查是否有行受到影响
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: '未找到要删除的课程' });
    }

    res.json({ message: '课程删除成功', deletedId: courseId });
  } catch (err) {
    console.error('删除课程失败:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// ====================== travel 旅游表 ======================
// ------ 添加数据 ------
app.post('/travel', async (req, res) => {
  const { id, name, location, image, time, description } = req.body;

  if (!id || !name || !location || !image || !time || !description) {
    return res.status(400).json({ error: '缺少课程信息字段', details: '请检查请求体是否包含所有必需字段' });
  }

  try {
    const query = `
      INSERT INTO travel (id, name, location, image, time, description)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
    const [result] = await db.query(query, [id, name, location, image, time, description]);

    res.status(201).json({
      message: '课程添加成功',
      newId: result.insertId,
      course: req.body
    });
  } catch (err) {
    console.error('添加课程失败:', err);
    // 改进：返回更详细的错误信息，包含原始错误和堆栈信息
    res.status(500).json({
      error: 'Internal Server Error',
      details: err.message,
      stack: err.stack  // 注意：在生产环境中，避免将完整的堆栈信息暴露给客户端
    });
  }
});
// ------ 编辑旅游 ------
app.put('/travel/:id', async (req, res) => {
  console.log("Received PUT request to /travel/:id"); // 确认请求已到达
  console.log("Request parameters (params):", req.params); // 输出所有 URL 参数
  console.log("Request body (body):", req.body);       // 输出请求体
  const userId = req.params.id;
  const { name, location, image, description } = req.body;

  if (!name || !location || !image || !description) {
    console.log("Error: Missing name or location or image or description"); // 检查是否有缺少用户名或密码的错误
    return res.status(400).json({ error: '缺少用户名或密码' });
  }

  let connection;
  try {
    connection = await db.getConnection();
    // 构建 SQL UPDATE 语句
    const query = `
      UPDATE travel
      SET name = ?, location = ?, image = ?, description = ?
      WHERE id = ?
    `;
    //  执行查询
    const [result] = await db.query(query, [name, location, image, description,  userId]);
    //  检查是否有行受到影响
    if (result.affectedRows === 0) {
      console.log("Error: User not found with ID:", userId); // 输出没找到用户的错误
      return res.status(404).json({ error: '未找到要更新的用户' });
    }

    console.log("User information updated successfully. User ID:", userId); // 成功的log
    res.json({ message: '用户信息更新成功', updatedId: userId });
  } catch (err) {
    console.error('更新用户信息失败:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  } finally {
    if (connection) {
      connection.release();
    }
  }
});
// ------ 删除数据 ------
app.delete('/travel/:id', async (req, res) => {
  const courseId = req.params.id; // 获取 URL 参数中的 ID
  console.log(`尝试删除 ID 为 ${courseId} 的课程`);
  
  try {
    // 执行 SQL DELETE 语句
    const [result] = await db.query('DELETE FROM travel WHERE id = ?', [courseId]);
    
    // 检查是否有行受到影响
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: '未找到要删除的课程' });
    }

    res.json({ message: '课程删除成功', deletedId: courseId });
  } catch (err) {
    console.error('删除课程失败:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});




app.listen(3000, () => {
  console.log('服务器启动成功： http://localhost:3000');
});

