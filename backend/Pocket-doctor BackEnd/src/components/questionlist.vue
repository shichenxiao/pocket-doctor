<template>
<div class="movielist">
  <el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="序号"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.id }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="用户"
      width="100">
      <template scope="scope">
        <span>{{ scope.row.name }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="问题类型"
      width="200">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.type }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column
      label="内容"
      width="110">
      <template scope="scope"> 
          <div slot="reference" class="name-wrapper">
            <span>{{ scope.row.content | ellipsis }}</span>
          </div>
      </template>
    </el-table-column>
    <el-table-column
      label="提问日期"
      width="110">
      <template scope="scope"> 
          <div slot="reference" class="name-wrapper">
            <span>{{ scope.row.date }}</span>
          </div>
      </template>
    </el-table-column>
    <el-table-column
      label="回复"
      width="110">
      <template scope="scope"> 
          <div slot="reference" class="name-wrapper">
            <span>{{ scope.row.content | ellipsis }}</span>
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
        this.$store.dispatch('setTitlename', {name:'快速咨询管理'})
        this.$http.get('/api/questionlist').then((response)=>{
          let body = response.body;
          var data = [];
          var getTenData = 10;
          let _this = this;
          for(let i=0;i<getTenData;i++){
            var obj = {};
            obj.id = body.data[i].questionID;
            obj.type= body.data[i].illnessName;
            obj.name = body.data[i].username;
            obj.content = body.data[i].qdirection;
            obj.date = body.data[i].time;
            obj.pic= body.data[i].diseasePic;
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
        this.$http.post('/api/questionlistPage',{
          pageNum: getpageNum
        }).then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].knowledgeTypeID;
            obj.type= body.data[i].knowledgeType;
            obj.name = body.data[i].noteName;
            obj.content = body.data[i].noteArticle;
            obj.date = body.data[i].notedate;
            obj.pic= body.data[i].knowpic;
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
      ChangeMovie(id) {
        this.$router.push('/movieedit?id='+id);
      },
      UpMovie(id){
        this.$router.push('/upknowledge');
      },
        DeleteMovie(id, index, rows) {
        this.$confirm('此操作将删除这条问题, 请慎重!', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post('/api/questionDelete',{
            id : id
          }).then((response) => {
            console.log('删除成功')   
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