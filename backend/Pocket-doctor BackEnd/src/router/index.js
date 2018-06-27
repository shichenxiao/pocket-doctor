import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Login              from '../components/Login.vue'
import Admin              from '../components/Admin.vue'
import newslist         from '../components/newslist.vue'

import Carousel           from '../components/Carousel.vue'

import MovieEdit          from '../components/MovieEdit.vue'
import CarouselUpload     from '../components/CarouselUpload.vue'
import testlist        from '../components/testlist.vue'
import knowledge         from '../components/knowledge.vue'

import MainBoard          from '../components/MainBoard.vue'
import videolist   from '../components/videolist.vue'

import knowledgecomment           from '../components/knowledgecomment.vue'
import newscomment           from '../components/newscomment.vue'
import vediocomment           from '../components/vediocomment.vue'
import testcomment           from '../components/testcomment.vue'
import changecontent          from '../components/changecontent.vue'
import upknowledge          from '../components/upknowledge.vue'
import questionlist          from '../components/questionlist.vue'
import dquestionlist          from '../components/dquestionlist.vue'


export default new Router({
  mode: 'history',
  routes: [
    {path: '/',component: Login },
    {
      name:'admin',
      path: '/admin',
      component: Admin,
      meta:{
        auth:true
      },
      children: [
        {path: '/newslist',component:resolve=>System.import('../components/newslist'),name:'newslist'}, //路由懒加载
        {path: '/carousel',component:resolve=>System.import('../components/Carousel'),name:'carousel'},
        {path: '/movieedit',component: MovieEdit,name:'movieEdit'},
        {path: '/carouselupload',component:CarouselUpload,name:'CarouselUpload'},
        {path: '/knowledgecomment',component:knowledgecomment,name:'knowledgecomment'},
        {path: '/newscomment',component:newscomment,name:'newscomment'},
        {path: '/vediocomment',component:vediocomment,name:'vediocomment'},
        {path: '/testcomment',component:testcomment,name:'testcomment'},
        {path: '/testlist',component:testlist,name:'testlist'},
        {path: '/questionlist',component:questionlist,name:'questionlist'},
        {path: '/dquestionlist',component:dquestionlist,name:'dquestionlist'},
        {path: '/knowledge',component:knowledge,name:'knowledge'},
        {path: '/upknowledge',component:upknowledge,name:'upknowledge'},
        {path: '/changecontent',component:changecontent,name:'changecontent'},



        {path: '/mainBoard',component:MainBoard,name:'MainBoard'},

        {path: '/videolist',component:videolist,name:'videolist'},

      ]
    }
  ]
})
