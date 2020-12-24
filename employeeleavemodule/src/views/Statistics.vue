<template>
  <div class="statistics">
    <el-card shadow="hover" class="card">
      <div id="main"></div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "Statistics",
  components: {},
  data() {
    return {
      worktotal: "",
      leavetotal: "",
    };
  },
  methods: {
    drawChart() {
      var echarts = require("echarts");
      var myChart = echarts.init(document.getElementById("main"));
      var that = this;
      myChart.setOption({
        title: {
          text: "当前员工在岗占比", //标题
        },
        legend: {
          orient: "vertical", //图例垂直排列
          left: "right", //图例靠右
          data: [
            "在岗" + that.worktotal + "人",
            "请假" + that.leavetotal + "人",
          ],
        },
        series: [
          {
            color: ["#409EFF", "#909399"], //图表颜色
            type: "pie", // 设置图表类型为饼图
            data: [
              // 数据数组，value 为数据项值，name 为数据项名称
              { value: that.worktotal, name: "在岗" + that.worktotal + "人" },
              { value: that.leavetotal, name: "请假" + that.leavetotal + "人" },
            ],
          },
        ],
      });
    },
  },
  mounted() {
    var that = this;
    axios({
      method: "get",
      url: "/record/today",
    }).then(function (response) {
      //数据接收到才加载图表
      that.worktotal = response.data.worktotal;
      that.leavetotal = response.data.leavetotal;
      that.drawChart();
    });
  },
};
</script>
<style scoped>
#main {
  width: 600px;
  height: 400px;
}
.card {
  width: 640px;
  margin: 40px auto;
}
</style>