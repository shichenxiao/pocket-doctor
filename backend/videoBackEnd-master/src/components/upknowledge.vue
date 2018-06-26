<template>
  <div class="movieEdit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px">
    <el-form-item label="文章标题" v-model="Mname">
      <el-input ></el-input>
    </el-form-item>

  <el-form-item label="分类"> 
    <el-select  v-model="movieCid" placeholder="请选择">
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
        <el-input type="textarea"  v-model="Mdesc" id="summernote"></el-input>

 

    <el-form-item>
      <el-button type="primary" @click="moiveUpload">上传</el-button>
      <el-button>重置</el-button>
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
          //getImgSrc:'', //获得的影片封面url
          //getVideoSrc:'',//获得的影片url
          Mname: '',    //电影名
          MshowTime:'',  //上映时间
          Mdesc:'',     //简述
         // actor:'',   //演员
          //fileList: [],   //截图上传区
          //fileList2:[],   //视频上传区
          knowtype:[],  //影片分类 GET请求
          movieCid:'',      //影片类别 id(所选) POST请求
          //moviePlayTime:'',  //播放时长
          showDate: '',       //上映日期
          //videoSrc:'',       //视频url
          //picSrc:'',         //照片url
          //NewimgSrc:'',      //新上传的地址
          //NewvideoSrc:''     //新上传的视频地址
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
    
    },
     

    methods: {
      PicUpload() {
        this.$refs.upload.submit();
      },
      uploadVideoSuccess(res, file) {
        this.NewvideoSrc = res;
         console.log(this.NewvideoSrc);
      },
      uploadPicSuccess(res, file){
        this.NewimgSrc = res;
      },
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePreview(file) {
        console.log(file);
      },
      dateChange(val) {
        this.showDate = val;
      },
      uploadVideo() {
        
        this.$refs.video.submit();  
      }, 
      movieUpload(){
         var id = this.$route.query.id;
         this.$http.post('/api/knowledgeUpload',{
            movieName: this.Mname,
            showTime: this.showDate,
            content: this.Mdesc,
            id : id,
            BelongId: this.movieCid,
       
            uid:this.$store.state.user.id,
          }).then((response) => {
            
             console.log('成功')
           },(response)=>{
              console.log(response)
          });
          this.$router.push('/movielist')
           this.$message({
             type: 'success',
             message: '上传成功!'
          });
      },
      //提交影片
      
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
#summernote{
  height:500px;
  width:80%;
}
</style>