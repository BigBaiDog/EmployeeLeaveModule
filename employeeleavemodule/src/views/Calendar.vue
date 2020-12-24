<template>
  <div class="calendar">
      <el-card shadow="hover" class="card">
    <el-calendar>
      <template slot="dateCell" slot-scope="{ date, data }">
        {{date.getDate()}} {{ holiday(data.day)}}<br/>
        <el-tag
        class="name"
          type="info"
          size="mini"
          v-for="item in applicant(data.day)"
          :key="item"
        >
          {{ item }}
        </el-tag>
      </template>
    </el-calendar>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "Calendar",
  data() {
    return {
      resDate: {},
    };
  },
  methods: {
    applicant(v) {
      let len = this.resDate.length;
      let applicant = [];
      for (let i = 0; i < len; i++) {
        if (this.resDate[i].workdate == v && this.resDate[i].name != null) {
          applicant.push(this.resDate[i].name);
        }
      }
      return applicant;
    },
    holiday(v) {
      let len = this.resDate.length;
      let holiday = "";
      for (let i = 0; i < len; i++) {
        if (this.resDate[i].workdate == v) {
          holiday = "（" + this.resDate[i].holiday + "）";
          break;
        }
      }
      return holiday;
    },
  },
  created() {
    var that = this;
    axios({
      method: "get",
      url: "/record/test",
    }).then(function (response) {
      that.resDate = response.data;
      console.log(that.data);
    });
  },
};
</script>
<style scoped>
.card{
  margin: 10px;
}
.name {
  margin: 3px;
}
</style>
