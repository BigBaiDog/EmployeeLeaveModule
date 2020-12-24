<template>
  <div class="apply">
    <el-card shadow="hover" class="card">
      <div slot="header">
        <span>假条</span>
      </div>
      <!-- 请假表单 -->
      <el-form
        ref="form"
        :rules="rules"
        :model="form"
        label-width="100px"
        v-loading="loading"
      >
        <el-form-item label="工号" prop="uid">
          <el-input
            v-model="form.uid"
            :disabled="true"
            class="input"
          ></el-input>
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input
            v-model="form.name"
            :disabled="true"
            class="input"
          ></el-input>
        </el-form-item>
        <el-form-item label="请假原因" prop="reason">
          <el-input
            type="textarea"
            autosize
            placeholder="请输入请假原因"
            v-model="form.reason"
            class="input"
          >
          </el-input>
        </el-form-item>
        <el-form-item label="请假日期" prop="date">
          <el-date-picker
            v-model="form.date"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            :picker-options="pickerOptions"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('form')"
            >申请假期</el-button
          >
          <el-button @click="resetForm('form')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "Apply",
  data() {
    return {
      pickerOptions: {
        disabledDate(time) {
          //设置禁用状态，参数为当前日期，要求返回 Boolean
          return time.getTime() < Date.now() - 8.64e7; //当天之后的时间可选
        },
      },
      rules: {
        //未输入提示错误
        reason: [
          { required: true, message: "请输入请假原因", trigger: "blur" },
        ],
        date: [
          { required: true, message: "请选择请假日期", trigger: "change" },
        ],
      },
      form: {
        uid: sessionStorage.getItem("uid"),
        name: sessionStorage.getItem("name"),
        reason: "",
        date: "",
      },
      loading: false, //提交状态
    };
  },
  methods: {
    submitForm(formName) {
      var that = this;
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loading = true;
          axios
            .post("/leave/apply", {
              uid: this.form.uid,
              reason: this.form.reason,
              startdate: this.form.date[0],
              enddate: this.form.date[1],
            })
            .then(function (response) {
              if (response.data) {
                //提交成功
                that.$router.push("/myleaves");
              } else {
                location.reload();
              }
              that.loading = false;
            });
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      //重置假条
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style scoped>
.card {
  width: 555px;
  margin: 55px auto;
}
.input {
  width: 350px;
}
</style>