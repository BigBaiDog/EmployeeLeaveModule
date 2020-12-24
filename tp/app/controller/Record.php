<?php

namespace app\controller;

use app\BaseController;
use app\model\Record as RecordModel;
use app\model\User as UserModel;

class Record extends BaseController
{
    public function test()
    {
        $recordModel = new RecordModel();
        $res = $recordModel->read();
        return json($res);
    }
    public function today()
    {
        $recordModel = new RecordModel();
        $userModel = new UserModel();
        $today = date('Y-m-d');
        $leavetotal = $recordModel->total($today);
        $companytotal = $userModel->total();
        $res = [
            'worktotal' => $companytotal - $leavetotal,
            'leavetotal' => $leavetotal
        ];
        return $res;
    }
}
