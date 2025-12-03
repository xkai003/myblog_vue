<template>
    <div class="body">
        <div class="travel-container">
        <div class="header">
            <h1>旅行足迹</h1>
            <p>世界那么大，我想去看看</p>
        </div>

        <div class="travel-stats">
            <div class="stat-item">
                <span class="stat-number">12</span>
                <span class="stat-label">城市</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">8</span>
                <span class="stat-label">省份</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">3</span>
                <span class="stat-label">国家</span>
            </div>
        </div>

        <div class="travel-grid">
            <div class="travel-card" v-for="item in travellist" :key="item.id">
                <div class="place-image">
                    <img :src="item.image" alt="">
                     <!-- <img src="../../assets/avatar.jpg" alt=""> -->
                </div>
                <div class="place-info">
                    <h3>{{ item.name }}</h3>
                    <p class="location">{{ item.location }}</p>
                    <p class="date">{{ item.date }}</p>
                    <p class="description">{{ item.description }}</p>
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
            travellist: []
        }
    },
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
.body{
    width: 100%;
    /* 方格背景 */
    background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
    linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
    background-size: 20px 20px;
}
.travel-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
}

.header {
    text-align: center;
    margin-bottom: 40px;
}

.header h1 {
    color: #333;
    font-size: 2.5rem;
    margin-bottom: 10px;
}

.header p {
    color: #666;
    font-size: 1.2rem;
}

.travel-stats {
    display: flex;
    justify-content: center;
    gap: 60px;
    margin-bottom: 40px;
}

.stat-item {
    text-align: center;
}

.stat-number {
    display: block;
    font-size: 2.5rem;
    font-weight: bold;
    color: #1976d2;
}

.stat-label {
    font-size: 1rem;
    color: #666;
}

.travel-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
}

.travel-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.travel-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.place-image {
    width: 100%;
    height: 200px;
    overflow: hidden;
}

.place-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.travel-card:hover .place-image img {
    transform: scale(1.05);
}

.place-info {
    padding: 20px;
}

.place-info h3 {
    color: #333;
    font-size: 1.5rem;
    margin: 0 0 5px 0;
}

.location {
    color: #666;
    font-size: 0.9rem;
    margin: 0 0 5px 0;
}

.date {
    color: #888;
    font-size: 0.8rem;
    margin: 0 0 15px 0;
}

.description {
    color: #555;
    line-height: 1.6;
    margin: 0;
}
</style>