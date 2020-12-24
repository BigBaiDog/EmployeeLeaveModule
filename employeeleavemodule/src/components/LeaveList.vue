<template>
  <div class="leavelist">
    <el-card shadow="hover">
      <el-table :data="tableData" stripe style="width: 100%">
        <el-table-column prop="name" label="姓名"> </el-table-column>
        <el-table-column prop="reason" label="原因"> </el-table-column>
        <el-table-column prop="time" label="申请时间"> </el-table-column>
        <el-table-column label="状态">
          <template slot-scope="{ row }">
            <el-tag type="success" v-if="row.isagree > 0">成功</el-tag>
            <el-tag type="danger" v-else-if="row.isagree == -1">拒绝</el-tag>
            <el-tag type="danger" v-else-if="row.isagree == -2">撤回</el-tag>
            <el-tag v-else>等待</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          ><template slot-scope="{ row }">
            <router-link :to="url + row.l_id" class="link-type">
              <el-button type="primary" icon="el-icon-search">查看</el-button>
            </router-link>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "LeaveList",
  data() {
    return {
      tableData: [],
      uid: sessionStorage.getItem("uid"),
      url:this.$route.name+"/"
    };
  },
  created() {
    var that = this;
    console.log(this.$route.name)
    // if()
    axios({
      method: "get",
      url: "/leave/someone",
      params: {
        uid: this.uid,
      },
    }).then(function (response) {
      that.tableData = response.data;
    });
  },
};
</script>
