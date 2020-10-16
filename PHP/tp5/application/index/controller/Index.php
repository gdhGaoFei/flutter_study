<?php
namespace app\index\controller;

use app\index\controller\Index2;
use app\common\test_demo1;
use app\common\db_demo1;
use think\Db;
use think\Cache;

class Index
{
    private $hanhuangfu = '<br>';

    // 测试接口 进行访问
    public function index_test($page_count = 20) {
        $type = input('post.type', 'yule');
        $page = input('post.page', 1);
        $juhe_key = 'bfc1f26a82392a9c99a5718cb194fc48';
        $juhe_type = $type;
        $juhe_url = 'http://v.juhe.cn/toutiao/index?type='.$juhe_type.'&key='.$juhe_key;
        //echo $juhe_url;

        // 数据库 表 名称
        $db_name = 'juhe_news_toutiao';
        // $a = 1;
        // $b = "{$a}";

        // 返回的数据
        $re_code = 2000;
        $re_msg = '请求成功';
        $re_data = [];
        $juhe_ok = true;

        // 使用 缓存 策略 保证不会太集中区请求数据
        // 缓存自减 
        $cache_dec_name = 'index_test'.$juhe_type;
        // value
        $cache_dec_value = $cache_dec_name.'name';
        // 缓存
        // $cache = Cache::init();
        // 获取缓存数据可以使用：
        $cache_is_null = Cache($cache_dec_name);

        if (!$cache_is_null) {
            $time_gq = rand(15, 30)*60;//*60;
            echo $time_gq;
            echo '<br>'.'<br>'.'<br>';
            Cache($cache_dec_name, $cache_dec_value, $time_gq);
            
            // 请求 聚合 的 新闻头条数据
            // dump($juhe_result);
            $juhe_result = json_decode(file_get_contents($juhe_url), true);

            // 错误码。0是成功， 其他的是 失败。
            // $error_code = isset($juhe_result['error_code'])?0:1;
            $error_code = $juhe_result['error_code'];
            if ($error_code == 0) {
                $reason = $juhe_result['reason'];
                $result = $juhe_result['result'];
                $juhe_re_data = $result['data'];
                // dump($juhe_re_data);
                // -- 由于有的字段是没有的。故此不能使用insertAll 确保要批量添加的数据字段是一致的
                // $db_bz->insertAll($juhe_re_data);
                foreach ($juhe_re_data as $jh_r_data) {
                    Db::name("juhe_news_toutiao")->insert($jh_r_data);
                }
                $juhe_ok = false;
            }
        }

        // 从数据库 进行查询
        // 使用page进行查询
        $paginate = Db::name($db_name)->paginate(['list_rows' => $page_count, 'page' => $page])->toArray();
        // - ====== 此处需要加个 缓存 策略
        
        //dump($paginate);
        $page_data = $paginate['data'];
        ///获取到的数据
        if ($page_data) {
            $re_data = $page_data;
        }else{
            $re_code = 2001;
            $re_msg = "请求失败";
        }

        return json_encode(['code' => $re_code,
        'msg' => $re_msg,
        'data' => $re_data,
        'meta' => ['perPage' => $page_count]]);
    }

    public function index()
    {
        print("数据库 =================".$this->hanhuangfu.$this->hanhuangfu);

        $db_demo1 = new db_demo1();
        $db_demo1->hello();

        print("数据库 ⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫".$this->hanhuangfu.$this->hanhuangfu);
        die;
        $index2 = new Index2('哈吉斯订货会加大');
        $index2->index();

        // 全局变量
        global $hanhuangfu;

        echo 'uuuuuuu'. $hanhuangfu;

        print("这是print函数".$hanhuangfu);

        // 测试demo
        $test_demo1 = new test_demo1;
        $test_demo1->hello();

        return 7878787878;
        //return '<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px;} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:) </h1><p> ThinkPHP V5.1<br/><span style="font-size:30px">12载初心不改（2006-2018） - 你值得信赖的PHP框架</span></p></div><script type="text/javascript" src="https://tajs.qq.com/stats?sId=64890268" charset="UTF-8"></script><script type="text/javascript" src="https://e.topthink.com/Public/static/client.js"></script><think id="eab4b9f840753f8e7"></think>';
    }

    public function hello($name = 'ThinkPHP5')
    {
        return 'hello,' . $name;
    }
}
