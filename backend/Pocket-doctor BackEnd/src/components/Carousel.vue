<template>
<div class="movielist">
  <el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="就诊人姓名"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.name }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="用户名"
      width="100">
      <template scope="scope">
        <span>{{ scope.row.category }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="年龄"
      width="80">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.date }}</el-tag>
          </div>
      </template>
    </el-table-column>
     <el-table-column
      label="身份证号码"
      width="145">
      <template scope="scope">
        
        <span>{{ scope.row.PicUrl }}</span>
      </template>
    </el-table-column>

    <el-table-column
      label="审核通过"
      width="110">
      <template scope="scope"> 
          <div slot="reference" class="name-wrapper">
            <span>{{ scope.row.enable }}</span>
          </div>
      </template>
    </el-table-column>
    
  </el-table>
 <div class="block">
    <el-pagination
      @current-change="currentPageNum"
      :current-page="currentPage"
      :page-size="10"
      layout="total, prev, pager, next"
      :total="pageTotal">
    </el-pagination>
  </div>
  </div>
</template>

<script>
import { LOCALHOST_URL } from '../assets/js/localhost.js'
import TitleLink from './TitleLink.vue'

  export default {
    data() {
      return {
        tableData: [],
        currentPage: 1,
        pageTotal: null
      }
    },
    created () {
        this.$store.dispatch('setTitlename', {name:'就诊人管理'})
        this.$http.get('/api/patientlist').then((response)=>{
          let body = response.body;
          var data = [];
          var getTenData = 10;
          let _this = this;
          for(let i=0;i<getTenData;i++){
            var obj = {};
            obj.id = body.data[i].patientID;
            obj.name = body.data[i].patientName;
            obj.category = body.data[i].username;
            obj.PicUrl = body.data[i].IDcard;
            obj.movieUrl = body.data[i].patientTel;
            obj.date = body.data[i].patientAge;
            obj.duration = body.data[i].patientsex;
            obj.enable = body.data[i].enable;
            if(body.data[i].enable =='1'){
              obj.enable = '是';
            }
            else{
              obj.enable = '否';
            }
            data[i] = obj;
          _this.tableData = data;
          _this.pageTotal = body.data.length;
          }
        })
    },
    methods: {
       //分页器触发方法
      currentPageNum(val) {
        var getpageNum = parseInt(val - 1);
        this.$http.post('/api/patientlistPage',{
          pageNum: getpageNum
        }).then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].patientID;
            obj.name = body.data[i].patientName;
            obj.category = body.data[i].username;
            obj.PicUrl = body.data[i].IDcard;
            obj.movieUrl = body.data[i].patientTel;
            obj.date = body.data[i].patientAge;
            obj.duration = body.data[i].patientsex;
            //obj.enable = body.data[i].enable;
            if(body.data[i].enable =='1'){
              obj.enable = '是';
            }
            else{
              obj.enable = '否';
            }
            data[i] = obj;
          }
          _this.tableData = data;
        },(response)=>{
          console.log(response)
        });
      },
      editMovie(id) {
        this.$router.push('/movieedit?id='+ id);
      },
      unBanMovie(id,index) {
        this.$confirm('此操作将解封该就诊人', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            index.enable ='是';
            this.$http.post('/api/unBanMovie',{
            id : id
          }).then((response) => {
             console.log(response)
              this.$message({
                type: 'success',
                message: '已解封当前就诊人!'
              })
            },(response)=>{
              console.log(response)
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消解封'
          });          
        });
      },
      banMovie(id,index) {
        this.$confirm('此操作将封禁该就诊人', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            index.enable = '否';
            this.$http.post(''+LOCALHOST_URL+'/api/movieBan',{
            id : id
          }).then((response) => {
              console.log(response)
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已封禁当前就诊人!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消封禁'
          });          
        });
      },
      DeleteMovie(id, index, rows) {
        this.$confirm('此操作将删除改就诊人, 请慎重!', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post('/api/movieDelete',{
            id : id
          }).then((response) => {
             this.$http.post('/api/deletePic',{
             imgSrc: rows[index].PicUrl
             }).then((response)=>{
              console.log('删除成功')
             })
             
             this.$http.post('/api/deleteVideo',{
             videoSrc: rows[index].movieUrl
             }).then((response)=>{
              console.log('删除成功')
             })
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
            rows.splice(index,1);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
      }
    }
  }
</script>
<style>
 .el-pagination{
    width: 364px;
    position: relative;
    padding-top: 19px;
    margin: 0 auto;  
    margin-top: 13px;
 } 
</style>