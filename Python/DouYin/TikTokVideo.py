# 抖音视频的爬虫demo

import TikTokApi
import requests
import time

'''
案例分析
1. 先访问假的视频链接
2. 从假的链接中找到真的视频链接 去访问
3. 从真链接中提取视频下载链接访问接口所需要的item_id的值
4. 访问视频下载链接接口，去获取视频的相关数据
5. 从中解析出来最终的下载链接，在解析出来当前视频的名字
'''

# 先获取复制出来的视频链接中的视频的假链接
share_str = input("请复制从抖音来的 '复制链接' 文本：")
share_url = TikTokApi.get_init_url(share_str)
print(share_url)

# 从假的链接中 去找到真链接 获取到item_id
headers = TikTokApi.headers

item_id = TikTokApi.get_item_id(share_url)
print(item_id)

# 拼接视频参数的请求链接
v_xhr_url = "https://www.iesdouyin.com/web/api/v2/aweme/iteminfo/?item_ids={}".format(item_id)

# 将拼接好的视频链接 去请求真实的数据 json数据
res = requests.get(url=v_xhr_url, headers=headers).json()
# print(res)

item_list0 = res["item_list"][0]

# 真正的请求链接
v_url = item_list0['video']['play_addr']['url_list'][0]
# 真正的名字
v_name = item_list0['desc']

if len(v_name) <= 0:
    v_name = item_list0['author']['nickname'] + '~' + str(int(time.time()*100000))

print(v_url)
print(v_name)

# pass

# 拿到视频的二进制数据
final_video = requests.get(url=v_url, headers=headers).content

# 文件的名字 Users/gaodehua/Desktop/MineProject/Study/Python/facere/
file_name = 'video/' + v_name + '.mp4'

# 准备写入文件
with open(file_name, 'wb') as f:
    f.write(final_video)
print("视频已经下载完毕，请查看~")

