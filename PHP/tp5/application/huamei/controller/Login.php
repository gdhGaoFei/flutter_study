<?php
namespace app\huamei\Controller;

use LengthException;
use think\model;
use think\Db;
use app\huamei\Common\HMUserModel;

/**
 * 我们想要使用默认算法散列密码
 * 当前是 BCRYPT，并会产生 60 个字符的结果。
 *
 * 请注意，随时间推移，默认算法可能会有变化，
 * 所以需要储存的空间能够超过 60 字（255字不错）
 */
// echo password_hash("rasmuslerdorf", PASSWORD_DEFAULT);

class Login {

    // - ==== 用户登录
    // - === 手机号登录
    public function login() {
        $user = input('get.user');
        $pw = input('get.password');
        // echo $user.'<br>'.$pw;
        // echo '<br>'.'<br>'.'<br>'.'<br>';
        // $user = HMUserModel::where('phone', $user)->where('password', md5($pw))->find();
        $params = ['phone'=>$user, 'password'=>md5($pw)];
        $user = HMUserModel::where($params)->find();
        // $user = Db::name('User')->where('phone', $user)->find();
        // dump($user);
        // echo '<br>'.'<br>'.'<br>'.'<br>';
        if ($user) {
            unset($user['password']);
            return json_encode(['code'=>2000, 'msg'=>'查询成功', 'data'=>$user]); 
        }
        return json_encode(['code'=>2001, 'msg'=>'账号或密码错误', 'data'=>[]]);
    }

    // - === 注册 两次md5加密再加盐。盐要入数据库。
    public function registered() {
        $user = input('get.phone');
        $pw = input('get.password');

        //echo $this->create_unique();
        // static $array=array();
        // for($j=1;$j<=550000;$j++)
        // {
        //     $array[] = $this->auID($j);
        // }
        // print_r(count(array_unique($array)));
        // echo '<br>'.'<br>'.'<br>'.'<br>';

        // print_r($this->array_repeat($array));
        // echo '<br>'.'<br>'.'<br>'.'<br>';

        //echo var_dump($this->auID1());
        //echo '<br>'.'<br>'.'<br>'.'<br>';

        // 检测 数据是否正确
        $pw_len = strlen($pw);
        if (!$user || ($pw_len<6 || $pw_len>20)) {            
            return json_encode(['code' => 2001,
                    'msg' => '账号或者密码错误',
                    'data' => []]);
        }

        // 检测 用户是否已经存在
        $phone_is_null = Db::name('User')->where('phone', $user)->find();
        if ($phone_is_null) {
            return json_encode(['code' => 2001,
                    'msg' => '账号已存在，请直接登录',
                    'data' => []]);
        }

        $pw = md5($pw);// $this->StrCode($pw);
        
        //使用Model 进行保存数据
        $user_model = new HMUserModel();
        $user_model['password'] = $pw;
        $user_model['phone'] = $user;
        $name = substr($user, strlen($user)-4, 4);
        $user_model['name'] = '用户'.$name;
        $user_model->save();

        // 更新当前的 用户uid
        $id = $user_model->id;
        $uid = rand(1, 10).$id.rand(10, 99);
        $user_model->save(['uid' => $uid], ['id'=>$uid]);

        return json_encode(['code' => 2000,
                'msg' => '注册成功',
                'data' => []]);
    }
    


    // - ===== 唯一的8位数字 ID 不靠谱。
    function auID1()
    {
        $autoID = mt_rand(1, 550000);
        $autoCharacter = array("1","2","3","4","5","6","7","8","9","A","B","C","D","E");
        $len = 7-((int)log10($autoID) + 1);
        $i=1;
        $numberID = mt_rand(1, 2).mt_rand(1, 4);
        for($i;$i<=$len-1;$i++)
        {
            $numberID .= $autoCharacter[mt_rand(1, 13)];
        }
        echo $numberID.'<br>'.'<br>'.'<br>';
        $uid = base_convert($numberID."E".$autoID, 16, 10); 
        return base_convert($uid, 10, 9);
        //--->这里因为autoid永远不可能为E所以使用E来分割保证不会重复
    }


    function auID($autoID)
    {
        $autoID = $autoID;
        $autoCharacter = array("1","2","3","4","5","6","7","8","9","A","B","C","D","E");
        $len = 7-((int)log10($autoID) + 1);
        $i=1;
        $numberID = mt_rand(1, 2).mt_rand(1, 4);
        for($i;$i<=$len-1;$i++)
        {
            $numberID .= $autoCharacter[mt_rand(1, 13)];
        }
        return base_convert($numberID."E".$autoID, 16, 10);
        //--->这里因为autoid永远不可能为E所以使用E来分割保证不会重复
    }

    function array_repeat($arr) 
    { 
        if(!is_array($arr)) return $arr; 
            
        $arr1 = array_unique($arr); 
            
        $arr3 = array_diff_key($arr,$arr1);  

        return array_unique($arr3); 
    }



    //生成唯一标识符
    //sha1()函数， "安全散列算法（SHA1）"
    function create_unique() {
        $data = $_SERVER['HTTP_USER_AGENT'] . $_SERVER['REMOTE_ADDR']
        .time() . rand();
        return sha1($data);
        //return md5(time().$data);
        //return $data;
    }


    /**
     * 加密、解密字符串
     *
     * @global string $db_hash
     * @global array $pwServer
     * @param $string 待处理字符串
     * @param $action 操作，ENCODE|DECODE 
     * @return string
     */
    function StrCode($string, $action = 'ENCODE') {
        $action != 'ENCODE' && $string = base64_decode($string);
        $code = '';
        $key = substr(md5($_SERVER['HTTP_USER_AGENT']), 8, 18);
        $keyLen = strlen($key);
        $strLen = strlen($string);
        for ($i = 0; $i < $strLen; $i++) {
        $k = $i % $keyLen;
        $code .= $string[$i] ^ $key[$k];
        }
        return ($action != 'DECODE' ? base64_encode($code) : $code);
    }
    /*
    * ENCODE为加密，DECODE为解密
    * 加密就是把字符串的每个字符进行^运算，生成新字符串再base64一下返回。
    * 用来进行^运算的字符串通过MD5一些全局变量再substr获得。
    * 
    * 这里注意，^运算必须是2个长度相同的字符串才不会产生掉串，
    * 例如：'asd'^'123' == 'PAW',但是'asd'^'123456'还是等于'PAW',多余的字符掉了，
    * 并且不知道传入的字符串到底是多长，因此生成^运算的字符串也不知道要生成多长，
    * 这里用循环的方式进行处理，即^运算的字符串可以是任意长度，然后要加密的字符串用第一个字符与^运算的字符串的第一个字符进行与运算，
    * 以此类推，当^运算的字符长度不够时就循环使用,上边的for循环里边的取%运算就是这个道理。 
    */
}