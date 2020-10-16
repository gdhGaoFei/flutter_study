#coding=utf-8
a = b = c = 1
print("sadadsads"+ str(a+b+c))

from urllib.request import urlopen, urlretrieve
import re
import time
import requests

url = "https://item.jd.com/3112072.html"
try:
    r = requests.get(url)
    r.raise_for_status()
    #查看状态信息，返回的是200，说明返回信息正确并且已经获得该链接相应内容。
    r.encoding = r.apparent_encoding
    #查看编码格式，这个格式是jbk，说明我们从http的头部分已经可以解析出网站信息。
    print(r.text[:1000])
except:
    print("爬取失败")



    
