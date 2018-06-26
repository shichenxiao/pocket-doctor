import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Login              from '../components/Login.vue'
import Admin              from '../components/Admin.vue'
import newslist         from '../components/newslist.vue'
import Userinfo           from '../components/Userinfo.vue'
import Carousel           from '../components/Carousel.vue'
import CarouselEdit       from '../components/CarouselEdit.vue'
import MovieEdit          from '../components/MovieEdit.vue'
import CarouselUpload     from '../components/CarouselUpload.vue'
import testlist        from '../components/testlist.vue'
import knowledge         from '../components/knowledge.vue'
import FoundTopicAdd      from '../components/FoundTopicAdd.vue'
import FoundTopicList     from '../components/FoundTopicList.vue'
import MovieCategoryList  from '../components/MovieCategoryList.vue'
import MovieCategoryAdd   from '../components/MovieCategoryAdd.vue'
import MainBoard          from '../components/MainBoard.vue'
import FoundTopicEdit     from '../components/FoundTopicEdit.vue'
import MovieCategoryEdit  from '../components/MovieCategoryEdit.vue'
import UserinfoEdit       from '../components/UserinfoEdit.vue'
import TopicCategoryAdd   from '../components/TopicCategoryAdd.vue'
import TopicCategoryEdit  from '../components/TopicCategoryEdit.vue'
import TopicCategory      from '../components/TopicCategory.vue'
import TopicCommentlist   from '../components/TopicCommentlist.vue'
import videolist   from '../components/videolist.vue'
import FeedBack           from '../components/FeedBack.vue'
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
        {path: '/userinfo',component:resolve=>System.import('../components/Userinfo'),name:'userinfo'},
        {path: '/carousel',component:resolve=>System.import('../components/Carousel'),name:'carousel'},
        {path: '/carouseledit',component:resolve=>System.import('../components/CarouselEdit'),name:'carouselEdit'},
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
        {path: '/foundTopicAdd',component:FoundTopicAdd,name:'FoundTopicAdd'},
        {path: '/foundTopicList',component:FoundTopicList,name:'FoundTopicList'},
        {path: '/movieCategoryAdd',component:MovieCategoryAdd,name:'MovieCategoryAdd'},
        {path: '/movieCategoryList',component:MovieCategoryList,name:'MovieCategoryList'},
        {path: '/mainBoard',component:MainBoard,name:'MainBoard'},
        {path: '/foundTopicEdit',component:resolve => System.import('../components/FoundTopicEdit'),name:'FoundTopicEdit'},
        {path: '/movieCategoryEdit',component:MovieCategoryEdit,name:'MovieCategoryEdit'},
        {path: '/userinfoEdit',component:UserinfoEdit,name:'userinfoEdit'},
        {path: '/topicCategory',component:TopicCategory, name:'TopicCategory'},
        {path: '/topicCategoryAdd',component:TopicCategoryAdd,name:'TopCategoryAdd'},
        {path: '/topicCategoryEdit',component:TopicCategoryEdit,name:'TopicCategoryEdit'},
        {path: '/videolist',component:videolist,name:'videolist'},
        {path: '/topicCommentlist',component:TopicCommentlist,name:'TopicCommentlist'}, 
        {path: '/FeedBack',component:FeedBack ,name:'FeedBack'}
      ]
    }
  ]
})
