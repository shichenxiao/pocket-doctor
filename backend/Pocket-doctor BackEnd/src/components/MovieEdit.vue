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
     
     

    <el-form-item>
      <el-button type="primary" @click="moiveUpload">修改</el-button>
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
         //this.getImgSrc = body[0].knowpic; //获取的未处理图片原地址
          //console.log(this.getImgSrc);    
          //this.getVideoSrc = body[0].movieUrl; //获取的未处理视频原地址
          //this.videoSrc = body[0].movieUrl.substring(1);//处理的原封面地址
          //this.picSrc = body[0].knowpic.substring(1);//处理的原视频地址
          //console.log(this.picSrc);
         // console.log(this.Mdesc);
        console.log(id);
          this.movieCid = body[0].knowledgeType;
          this.MshowTime = body[0].moviePlayTime;
        })
         
    },
     mounted(){
       
      
       //$('#summernote').html(Mdesc);
       $('#summernote').summernote({
          lang:'zh-CN',
          height:300,
          minHeight:null,
          maxHeight:null,
          focus:true,
          //message:Mdesc,
          toolbar:[
              ['style',['bold','italic','clear']],
              ['fontsize',['fontsize']],
              ['para',['ul','ol','paragraph']],
              ['insert',['picture','link','video']]
          ],
 
          callbacks:{
              onImageUpload:function(files){     
              var Picdata = new FormData();
              var imgUrl = null;
              Picdata.append('upload',files[0]);
              $.ajax({
                  url: '/api/uploadEditorPic',
                  type: 'POST',
                  cache: false,
                  data: Picdata,
                  processData: false,
                  contentType: false
                }).success(function(res) {
                    let changeUrl = res.substring(1);
                $('#summernote').summernote("insertImage", changeUrl);  
              }).fail(function(res) {
                console.log('error')
            });
            
    }, 
}
})

},
    methods: {
      PicUpload() {
        this.deletePic();
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
        this.deleteOldVideo();
        this.$refs.video.submit();  
      }, 
      deleteOldVideo() {
        this.$http.post('/api/deleteVideo',{
         videoSrc:this.getVideoSrc
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });   
      },
      //删除新图片
      deletePic() {
        this.$http.post('/api/deletePic',{
         imgSrc: this.getImgSrc
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });  
      },
      //提交知识库内容
      movieUpload(){
         var id = this.$route.query.id;
         console.log(this.$route.query.id);
         this.$http.post('/api/knowledgechange',{
          movieName: this.Mname,
          //PicSrc : this.picSrc,
          showTime: this.showDate,
          content: this.Mdesc,
          //movieUrl: this.videoSrc,
         // moviePlayTime: this.MshowTime + 'min',
          BelongId: this.movieCid,
           id:id,
          //actor: this.actor
        }).then((response) => {
           //this.$router.push('/movielist')
           console.log('成功')
         },(response)=>{
            console.log(response)
        });
         this.$message({
           type: 'success',
           message: '上传成功!'
        });
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