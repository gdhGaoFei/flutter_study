<?php
namespace app\common;

use think\Db;
use app\common\UserModel;

class db_demo1 {
    public function hello() {

        // 数据库名称
        $db_name = 'test1';

        /*// 数据库 = 
        $db_test1 = Db::table('test1');

        $test1_db = $db_test1->where('id',1)->find();
        print_r($test1_db);
        dump($test1_db);

        $db_id = $test1_db["id"];
        echo $db_id;

        echo "这是测试test_demo1文件初始化"."<br>";

        echo '<br>';
        echo '<br>';*/

        /*// - ======= 增删改查 之 查
        // 如果希望在没有找到数据后抛出异常可以使用
        // 查询多个数据（数据集）使用select方法
        $test1_db1 = Db::table('test1')->where('id','>',2)->select();
        // echo $test1_db1->getLastSql();
        dump($test1_db1);

        // 值和列查询
        // 查询某个字段的值可以用
        $test1_db2 = Db::name('test1')->where('id', 1)->value('name');
        dump($test1_db2);

        // 查询某一列的值可以用
        $test1_db3 = Db::name('test1')->where('id', '>', 1)->column('name');
        dump($test1_db3);

        // 数据分批处理 chunk
        // 我们可以全部用户表数据进行分批处理，每次处理 100 个用户记录：
        Db::table($db_name)->chunk(100, function($users) {
            foreach ($users as $user) {
                print_r($user['name'].'<br>');
            }
        });
        
        // myUserIterator 交给回调方法
        Db::name($db_name)->chunk(100, 'myUserIterator');

        // 大批量数据处理 cursor() 使用新版提供的游标查询功能
        $cursor = Db::name($db_name)->where('id', '>', 120)->cursor();
        foreach ($cursor as $user) {
            print_r($user['id'].'<br>');
        }*/

        /*printf('模型 - 数据库 - 下面 paginate'.'<br>');
        
        echo '<br>';
        echo '<br>';

        // 使用page进行查询
        Db::name($db_name)->where('id', '>', 120)->page(1, 100)->select();
        $paginate = Db::name($db_name)->where('id', '>', 120)->paginate(['list_rows' => 20, 'page' => 1])->toArray();
        dump($paginate);

        printf('模型 - 数据库 - 下面 👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇');
        
        echo '<br>';
        echo '<br>';*/

        // $test1_model = UserModel::where('id', '>', 0)->select();
        // dump($test1_model);
        // echo '<br>';
        // echo '<br>';

        // $test1_model_1 = $test1_model[0];
        // dump($test1_model_1);
        // echo '<br>';
        // echo '<br>';

        // print_r($test1_model_1['id']);
        // echo '<br>';
        // echo '<br>';

        // print_r($test1_model_1['name']);
        // echo '<br>';
        // echo '<br>';

        // PHP_EOL;// 换行符

        // print("======= 使用Model 进行增加值 =========");
        // echo '<br>';
        // echo '<br>';

        // // 方法一
        // $user_model1 = new UserModel();
        // // $user_model1['id'] = 123;
        // $user_model1['name'] = "Model生成用户1";
        // $user_model1->save();
        
        // // 方法二
        // $user_model2 = new UserModel();
        // $user_model2->save(
        //     [#['id'] = 125;
        //     'name' => 'model生成用户2 - 方法2',]
        // );

        // // 方法3
        // $user_model3 = new UserModel([
        //     'name' => 'model生成用户 - 方法3',
        // ]);
        // $user_model3->save();

        // /* // 如果需要过滤非数据表字段的数据，可以使用：
        // $user_model4 = new UserModel();
        // $user_model4->allowField(['age'])->save([
        //     'name' => '方法5，过滤非数据字段',
        //     'age' => 1234
        // ]); */

        // // 如果需要过滤非数据表字段的数据，可以使用：
        // $user_model5 = new UserModel();
        // try{

        // }catch(\Exception $e){

        // }
        // $user_model5->save([
        //     'name' => '方法6，过滤非数据字段',
        //     'age' => 1234
        // ]);

        print("======= 数据库相关的练习 =========");
        echo '<br>';
        echo '<br>';
    }
}