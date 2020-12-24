<template>
  <div class="myleave">
    <el-card shadow="hover" class="card">
      <div slot="header">
        <el-page-header @back="goBack" content="假条"> </el-page-header>
      </div>
      <Note :form="form" />
      <Button0 :lid="form.l_id" :isagree="form.isagree" class="btu" />
    </el-card>
  </div>
</template>

<script>
import Note from "@/components/Note.vue";
import Button0 from "@/components/Button0.vue";
export default {
  name: "MyLeave",
  components: {
    Note,
    Button0,
  },
  data() {
    return {
      form: {},
      lid: this.$route.params.lid,
    };
  },
  methods: {
    goBack() {
      this.$router.go(-1);
    },
  },
  created() {
    var that = this;
    axios({
      method: "get",
      url: "/leave/one",
      params: {
        lid: this.$route.params.lid,
      },
    }).then(function (response) {
      that.form = response.data;
      that.form.date = [response.data.startdate, response.data.enddate];
    });
  },
};
</script>
<style scoped>
.card {
  width: 850px;
  margin: 30px auto;
}
.btu {
  width: 370px;
  margin: 20px auto 0;
}
</style>