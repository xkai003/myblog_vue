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
  {
    path: '/management_works',
    name: 'management_works',
    component: () => import('../views/management/management_works.vue')
  },
  {
    path: '/management_notes',
    name: 'management_notes',
    component: () => import('../views/management/management_notes.vue')
  },
  {
    path: '/management_travel',
    name: 'management_travel',
    component: () => import('../views/management/management_travel.vue')
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
