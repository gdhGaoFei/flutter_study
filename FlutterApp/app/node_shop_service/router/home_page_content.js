const express = require("express");
const router = express();
const config = require("./config");

///基础的请求地址
const base_url = "http://" + config.IP + ":" + config.PORT;
///首页 图片 的地址
const image_url = base_url + "/images/";
///分类的图片地址
const category_url = image_url + "category/";

router.post("/", (req, res) => {
    var data = {
        "code": "0",
        "msg": "success",
        "data": {
            ///banner轮播图的数据
            "slides": [
                {
                    "image": image_url + "banner/banner1.png",
                    "goodsId": "0001"
                },
                {
                    "image": image_url + "banner/banner2.png",
                    "goodsId": "0002"
                },
                {
                    "image": image_url + "banner/banner3.png",
                    "goodsId": "0003"
                },
                {
                    "image": image_url + "banner/banner4.png",
                    "goodsId": "0004"
                },
            ],
            // 商品推荐上层
            "recommend": [
                {
                    "name": "法国代购新款江流域同款翻领修身中长裙春夏印花连衣裙",
                    "image": image_url + "goods/001/cover.png",
                    "presentPrice": 98.88,
                    "goodsId": "001",
                    "oriPrice": 108.88,
                },{
                    "name": "柔美而精致~款江流域同款翻领修身中长裙春夏印花连衣裙",
                    "image": image_url + "goods/002/cover.png",
                    "presentPrice": 298.88,
                    "goodsId": "002",
                    "oriPrice": 398.88,
                },{
                    "name": "明星同款高端西服2019款江流域同款翻领修身中长裙春夏印花连衣裙",
                    "image": image_url + "goods/003/cover.png",
                    "presentPrice": 318.88,
                    "goodsId": "003",
                    "oriPrice": 388.88,
                },{
                    "name": "复古09231-款江流域同款翻领修身中长裙春夏印花连衣裙",
                    "image": image_url + "goods/004/cover.png",
                    "presentPrice": 143.88,
                    "goodsId": "004",
                    "oriPrice": 243.88,
                },{
                    "name": "91237488-款江流域同款翻领修身中长裙春夏印花连衣裙",
                    "image": image_url + "goods/005/cover.png",
                    "presentPrice": 43.88,
                    "goodsId": "005",
                    "oriPrice": 143.88,
                },{
                    "name": "款翻领修身中长裙春夏印花连衣裙8182931",
                    "image": image_url + "goods/006/cover.png",
                    "presentPrice": 483.88,
                    "goodsId": "006",
                    "oriPrice": 643.88,
                },{
                    "name": "hasdda款翻领修身中长裙春夏印花连衣裙8182931",
                    "image": image_url + "goods/007/cover.png",
                    "presentPrice": 383.88,
                    "goodsId": "007",
                    "oriPrice": 503.19,
                },{
                    "name": "复古廓形机车进口绵羊皮衣真皮外套女12443",
                    "image": image_url + "goods/008/cover.png",
                    "presentPrice": 983.08,
                    "goodsId": "007",
                    "oriPrice": 1503.19,
                },{
                    "name": "l90asd复古廓形机车进口绵羊皮衣真皮外套女12443",
                    "image": image_url + "goods/009/cover.png",
                    "presentPrice": 183.08,
                    "goodsId": "007",
                    "oriPrice": 203.19,
                },{
                    "name": "l90asd复古廓形机ssasd绵羊皮衣真皮外套女12443",
                    "image": image_url + "goods/0010/cover.png",
                    "presentPrice": 183.08,
                    "goodsId": "0010",
                    "oriPrice": 203.19,
                },{
                    "name": "阫爱神的箭接口阿萨德农村",
                    "image": image_url + "goods/0011/cover.png",
                    "presentPrice": 83.58,
                    "goodsId": "0011",
                    "oriPrice": 203.19,
                },
            ],
            ///商品中间的广告
            "floor1Pic": {
                "PICTURE_ADDRESS": image_url + "advert/ad02.png",
                "TO_PLACE": "4",
            },
            ///商品推荐 底部
            "floor1": [
                {
                    "image": image_url + "floor/1.png",
                    "goodsId": "001",
                },{
                    "image": image_url + "floor/2.png",
                    "goodsId": "002",
                },{
                    "image": image_url + "floor/3.png",
                    "goodsId": "003",
                },{
                    "image": image_url + "floor/4.png",
                    "goodsId": "004",
                },{
                    "image": image_url + "floor/5.png",
                    "goodsId": "005",
                },
            ],
            ///分类按钮 推荐
            "category": [
                {
                    "firstCategoryId": "1",
                    "firstCategoryName": "毛衣",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "1.png",
                },{
                    "firstCategoryId": "2",
                    "firstCategoryName": "西服",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "21",
                            "firstCategoryId": "2",
                            "secondCategoryName": "小西服",
                            "comments": "",
                        },{
                            "secondCategoryId": "22",
                            "firstCategoryId": "2",
                            "secondCategoryName": "职业装",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "2.png",
                },{
                    "firstCategoryId": "3",
                    "firstCategoryName": "皮衣",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "31",
                            "firstCategoryId": "3",
                            "secondCategoryName": "真皮皮衣",
                            "comments": "",
                        },{
                            "secondCategoryId": "32",
                            "firstCategoryId": "3",
                            "secondCategoryName": "仿皮皮衣",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "3.png",
                },{
                    "firstCategoryId": "4",
                    "firstCategoryName": "连衣裙",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "41",
                            "firstCategoryId": "4",
                            "secondCategoryName": "连衣裙12",
                            "comments": "",
                        },{
                            "secondCategoryId": "42",
                            "firstCategoryId": "4",
                            "secondCategoryName": "连衣裙32",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "4.png",
                },{
                    "firstCategoryId": "5",
                    "firstCategoryName": "牛仔裤",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "51",
                            "firstCategoryId": "5",
                            "secondCategoryName": "牛仔裤12",
                            "comments": "",
                        },{
                            "secondCategoryId": "52",
                            "firstCategoryId": "5",
                            "secondCategoryName": "连32牛仔裤",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "5.png",
                },{
                    "firstCategoryId": "6",
                    "firstCategoryName": "T恤",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "61",
                            "firstCategoryId": "6",
                            "secondCategoryName": "T恤1232",
                            "comments": "",
                        },{
                            "secondCategoryId": "62",
                            "firstCategoryId": "6",
                            "secondCategoryName": "T恤0000",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "6.png",
                },{
                    "firstCategoryId": "7",
                    "firstCategoryName": "运动裤",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "71",
                            "firstCategoryId": "7",
                            "secondCategoryName": "运动裤122",
                            "comments": "",
                        },{
                            "secondCategoryId": "72",
                            "firstCategoryId": "7",
                            "secondCategoryName": "222运动裤",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "7.png",
                },{
                    "firstCategoryId": "8",
                    "firstCategoryName": "短裙",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "81",
                            "firstCategoryId": "8",
                            "secondCategoryName": "短裙01",
                            "comments": "",
                        },{
                            "secondCategoryId": "82",
                            "firstCategoryId": "8",
                            "secondCategoryName": "短裙02",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "8.png",
                },{
                    "firstCategoryId": "9",
                    "firstCategoryName": "礼服",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "91",
                            "firstCategoryId": "9",
                            "secondCategoryName": "礼物001",
                            "comments": "",
                        },{
                            "secondCategoryId": "92",
                            "firstCategoryId": "9",
                            "secondCategoryName": "礼服002",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "9.png",
                },{
                    "firstCategoryId": "10",
                    "firstCategoryName": "风衣",
                    "secondCategoryV0": [
                        {
                            "secondCategoryId": "101",
                            "firstCategoryId": "10",
                            "secondCategoryName": "长款",
                            "comments": "",
                        },{
                            "secondCategoryId": "102",
                            "firstCategoryId": "10",
                            "secondCategoryName": "中长款",
                            "comments": "",
                        },
                    ],
                    "comments": null,
                    "image": category_url + "10.png",
                },
            ],
        },
    };
    res.send(data);
});

module.exports = router;