<template>
<!-- 左边导航栏组件-->
	<div class="adminPanel" style="height:100%">
	<my-Header></my-Header>
	<myCanvas></myCanvas>
	 <el-row class="tac">
		 <el-col :span="4" style="height:100%;width: 18.6667%;">
		  <div class="ControlPanel">
	  	  <el-col :span="24">
		    <el-menu default-active="2" class="el-menu-vertical-demo" theme="dark">
		    <router-link :to="{path:'mainboard'}"><el-menu-item index="1">首页</el-menu-item></router-link>
		      <el-submenu index="1">	      
		       <template slot="title">管理</template>
		        <el-menu-item-group>
		          <router-link :to="{path:'carouselupload'}"><el-menu-item index="1-1">预约管理</el-menu-item></router-link>
		          <router-link :to="{path:'carousel'}"><el-menu-item index="1-2">就诊人管理</el-menu-item></router-link>
		        </el-menu-item-group>
		      </el-submenu>
		      <el-submenu index="2">
		       <template slot="title">知识库</template>
		        <el-menu-item-group>
		          <router-link :to="{path:'knowledge'}"><el-menu-item index="2-1">推荐</el-menu-item></router-link>
		          <router-link :to="{path:'newslist'}"><el-menu-item index="2-2">新闻</el-menu-item></router-link>
				<router-link :to="{path:'videolist'}"><el-menu-item index="2-3">视频</el-menu-item></router-link>
		         <router-link :to="{path:'testlist'}"><el-menu-item index="2-4">测试</el-menu-item></router-link>
		        </el-menu-item-group>
				<el-submenu index="3">
          			<template slot="title">评论管理</template>
          			<router-link :to="{path:'knowledgecomment'}"><el-menu-item index="1-4-1">推荐评论</el-menu-item></router-link>
          			<router-link :to="{path:'newscomment'}"><el-menu-item index="1-4-2">新闻评论</el-menu-item></router-link>
					  <router-link :to="{path:'vediocomment'}"><el-menu-item index="1-4-3">视频评论</el-menu-item></router-link>
					  <router-link :to="{path:'testcomment'}"><el-menu-item index="1-4-4">测试评论</el-menu-item></router-link>
                 </el-submenu>
		      </el-submenu>
			  <el-submenu index="4">
		       <template slot="title">问题列表</template>
		        <el-menu-item-group>
		          <router-link :to="{path:'dquestionlist'}"><el-menu-item index="4-1">免费问诊列表</el-menu-item></router-link>
		          <router-link :to="{path:'questionlist'}"><el-menu-item index="4-2">快速问诊列表</el-menu-item></router-link>
		        </el-menu-item-group>
							
		      </el-submenu>
		      
						
		    </el-menu>
	         </el-col>
	       </div>
	      </el-col>
  		 <!-- 右边展示视图 -->
        <el-col :span="20" class="mainShow" style="width: 74.33333%;">
		  <div class="ShowPanel">
			  <TitleLink></TitleLink>
	          	<router-view></router-view>
	      </div>
	   </el-col>
	  </el-row>
<!-- 	  <my-Footer></my-Footer> -->
	</div>
</template>

<script>
import { mapState } from 'vuex';
import TitleLink from './TitleLink.vue';
import myCanvas from  './MyCanvas.vue'
import myHeader  from './BackHeader.vue';
// import myFooter  from './BackFooter.vue';
 
export default {
	data() {
		return {
			titleName:''
		}
	},
	components:{
	  myHeader,
		myCanvas,
		TitleLink
	},
		computed:mapState({
			user(){
				var getUserName = window.localStorage.getItem('userName');
				if(this.$store.state.user.name ==''){
						this.$store.commit('GET_USER', {name: getUserName})
				}
					return this.$store.state.user;
				}
		})
}	
</script>

<style>
@import '../assets/css/reset.css';
.tac{
	height: 100%;
    position: relative;
    z-index: 100;
}
.ControlPanel ul a{
	color: #000;
	text-decoration: none;
}
.ControlPanel{
	height: 100%;
	background: #324157;
	position: absolute;
	width: 180px;
    margin-top: 46px;
}
.mainShow{
	padding: 2% 2% 2% 2%;
	margin-top: 46px;
}
.showPanel{
	width:97%;
}
</style>