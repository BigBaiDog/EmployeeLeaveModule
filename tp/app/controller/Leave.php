<?php

namespace app\controller;

use app\BaseController;
use app\model\Leave as LeaveModel;
use app\model\Calendar as CalendarModel;
use app\model\Record as RecordModel;

class Leave extends BaseController
{
    public function apply($uid, $reason, $startdate, $enddate)
    {
        $leaveModel = new LeaveModel();
        $calendarModel = new CalendarModel;
        $time = date('Y-m-d H:i:s', time());
        $days = $calendarModel->countHoliday($startdate, $enddate);
        $is = $leaveModel->apply($uid, $reason, $startdate, $enddate, $time, $days);
        return $is;
    }
    public function agree($lid)
    {
        $leaveModel = new LeaveModel();
        $calendarModel = new CalendarModel;
        $recordModel = new RecordModel;
        $leave = $leaveModel->one($lid);
        $cids = $calendarModel->holiday($leave->startdate, $leave->enddate);
        $res = $recordModel->post($cids, $lid, $leave->u_id);
        return $res;
    }
    public function cancel($lid)
    {
        $recordModel = new RecordModel;
        $res = $recordModel->del($lid);
        return $res;
    }
    public function operate($lid, $operate)
    {
        $leaveModel = new LeaveModel();
        $is = $leaveModel->operate($lid, $operate);
        switch ($operate) {
            case 1:
                $this->agree($lid);
                break;
            case -2:
                $this->cancel($lid);
                break;
        }
        return $is;
    }
    public function someone($uid)
    {
        $leaveModel = new LeaveModel();
        $leaves = $leaveModel->someone($uid);
        return json($leaves);
    }
    public function all()
    {
        $leaveModel = new LeaveModel();
        $leaves = $leaveModel->all();
        return json($leaves);
    }
    public function one($lid)
    {
        $leaveModel = new LeaveModel();
        $leave = $leaveModel->one($lid);
        return $leave;
    }
}
