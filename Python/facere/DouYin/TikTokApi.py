# 公共的一些方法
import re

import requests


# 提取抖音分享出来的 复制链接 中的 https链接
def get_init_url(s):
    # 从文本中获取网址，正则表达式获取url，
    # 正表达式获取文本中的url，正则获取文本中的链接
    # 第一种：[A - Za - z] +: // [A - Za - z0 - 9_\-\+~.:? & @= / %  # ,;\{\}\\(\)\[\]\|\*\!\\]+
    # 第二种：[a - zA - z] +: // [ ^\s]*
    # 第三种：(http | https): // [A - Za - z0 - 9_\-\+.:? & @= / %  # ,;]*
    # 第四种：((https | http | ftp | rtsp | mms)?: //)?(([0 - 9a - z_!~ * '().&=+$%-]+: )?[0-9a-z_!~*'().&= +$ % -]+ @)?(
    # ([0 - 9]{1, 3}.)
    #     {3}[0-9]{1, 3} | ([0-9a-z_!~ * '()-]+.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].[a-z]{2,6})(:[0-9]{1,4})?((/?)|(/[0-9a-z_!~*'().;?:@&= +$, %  # -]+)+/?)
    urls = re.findall('(https?://[^\s]+)', s)
    return urls[0]

# 模拟手机浏览器的 user-agent
headers = {
    'User-Agent': 'Mozilla/5.0 (iPad; U; CPU OS 3_2_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B500 Safari/531.21.10'
}

def get_item_id(url):
    url1 = requests.get(url=url, headers=headers).url
    str_url = str(url1)
    str_url1 = str_url.split('/')[5]
    return str_url1