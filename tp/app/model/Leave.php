<?php

namespace app\model;

use think\Model;

class Leave extends Model
{
    protected $pk = 'l_id';

    public function apply($uid, $reason, $startdate, $enddate, $time, $days)
    {
        $leave = Leave::save([
            'u_id' => $uid,
            'reason' => $reason,
            'startdate' => $startdate,
            'enddate' => $enddate,
            'time' => $time, 'days' => $days
        ]);
        return $leave;
    }

    public function operate($lid, $operate)
    {
        $leave = Leave::where('l_id', $lid)->update(['isagree' => $operate]);
        return $leave;
    }
    public function someone($uid)
    {
        $leave = Leave::alias('l')
            ->where('l.u_id', $uid)
            ->leftJoin('elm_user u', 'u.u_id=l.u_id')
            ->order('time', 'desc')
            ->field('l.l_id,u.name,l.reason,l.time,l.isagree')
            ->select();
        return $leave;
    }
    public function all()
    {
        $leave = Leave::alias('l')
            ->leftJoin('elm_user u', 'u.u_id=l.u_id')
            ->order('time', 'desc')
            ->field('l.l_id,u.name,l.reason,l.time,l.isagree')
            ->select();
        return $leave;
    }
    public function one($lid)
    {
        $leave = Leave::alias('l')
            ->where('l_id', $lid)
            ->leftJoin('elm_user u', 'u.u_id=l.u_id')
            ->field('l_id,l.u_id,name,reason,startdate,enddate,days,time,isagree')
            ->find();
        return $leave;
    }
}
