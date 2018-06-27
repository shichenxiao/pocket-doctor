import Vue 			 from 'vue'
import router        from './router'
 import Vuex          from 'vuex'
import store         from './vuex/store'
 import VueResource   from 'vue-resource'

import 'font-awesome/css/font-awesome.css'
 import 'element-ui/lib/theme-default/index.css'
import 'summernote/dist/summernote.css'
import md5 from 'js-md5';
 import ElementUI 	   from 'element-ui'   //400k


Vue.use(VueResource) 

var userName_Form_LocalStroage = localStorage.getItem('userName');

router.beforeEach((to,from,next)=>{
    if(to.matched.some( m => m.meta.auth)){ 
        // 对路由进行验证
        if( store.state.user.name || userName_Form_LocalStroage) { // 已经登陆
            next()
        }else{
            // 未登录,跳转到登陆页面，并且带上 将要去的地址，方便登陆后跳转。
            next({path:'/login',query:{ referrer: to.fullPath} })  
        }
    }else{
        next()
    }
})

Vue.config.productionTip = false

//Vue.use(Vuex);
//Vue.use(ElementUI)


let app = new Vue({
  router,
  store
}).$mount('#app');

