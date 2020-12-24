<?php

namespace app\model;

use think\Model;

class User extends Model
{
    protected $pk = 'u_id';
    public function isHaveUser($uid)
    {
        $user = User::find($uid);
        return $user;
    }
    public function matchPassword($uid, $password)
    {
        $user = User::where('u_id', $uid)->where('password', $password)->find();
        return $user;
    }
    public function total()
    {
        $total = User::count();
        return $total;
    }
}
