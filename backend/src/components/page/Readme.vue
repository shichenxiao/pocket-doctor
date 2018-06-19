<template>
  <div>
    <el-col :span='24' class='banner'>
      <el-button class='blog-btn' type="info">注册用户量
        <span class='blog-num'>666</span>
      </el-button>
      <el-button class='blog-btn' type="success">累计访问量
        <span class='blog-num'>666</span>
      </el-button>
      <el-button class='blog-btn' type="danger">在线咨询量
        <span class='blog-num'>666</span>
      </el-button>
      <el-button class='blog-btn today' type="warning">挂号预约量
        <span class='blog-num'>666</span>
      </el-button>
      <statistics></statistics>
    </el-col>
  </div>
  
</template>
<script>
    import statistics from '../statistics.vue'
    export default {
  name: 'home',
  data() {
    return {
      data: ''
    }
  },
  created() {
    
  },
   mounted() {
    var that =this;
   this.$ajax.post('http://127.0.0.1:3000/get_msg', this.$qs.stringify({
      id: sessionStorage.getItem('name'),
    })).then(res => {
      that.data = res.data;
      that.$help.$emit('statis',{'arr':res.data.visit_arr});
    })
  },
  components: {
    statistics
  },
  methods: {
  }
}
</script>

<style>
.blog-btn {
  font-size: 16px;
  border-radius: 10px;
  margin-left: 20px;
  margin-top: 20px;
  padding: 10px 40px;
}
  
  .blog-num {
    font-size: 22px;
    line-height: 40px;
    display: block;
  }

.today {
  background-color: #f0ad4e;
  border-color: #f0ad4e;
}
</style>