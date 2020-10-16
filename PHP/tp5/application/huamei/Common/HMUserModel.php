<?php
namespace app\huamei\Common;

use think\model;

class HMUserModel extends Model {
    // 直接使用配置参数名
    // 5.1中模型不会自动获取主键名称，必须设置pk属性。
    protected $pk = 'id';

    // 设置当前模型对应的完整数据表名称
    protected $table = 'User';

    // 设置当前模型的数据库连接
    protected $connection = 'demo1';
}