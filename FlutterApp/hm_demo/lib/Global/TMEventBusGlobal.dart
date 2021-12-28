import 'package:event_bus/event_bus.dart';

// 订阅者 发送时的 数据 可以进行扩展
class TMEventBusGlobal {
  // String msg;
  TMEventBusStyle status = TMEventBusStyle.none;

  TMEventBusGlobal(this.status);
}

// 枚举
enum TMEventBusStyle {
  // none
  none,
  // 添加 记账成功时的 订阅文本
  accoutAdd,
}

//订阅者 定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var eventBus = new EventBus();
// 添加 记账成功时的 订阅文本
// final String kEventBusAccoutingAddSuccess = "EventBusAccoutingAddSuccess-12345";
