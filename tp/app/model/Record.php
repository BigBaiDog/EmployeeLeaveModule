<?php

namespace app\model;

use think\Model;

class Record extends Model
{
    protected $pk = 'r_id';
    public function post($cids, $lid, $uid)
    {
        $data = array();
        foreach ($cids as $cid) {
            $temp = ['l_id' => $lid, 'u_id' => $uid, 'c_id' => $cid];
            array_push($data, $temp);
        }
        $res = Record::insertAll($data);
        return $res;
    }
    public function del($lid)
    {
        $res = Record::where('l_id', $lid)->delete();
        return $res;
    }
    public function read()
    {
        $data = Record::alias('r')
            ->leftJoin('elm_user u', 'u.u_id=r.u_id')
            ->rightJoin('elm_calendar c', 'c.c_id=r.c_id')
            ->field('workdate,holiday,name')
            ->select();
        return $data;
    }
    public function total($date)
    {
        $total = Record::alias('r')
            ->leftJoin('elm_calendar c', 'c.c_id=r.c_id')
            ->where('workdate', $date)
            ->count();
        return $total;
    }
}
