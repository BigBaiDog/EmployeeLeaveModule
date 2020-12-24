<template>
  <div class="leave">
    <el-card shadow="hover" class="card">
      <div slot="header">
        <el-page-header @back="goBack" content="假条"> </el-page-header>
      </div>
      <Note :form="form" />
      <Button1 class="btu" :lid="form.l_id" :isagree="form.isagree" />
    </el-card>
  </div>
</template>

<script>
import Note from "@/components/Note.vue";
import Button1 from "@/components/Button1.vue";
export default {
  name: "Leave",
  components: {
    Note,
    Button1,
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
  width: 560px;
  margin: 20px auto 0;
}
</style>