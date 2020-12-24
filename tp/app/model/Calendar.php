<?php

namespace app\model;

use think\Model;

class Calendar extends Model
{
    protected $pk = 'c_id';

    public function countHoliday($startdate, $enddate)
    {
        $days = Calendar::whereTime('workdate', 'between', [$startdate, $enddate])->sum('status');
        return $days;
    }
    public function holiday($startdate, $enddate)
    {
        $cids = Calendar::whereTime('workdate', 'between', [$startdate, $enddate])
            ->where('status', 1)
            ->column('c_id');
        return $cids;
    }
}
