<template>
<div class="movielist">
  <el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="就诊人姓名"
      width="110">
      <template scope="scope">
        <span>{{ scope.row.name }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="所选医院"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.hname }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="所选医生"
      width="80">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.dname }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column
      label="电话"
      width="150">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.tel }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column
      label="身份证号码"
      width="200">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.card }}</el-tag>
          </div>
      </template>
    </el-table-column>
     <el-table-column
      label="性别"
      width="50">
      <template scope="scope">
        
        <span>{{ scope.row.sex }}</span>
      </template>
    </el-table-column>

    <el-table-column
      label="预约日期"
      width="110">
      <template scope="scope"> 
          <div slot="reference" class="name-wrapper">
            <span>{{ scope.row.date }}</span>
          </div>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template scope="scope">
       
        <el-button
          size="small"
          type="danger"
          @click="DeleteMovie(scope.row.id, scope.$index, tableData)">删除</el-button>
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
        this.$store.dispatch('setTitlename', {name:'预约管理'})
        this.$http.get('/api/reservation').then((response)=>{
          let body = response.body;
          var data = [];
          var getTenData = 10;
          let _this = this;
          for(let i=0;i<getTenData;i++){
            var obj = {};
            obj.id = body.data[i].reservationID;
            obj.name = body.data[i].patientName;
            obj.hname = body.data[i].hospitalName;
            obj.dname = body.data[i].Dname;
            obj.tel = body.data[i].patientTel;
            obj.age = body.data[i].patientAge;
            obj.sex = body.data[i].patientsex;
            obj.card = body.data[i].IDcard;
            obj.date = body.data[i].date;
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
        this.$http.post('/api/reservationPage',{
          pageNum: getpageNum
        }).then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].reservationID;
            obj.name = body.data[i].patientName;
            obj.hname = body.data[i].hospitalName;
            obj.dname = body.data[i].Dname;
            obj.tel = body.data[i].patientTel;
            obj.age = body.data[i].patientAge;
            obj.sex = body.data[i].patientsex;
            obj.card = body.data[i].IDcard;
            obj.date = body.data[i].date;
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
        this.$confirm('此操作将预约, 请慎重!', '提示', {
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