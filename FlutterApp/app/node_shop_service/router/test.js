const express = require("express");
const router = express();
const config = require("./config");
///基础的地址
const base_url = "http://" + config.IP + ":" + config.PORT;
///轮播图的基础地址
const banner_url = base_url + "/images/banner/";


router.get("/", (req, res) => {

    /// get请求时 传递过来的参数
    var id = req.query.id;
    console.log("传递过来的参数 id：" + id);

    var data = {
        "code": "0",
        "msg": "success",
        "data": [
            {
                "image": banner_url + "banner1.png"
            },
            {
                "image": banner_url + "banner2.png"
            },
            {
                "image": banner_url + "banner3.png"
            },
        ],
    };

    res.send(data);

});

module.exports = router;