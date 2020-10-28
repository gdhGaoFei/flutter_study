// 火爆专区
const express = require('express');
const router = express();
const config = require('./config');

///基础的请求地址
const base_url = 'http://' + config.IP + ":" + config.PORT;
///首页 图片 的地址
const image_url = base_url + "/images";
/// 图片的地址
const goods_url = image_url + "goods/";

router.post("/", (req, res) => {
    // 返回数据
    var hotGoods = {
        "code":"0",
        "message":"success",
        'data': [
            {
                "goodsId":'001',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '001/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'002',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '002/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'003',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '003/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'004',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '004/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'005',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '005/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'006',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '006/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'007',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '007/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'008',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '008/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'009',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '009/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'010',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '010/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
            {
                "goodsId":'011',
                "name": "阿萨德看哈U盾获取全部",
                "image": goods_url + '011/cover.png',
                'presentPrice': 123.090,// 打折价
                'oriPrice': 156.21, // 原价
            },
        ]
    };
    res.send(hotGoods);
});

module.exports = router;