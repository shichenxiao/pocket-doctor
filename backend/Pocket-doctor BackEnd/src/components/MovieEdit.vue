<template>
  <div class="movieEdit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px">
    <el-form-item label="文章标题">
      <el-input v-model="Mname"></el-input>
    </el-form-item>

  <el-form-item label="分类"> 
    <el-select v-model="movieCid" placeholder="请选择">
      <el-option
        v-for="item in knowtype"
        :label="item.knowledgeName"
        :value="item.kid"
        :key="item.kid">
      </el-option>
    </el-select>
    </el-form-item>



     <el-form-item label="修改时间">
      <template>
        <div class="block">
          <el-date-picker
            v-model="showDate"
            type="date"
            placeholder="选择日期"
            :picker-options="pickerOptions0"
            @change="dateChange">
          </el-date-picker>
        </div>
      </template>
    </el-form-item>
        <el-form-item label="文章"></el-form-item>
        <!-- editor -->
       <el-form-item label="文章内容">
      <el-input type="textarea"  v-model="Mdesc"></el-input>
    </el-form-item>
  </el-form>
  </div>
</template>

<script>
import $ from 'jquery';
import { LOCALHOST_URL } from '../assets/js/localhost.js'

import { mapState } from 'vuex';


  export default {
    


    data() {
      return {
          labelPosition: 'top',
          getImgSrc:'', //获得的影片封面url
          getVideoSrc:'',//获得的影片url
          Mname: '',    //电影名
          MshowTime:'',  //上映时间
          Mdesc:'',     //简述
          actor:'',   //演员
          fileList: [],   //截图上传区
          fileList2:[],   //视频上传区
          knowtype:[],  //影片分类 GET请求
          movieCid:'',      //影片类别 id(所选) POST请求
          moviePlayTime:'',  //播放时长
          showDate: '',       //上映日期
          videoSrc:'',       //视频url
          picSrc:'',         //照片url
          NewimgSrc:'',      //新上传的地址
          NewvideoSrc:''     //新上传的视频地址
      }
      console.log(Mdesc);
      //$('#summernote').html(Mdesc);
    },
    created (){
        this.$store.dispatch('setTitlename', {name:'文章编辑'})
        this.$http.get('/api/knowledgetypeList').then((response)=>{
          let body = response.body;
          this.knowtype = body;
        });
        var id = this.$route.query.id
        this.$http.get('/api/knowledgeEdit',{
          params:{id : id}
         }).then((response)=>{
          let body = response.body;
          this.Mname = body[0].noteName;
          this.showDate = body[0].notedate;
          this.Mdesc = body[0].noteArticle;

        console.log(id);
          this.movieCid = body[0].knowledgeType;
          this.MshowTime = body[0].moviePlayTime;
        })
         
    },

}
</script>

<style>
.el-upload{
  margin-left: 0;
  margin-bottom: 31px;
}
.el-upload-list{
  margin-bottom: 25px;
}
</style>