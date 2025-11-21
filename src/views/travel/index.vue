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
            <div class="travel-card" v-for="place in places" :key="place.id">
                <div class="place-image">
                    <img :src="place.image" :alt="place.name">
                </div>
                <div class="place-info">
                    <h3>{{ place.name }}</h3>
                    <p class="location">{{ place.location }}</p>
                    <p class="date">{{ place.date }}</p>
                    <p class="description">{{ place.description }}</p>
                </div>
            </div>
        </div>
    </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            places: [
                {
                    id: 1,
                    name: '北京',
                    location: '中国·北京',
                    date: '2024-05-01',
                    image: './img/北京.jpg',
                    description: '第一次来到首都，参观了天安门广场、故宫和长城，感受到了历史的厚重感。'
                },
                {
                    id: 2,
                    name: '上海',
                    location: '中国·上海',
                    date: '2024-08-15',
                    image: './img/上海.jpg',
                    description: '在东方明珠塔下欣赏黄浦江夜景，外滩的繁华令人印象深刻。'
                },
                {
                    id: 3,
                    name: '杭州',
                    location: '中国·浙江',
                    date: '2024-03-20',
                    image: './img/杭州.jpg',
                    description: '西湖的美景让人陶醉，雷峰塔的传说千古流传，真是一个人间天堂。'
                },
                {
                    id: 4,
                    name: '成都',
                    location: '中国·四川',
                    date: '2023-10-08',
                    image: './img/成都.jpg',
                    description: '品尝了正宗的川菜，看到了可爱的大熊猫，感受到了成都的慢生活节奏。'
                },
                {
                    id: 5,
                    name: '西安',
                    location: '中国·陕西',
                    date: '2023-07-12',
                    image: './img/西安.jpg',
                    description: '兵马俑的壮观令人震撼，古城墙上的骑行体验很棒，回民街的小吃太美味了。'
                },
                {
                    id: 6,
                    name: '厦门',
                    location: '中国·福建',
                    date: '2023-04-18',
                    image: './img/厦门.jpg',
                    description: '鼓浪屿的文艺气息很浓，海边的日落很美，海鲜也很新鲜。'
                }
            ]
        }
    }
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