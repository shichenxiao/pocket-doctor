<template>
  <div class="movieUpload">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px">
    <el-form-item label="文章标题">
      <el-input v-model="Mname"></el-input>
    </el-form-item>

  <el-form-item label="分类"> 
    <el-select v-model="movieCid" placeholder="请选择">
      <el-option
        v-for="item in movieCategory"
        :label="item.knowledgeName"
        :value="item.kid"
        :key="item.kid">
      </el-option>
    </el-select>
    </el-form-item>

     <el-form-item label="提交日期">
      <template>
        <div class="block">
          <el-date-picker
            v-model="showDate"
            type="date"
            placeholder="选择日期"
            @change="dateChange">
          </el-date-picker>
        </div>
      </template>
    </el-form-item>

     <el-form-item label="文章内容">
      <el-input type="textarea" id="summernote" v-model="Mdesc"></el-input>
    </el-form-item>

    <el-form-item>
      <el-button type="primary" @click="moiveAdd">提交</el-button>
      <el-button>重置</el-button>
    </el-form-item>
  </el-form>
	</div>
</template>

<script>
import { LOCALHOST_URL } from '../assets/js/localhost.js'
import { mapState } from 'vuex';
  export default {
    data() {
      return {
          labelPosition: 'top',
          Mname: '',    //电影名
          MshowTime:'',  //上映时间
          Mdesc:'',     //简述
          actor:'',   //演员
          fileList: [],   //截图上传区
          fileList2:[],   //视频上传区
          movieCategory:[],  //影片分类 GET请求
          movieCid:'',      //影片类别 id(所选) POST请求
          moviePlayTime:'',  //播放时长
          showDate: '',       //上映日期
          videoSrc:'',
          picSrc:''
      }
    },
    created (){
      console.log(this.$store.state.user.id)
      this.$store.dispatch('setTitlename', {name:'文章上传'})
      this.$http.get('/api/knowledgetypeList').then((response)=>{
          let body = response.body;
          this.movieCategory = body;
        })
    },
    methods: {
      videoUpload() {
        this.$refs.video.submit();    
      }, 
      PicUpload() {
        this.$refs.upload.submit();
      },
      uploadVideoSuccess(res, file) {
        this.videoSrc = res;
      },
      uploadPicSuccess(res, file){
        this.picSrc = res;
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
      //提交影片
      moiveAdd(){
        this.$http.post('/api/knowledgeUpload',{
          movieName: this.Mname,
          //PicSrc : this.picSrc,
          showTime: this.showDate,
          content: this.Mdesc,
          //movieUrl: this.videoSrc,
         // moviePlayTime: this.MshowTime + 'min',
          BelongId: this.movieCid,
         // uid: this.$store.state.user.id,
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
      }
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
.el-upload{
  margin-left: 0;
  margin-bottom: 31px;
}
.el-upload-list{
  margin-bottom: 25px;
}
</style>