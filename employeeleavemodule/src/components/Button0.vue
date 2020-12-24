<template>
  <div class="button0">
    <el-row v-if="isagree >= 0">
      <el-button type="danger" class="btu" @click="withdraw">撤回</el-button>
      <el-button class="btu" @click="goBack">返回</el-button>
    </el-row>
    <el-row v-else>
      <el-button type="danger" class="btu" disabled>撤回</el-button>
      <el-button class="btu" @click="goBack">返回</el-button>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Button0", //员工假条按钮
  props: ["lid", "isagree"], //假条编号，假条状态
  methods: {
    update(lid, operate) {
      //更新假条状态
      axios({
        methods: "get",
        url: "/leave/operate",
        params: {
          lid,
          operate,
        },
      }).then(function (response) {
        location.reload();
      });
    },
    withdraw() {
      this.update(this.lid, -2);
    },
    goBack() {
      this.$router.go(-1);
    },
  },
};
</script>
<style scoped>
.btu {
  width: 180px;
}
</style>