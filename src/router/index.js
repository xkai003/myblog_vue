import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import ('../views/index/index.vue')
  },
  {
    path: '/works',
    name: 'Works',
    component: () => import('../views/works/index.vue')
  },
  {
    path: '/notes',
    name: 'Notes',
    component: () => import('../views/notes/index.vue')
  },
  {
    path: '/travel',
    name: 'Travel',
    component: () => import('../views/travel/index.vue')
  },
  // {
  //   path: '/work',
  //   name: 'Work',
  //   component: () => import('../views/baohuhaiyang/haiyanqingfei.html')
  // },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
