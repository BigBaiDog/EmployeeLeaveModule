<template>
  <div class="header">
    <el-menu default-active="/" mode="horizontal" router>
      <el-menu-item index="/">
        <i class="el-icon-office-building"></i>
        <span slot="title">主页</span>
      </el-menu-item>
      <el-menu-item index="/apply">
        <i class="el-icon-edit-outline"></i>
        <span slot="title">申请假期</span>
      </el-menu-item>
      <el-menu-item index="/myleaves">
        <i class="el-icon-document"></i>
        <span slot="title">请假记录</span>
      </el-menu-item>

      <el-menu-item index="/statistics" v-if="ismanager == 1">
        <i class="el-icon-pie-chart"></i>
        <span slot="title">在岗统计</span>
      </el-menu-item>
      <el-menu-item index="/allleave" v-if="ismanager == 1">
        <i class="el-icon-document-copy"></i>
        <span slot="title">请假管理</span>
      </el-menu-item>
      <el-menu-item index="/calendar" v-if="ismanager == 1">
        <i class="el-icon-date"></i>
        <span slot="title">公司月历</span>
      </el-menu-item>

      <el-menu-item class="r" @click="quit">
        <i class="el-icon-switch-button"></i>
        <span slot="title">退出</span>
      </el-menu-item>
      <el-menu-item class="r">
        <span slot="title">
          <el-avatar>{{ name }}</el-avatar>
        </span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      name: sessionStorage.getItem("name"),
      ismanager: sessionStorage.getItem("ismanager"),
    };
  },
  methods: {
    quit() {
      //退出登录
      sessionStorage.clear();
      location.reload();
    },
  },
};
</script>

<style scoped>
.r {
  float: right !important;
}
</style>