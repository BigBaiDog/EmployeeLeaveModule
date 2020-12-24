<template>
  <div class="login">
    <el-row type="flex" class="row-bg" justify="space-around">
      <el-col :span="10">
        <div class="grid-content bg-purple-light">
          <el-card shadow="hover">
            <div slot="header">
              <span>XX公司系统登陆页面</span>
            </div>
            <!-- 登录表单 -->
            <el-form
              label-position="right"
              label-width="100px"
              :model="user"
              :rules="rules"
              ref="userForm"
            >
              <el-form-item label="工号" prop="uid">
                <el-input
                class="input"
                  v-model="user.uid"
                  placeholder="请输入工号"
                ></el-input>
              </el-form-item>
              <el-form-item label="密码" prop="password">
                <el-input
                class="input"
                  v-model="user.password"
                  placeholder="请输入密码"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item>
                <el-button class="btu" type="primary" @click="submitForm('userForm')"
                  >登录</el-button
                ><el-button class="btu" @click="resetForm('userForm')">重置</el-button>
              </el-form-item>
            </el-form>

            <!-- 折叠面板 -->
            <el-collapse>
              <el-collapse-item title="测试账号" name="1">
                <p>经理工号：2048，密码：admin</p>
                <p>员工工号：2017134329，密码：123456</p>
              </el-collapse-item>
            </el-collapse>
          </el-card>
        </div>
      </el-col>
    </el-row>

    <!-- 登录错误弹窗 -->
    <el-dialog
      title="登录失败"
      :visible.sync="dialogVisible"
      width="30%"
      :show-close="false"
      @close="resetForm('userForm')"
    >
      <span>{{ user.err }}</span>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    var checkUid = (rule, value, callback) => {
      if (value === "") {
        //工号不能为空
        callback(new Error("请输入工号"));
      } else {
        if (/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/.test(value) == false) {
          //工号必须为数字
          callback(new Error("请填写正确的工号"));
        } else {
          callback();
        }
      }
    };
    var checkPass = (rule, value, callback) => {
      if (value === "") {
        //密码不能为空
        callback(new Error("请输入密码"));
      } else {
        callback();
      }
    };
    return {
      rules: {
        uid: [{ validator: checkUid, trigger: "blur" }],
        password: [{ validator: checkPass, trigger: "blur" }],
      },
      dialogVisible: false, //控制弹窗
      user: {
        uid: "", //工号
        password: "", //密码
        err: "", //登录错误提示信息
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          var that = this;
          axios
            .post("/signin", {
              uid: this.user.uid,
              password: this.user.password,
            })
            .then(function (response) {
              if (response.data.code) {
                //登录成功
                sessionStorage.setItem("uid", response.data.uid);
                sessionStorage.setItem("name", response.data.name);
                sessionStorage.setItem("ismanager", response.data.ismanager);
                that.$router.push("/");
              } else {
                //登录失败
                that.user.err = response.data.err;
                that.dialogVisible = true;
              }
            });
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      //关闭登录错误弹窗时清除登录表单数据
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style scoped>
.login {
  margin: 20vh auto 0;
}
.input{
  width: 300px;
}
.btu{
  width: 100px;
}
</style>