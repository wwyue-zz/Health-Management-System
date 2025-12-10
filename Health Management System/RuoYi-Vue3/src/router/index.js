import { createWebHistory, createRouter } from 'vue-router'
/* Layout */
import Layout from '@/layout'

/**
 * Note: Route configuration items
 *
 * hidden: true                     // When set to true, the route will not appear in the sidebar, such as 401, login pages, or edit pages like /edit/1
 * alwaysShow: true                 // When a route has more than one child route declared, it automatically becomes nested mode--like component pages
 *                                  // When there's only one child, that child route will be displayed as the root route in the sidebar--like guide pages
 *                                  // If you want to always show the root route regardless of the number of children
 *                                  // You can set alwaysShow: true, which will ignore the previous rule and always show the root route
 * redirect: noRedirect             // When set to noRedirect, the route cannot be clicked in the breadcrumb navigation
 * name:'router-name'               // Set the route name, must be filled otherwise <keep-alive> will have issues
 * query: '{"id": 1, "name": "ry"}' // Default parameters for route access
 * roles: ['admin', 'common']       // Role permissions to access the route
 * permissions: ['a:a:a', 'b:b:b']  // Menu permissions to access the route
 * meta : {
    noCache: true                   // If set to true, will not be cached by <keep-alive> (default false)
    title: 'title'                  // Set the name displayed in sidebar and breadcrumb
    icon: 'svg-name'                // Set the route icon, corresponding to path src/assets/icons/svg
    breadcrumb: false               // If set to false, will not show in breadcrumb
    activeMenu: '/system/user'      // When route sets this property, the corresponding sidebar will be highlighted
  }
 */

// Public routes
export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path(.*)',
        component: () => import('@/views/redirect/index.vue')
      }
    ]
  },
  {
    path: '/login',
    component: () => import('@/views/login'),
    hidden: true
  },
  {
    path: '/register',
    component: () => import('@/views/register'),
    hidden: true
  },
  {
    path: "/:pathMatch(.*)*",
    component: () => import('@/views/error/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/error/401'),
    hidden: true
  },
  // {
  //   path: '',
  //   component: Layout,
  //   redirect: '/index',
  //   children: [
  //     {
  //       path: '/index',
  //       component: () => import('@/views/index'),
  //       name: 'Index',
  //       meta: { title: 'Home', icon: 'dashboard', affix: true }
  //     }
  //   ]
  // },
  {
    path: '',
    component: Layout,
    redirect: '/health/patients',
    children: [
      {
        path: '/health/patients',
        component: () => import('@/views/health/patients/index'),
        name: 'Patients',
        meta: { title: 'Start', icon: 'user', affix: true }
      }
    ]
  },

  {
    path: '/user',
    component: Layout,
    hidden: true,
    redirect: 'noredirect',
    children: [
      {
        path: 'profile',
        component: () => import('@/views/system/user/profile/index'),
        name: 'Profile',
        meta: { title: 'Profile', icon: 'user' }
      }
    ]
  },
  // {
  //   path: '/health',
  //   component: Layout,
  //   redirect: 'noRedirect',
  //   name: 'Health',
  //   meta: { title: 'Health Management', icon: 'health' },
  //   children: [
  //     {
  //       path: 'lifestyle-radar',
  //       component: () => import('@/views/health/lifestyle/radar'),
  //       name: 'LifestyleRadar',
  //       meta: { title: 'Lifestyle Radar Chart', icon: 'chart' }
  //     }
  //   ]
  // }
]

// Dynamic routes, loaded based on user permissions
export const dynamicRoutes = [
  {
    path: '/system/user-auth',
    component: Layout,
    hidden: true,
    permissions: ['system:user:edit'],
    children: [
      {
        path: 'role/:userId(\\d+)',
        component: () => import('@/views/system/user/authRole'),
        name: 'AuthRole',
        meta: { title: 'Assign Roles', activeMenu: '/system/user' }
      }
    ]
  },
  {
    path: '/system/role-auth',
    component: Layout,
    hidden: true,
    permissions: ['system:role:edit'],
    children: [
      {
        path: 'user/:roleId(\\d+)',
        component: () => import('@/views/system/role/authUser'),
        name: 'AuthUser',
        meta: { title: 'Assign Users', activeMenu: '/system/role' }
      }
    ]
  },
  {
    path: '/system/dict-data',
    component: Layout,
    hidden: true,
    permissions: ['system:dict:list'],
    children: [
      {
        path: 'index/:dictId(\\d+)',
        component: () => import('@/views/system/dict/data'),
        name: 'Data',
        meta: { title: 'Dictionary Data', activeMenu: '/system/dict' }
      }
    ]
  },
  {
    path: '/monitor/job-log',
    component: Layout,
    hidden: true,
    permissions: ['monitor:job:list'],
    children: [
      {
        path: 'index/:jobId(\\d+)',
        component: () => import('@/views/monitor/job/log'),
        name: 'JobLog',
        meta: { title: 'Scheduler Logs', activeMenu: '/monitor/job' }
      }
    ]
  },
  {
    path: '/tool/gen-edit',
    component: Layout,
    hidden: true,
    permissions: ['tool:gen:edit'],
    children: [
      {
        path: 'index/:tableId(\\d+)',
        component: () => import('@/views/tool/gen/editTable'),
        name: 'GenEdit',
        meta: { title: 'Edit Generate Config', activeMenu: '/tool/gen' }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes: constantRoutes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  },
});

export default router;