///安卓模拟器 不能使用127.0.0.1 ==> 129.128.0.1
const base_url = "http://127.0.0.1:3000/";

///接口的所有的地址
const servicesPath = {
  ///首页接口
  "homePageContent": base_url + "getHomePageContent",

  ///火爆专区
  "getHotGoods": base_url + "getHotGoods",

  ///商品分类
  "getCategory": base_url + "getCategory",

  ///商品分类的商品列表
  "getCategoryGoods": base_url + "getCategoryGoods",

  ///商品详情
  "getGoodDetail": base_url + "getGoodDetail",
};
