<template>
    <div class="body">
        <div class="dd">
        <!-- 头标 -->
        <div class="dd1">
            <img src="../../assets/avatar.jpg" alt="">
        </div>
        <!-- 头标 -->
        <h1>hello</h1>
        <span>wellcom to my blog!</span>
        <div class="iconbox">
            <a href="https://im.qq.com/index/" title="点击进入我的QQ"><svg t="1762692249556" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6375"><path d="M512 0c-282.767 0-511.979 229.221-511.979 512s229.211 512 511.979 512 511.979-229.221 511.979-512-229.211-512-511.979-512zM793.886 671.573c-13.223 12.342-35.924-1.102-57.744-31.297-9.477 25.566-21.819 49.149-36.144 70.309 30.855 11.020 50.692 28.212 50.692 47.609 0 33.501-59.287 60.611-132.458 60.611-43.418 0-81.767-9.477-106.009-24.244-24.023 14.767-62.593 24.244-106.009 24.244-73.172 0-132.458-27.109-132.458-60.611 0-19.175 19.836-36.586 50.692-47.609-14.546-21.159-26.668-44.742-36.144-70.309-21.819 29.975-44.519 43.641-57.744 31.297-18.073-16.971-11.241-76.922 15.647-133.785 6.171-13.004 12.783-24.685 19.615-34.823 3.747-165.303 112.622-297.987 246.181-297.987h0.441c133.559 0 242.435 132.462 246.181 297.987 6.833 10.139 13.444 21.821 19.615 34.823 26.67 56.864 33.723 116.814 15.65 133.785z" p-id="6376"></path></svg></a>
            <a href="https://github.com/xkai003" title="点击进入我的GIthub"><svg t="1762692386791" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="9062"><path d="M0 524.992q0 166.016 95.488 298.496t247.488 185.504q6.016 0.992 10.016 0.992t6.496-1.504 4-3.008 2.016-4.992 0.512-4.992v-100.512q-36.992 4-66.016-0.512t-45.504-14.016-28.992-23.488-16.992-25.504-8.992-24-5.504-14.496q-8.992-15.008-27.008-27.488t-27.008-20-2.016-14.496q50.016-26.016 112.992 66.016 34.016 51.008 119.008 30.016 10.016-40.992 40-70.016Q293.984 736 237.984 670.976t-56-158.016q0-87.008 55.008-151.008-22.016-64.992 6.016-136.992 28.992-2.016 64.992 11.488t50.496 23.008 25.504 17.504q56.992-16 128.512-16t129.504 16q12.992-8.992 28.992-19.008t48.992-21.504 60.992-9.504q27.008 71.008 7.008 135.008 56 64 56 151.008 0 92.992-56.992 158.496t-172 85.504q43.008 43.008 43.008 104v128.992q0 0.992 0.992 3.008 0 6.016 0.512 8.992t4.512 6.016 12 3.008q152.992-52 250.496-185.504t97.504-300.512q0-104-40.512-199.008t-108.992-163.488-163.488-108.992T512.032 12.96 313.024 53.472 149.536 162.464t-108.992 163.488-40.512 199.008z" p-id="9063"></path></svg></a>
        </div>
        <!-- 时间 -->
            <div class="time">
                <span>{{ year }}</span>
                <span>年</span>
                <span>{{ month }}</span>
                <span>月</span>
                <span>{{ day }}</span>
                <span>日</span>
                <span>{{ hours }}</span>
                <span>:</span>
                <span>{{ minutes }}</span>
                <span>:</span>
                <span>{{ seconds }}</span>
            </div>
        <!-- 时间 -->
    </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            currentTime: new Date(),
            timer: null
        }
    },
    mounted() {
        this.updateTime();
        this.timer = setInterval(this.updateTime, 1000);
    },
    beforeUnmount() {
        if (this.timer) {
            clearInterval(this.timer);
        }
    },
    methods: {
        updateTime() {
            this.currentTime = new Date();
        },
        formatNumber(num) {
            return num.toString().padStart(2, '0');
        }
    },
    computed: {
        year() {
            return this.currentTime.getFullYear();
        },
        month() {
            return this.formatNumber(this.currentTime.getMonth() + 1);
        },
        day() {
            return this.formatNumber(this.currentTime.getDate());
        },
        hours() {
            return this.formatNumber(this.currentTime.getHours());
        },
        minutes() {
            return this.formatNumber(this.currentTime.getMinutes());
        },
        seconds() {
            return this.formatNumber(this.currentTime.getSeconds());
        }
    }
}
</script>

<style scoped>
.body {
    /* position: fixed; */
    margin: 0;
    width: 99vw;
    height: 98vh;
    display: flex;
    justify-content: center;
    align-items: center;
    /* background-color: #abe1e3; */
    background-color: rgba(250, 246, 246, 0.8);
    /* 方格背景 */
    background: linear-gradient(90deg, rgba(200, 200, 200, 0.1) 3%, transparent 0),
    linear-gradient(rgba(200, 200, 200, 0.1) 3%, transparent 0);
    background-size: 20px 20px;
}
/*------------------------ 正文------------------------ */
.dd{
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    max-width: 300px;
    /* background-color: #c78888; */
}

/* 头标 */
.dd .dd1{
    width: 200px;
    height: 200px;
    border: 5px solid #c8f8f8;
    border-radius: 50%;
    margin: 50px auto;
    /*  */
    display: block;
    display: flex;
    justify-content: center;
    align-items: center;
}
.dd .dd1 img{
    width: 100%;
    height: 100%;
    border-radius: 50%;
}

.dd h1{
    margin: 0;
    padding: 0;
    color: #4caf50;
    font-family: "Comic Sans MS", "Brush Script MT", cursive;/* 字体 */
    font-size: 40px;
}

.dd span {
    font-family: 'Roboto', 'Helvetica Neue', Arial, sans-serif;/* 字体 */
    font-size: 26px;
    color: #333;
}
/* 头标 end*/
/* 时间*/
.dd .time span{
    color: rgb(0, 225, 255);
    font-size: 20px;
}
/* 时间 end*/
/* iconbox */
.dd .iconbox{
    margin: 5px;
}
.dd .iconbox .icon{
    width: 30px;
    height: 30px;
    margin-left: 5px;
    fill: #bfbfbf;
}
.dd .iconbox .icon:hover{
    fill: #ac9898;
}
/* iconbox end */
/*------------------------ 正文------------------------ */
</style>