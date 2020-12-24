<?php

namespace app\controller;

use app\BaseController;
use app\model\User as UserModel;

class User extends BaseController
{
    public function signIn($uid, $password)
    {
        $userModel = new UserModel();
        if ($userModel->isHaveUser($uid)) {
            $user = $userModel->matchPassword($uid, $password);
            if ($user) {
                return array('code' => 1, 'uid' => $user->u_id, 'name' => $user->name, 'ismanager' => $user->ismanager);
            } else {
                return array('code' => 0, "err" => "密码错误");
            }
        } else {
            return array('code' => 0, "err" => "用户不存在");
        }
    }
}
