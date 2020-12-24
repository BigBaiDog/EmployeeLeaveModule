<template>
  <div class="note">
    <el-form ref="form" :model="form" label-width="100px">
      <el-form-item label="假条编号" prop="l_id">
        <el-input v-model="form.l_id" :disabled="true" class="input2"></el-input>
      </el-form-item>
    </el-form>
    <el-form ref="form" :model="form" label-width="100px" :inline="true">
      <el-form-item label="工号" prop="u_id">
        <el-input v-model="form.u_id" :disabled="true" class="input1"></el-input>
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input v-model="form.name" :disabled="true" class="input1"></el-input>
      </el-form-item>
    </el-form>
    <el-form ref="form" :model="form" label-width="100px">
      <el-form-item label="请假原因" prop="reason">
        <el-input
          type="textarea"
          autosize
          placeholder="请输入请假原因"
          v-model="form.reason"
          :disabled="true"
           class="input2"
        >
        </el-input>
      </el-form-item>
    </el-form>
    <el-form ref="form" :model="form" label-width="100px" :inline="true">
      <el-form-item label="请假日期" prop="date">
        <el-date-picker
          v-model="form.date"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          value-format="yyyy-MM-dd"
          :disabled="true"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="请假天数" prop="days">
        <el-input v-model="form.days" :disabled="true"></el-input>
      </el-form-item>
    </el-form>
    <el-form ref="form" :model="form" label-width="100px">
      <el-form-item label="申请时间" prop="days">
        <el-date-picker v-model="form.time" type="datetime" :disabled="true">
        </el-date-picker>
      </el-form-item>
    </el-form>
    <el-steps
      v-if="form.isagree == 0"
      :active="1"
      finish-status="success"
      process-status="finish"
      simple
    >
      <el-step title="已申请"></el-step>
      <el-step title="待审批"></el-step>
      <el-step title="成功"></el-step>
    </el-steps>
    <el-steps
      v-else-if="form.isagree == -1"
      :active="1"
      finish-status="success"
      process-status="error"
      simple
    >
      <el-step title="已申请"></el-step>
      <el-step title="拒绝"></el-step>
      <el-step title="成功"></el-step>
    </el-steps>
    <el-steps
      v-else-if="form.isagree == -2"
      :active="1"
      finish-status="success"
      process-status="error"
      simple
    >
      <el-step title="已申请"></el-step>
      <el-step title="撤回"></el-step>
      <el-step title="成功"></el-step>
    </el-steps>
    <el-steps v-else :active="3" finish-status="success" simple>
      <el-step title="已申请"></el-step>
      <el-step title="已批准"></el-step>
      <el-step title="成功"></el-step>
    </el-steps>
  </div>
</template>

<script>
export default {
  name: "Note",
  props: {
    form: Object,
  },
  data() {
    return {};
  },
  methods: {},
  created() {},
};
</script>
<style scoped>
.input1 {
  width: 275px;
}
.input2 {
  width: 660px;
}
</style>