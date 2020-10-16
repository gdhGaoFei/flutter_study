//入口函数
void main() {
  print("hello word");

  /*

  // 所有的代码都需要写到 main() 函数内

  /**
   * 变量 和 数据类型 
   */

  // Number: int / double
  int a = 3;
  double b = 4.3434;
  print(a*b);

  // String
  String name = "张三";
  print(name);

  // string 的转义 + 拼接
  String s1 = '李四\'m 阿事实上对方';
  String s2 = "王二'm jaksjdasd";
  print(s1+"\n"+s2);

  // Bool
  bool is_ok = true;
  if (is_ok) {
    print(name+(a*b).toString());
    print(s1+"${a*b}");
  }

  // $变量 建议 在使用字符串的时候，尽量的使用 $符号，尽量少使用 + 拼接

  // 分支 if else - switch; 三目运算 ? :

  // ?? 表达式

  // for循环
  // for (var i = 0; i < count; i++) {
    
  // }

  // for in 循环
  // for (var item in items) {
    
  // }

  // while循环 
  // do while循环

  // break / continue

  // 数组 -> List

  */

  // - ======= 函数
  /**
   * 0.函数的定义：函数具有一定功能的代码段
   * 1.定义函数
   * 2.函数传参
   * 3.函数返回值
   * 4.函数默认返回值
   * 5.箭头函数(无返回值)
   * 6.箭头函数(有返回值)
   * 7.函数参数(可选参数) [] 中括号即可
   * 8.函数参数  命名 {} 大括号
   * 9.函数参数 赋默认值
  */


  // - ====  try catch on finally
  /**
   * 1.try： 执行的代码，可能会出现异常。一旦发现异常，则立即跳到catch执行。否则不会执行catch里面的内容。
   * 2.catch：除非try里面的代码执行异常，否则这里面的代码不会执行。
   * 2.on：当你需要指定异常类型的时候用on
   * 3.finally：不管什么情况都会执行，包括try、catch里面用了return，可以理解为只要执行了try或者catch，就一定会执行
   * 4.实现自己的try catch异常方法
  */
  // try {
    
  // } catch (e) {
  // }

  // int result = 12 ~/ 4;
  // print(result);

  try {
    int result = 12 ~/ 0;
    print(result);
  } catch (e, s) {
    print("$e");
    print(" ====== ");
    print(s);
  }


  try {
    InputIntNotUnint(-100);
  } catch (e) {
    print('error is ${e.errorMessage()}');
  }


  /// - ==== 类
  /// 1.类的基础知识
  /// 2.构造函数
  /// 3.构造函数参数
  /// 4.定义构造函数
  
  /// - ===== 类的  箭头函数
  /// 1.类的set与get方法。自定义setter与getter方法。
  /// 2.类的继承
  /// 3.重写父类的方法和属性
  /// 
  var dog = Dog();
  dog.eat();
}

// - ===== 继承
class Animal {
  void eat() {
    print("eat");
  }
}

/// 继承 -> 扩展
class Cat extends Animal {
  
}

/// 继承 -> 扩展
class Dog extends Animal {
  
}

// - ====== 继承


//创建
class DepositErrorException implements Exception {
  String errorMessage() {
    return "出现了问题，请查看";
  }
}

void InputIntNotUnint(int a) {
  if (a < 0) {
    throw new DepositErrorException();
  }
}