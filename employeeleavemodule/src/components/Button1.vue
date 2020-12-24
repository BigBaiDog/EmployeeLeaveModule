<template>
  <div class="button1">
    <el-row v-if="isagree == 0">
      <el-button class="btu" type="success" @click="agree">同意</el-button>
      <el-button class="btu" type="danger" @click="refuse">拒绝</el-button>
      <el-button class="btu" @click="goBack">返回</el-button>
    </el-row>
    <el-row v-else>
      <el-button class="btu" type="success" disabled>同意</el-button>
      <el-button class="btu" type="danger" disabled>拒绝</el-button>
      <el-button class="btu" @click="goBack">返回</el-button>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Button1", //经理假条按钮
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
    agree() {
      //同意
      this.update(this.lid, 1);
    },
    refuse() {
      //拒绝
      this.update(this.lid, -1);
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