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
	export default {
        created() {
          this.$store.dispatch('setTitlename', {name:'控制中心'})
        }
    }
</script>

<style>

</style>