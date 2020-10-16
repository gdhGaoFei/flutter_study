import re
import time
from urllib.request import urlopen, urlretrieve


#下载HTML
def getHtml(url1):
    page = urlopen(url1)
    html = page.read()
    return html

# html = getHtml("https://tieba.baidu.com/p/5582243679")
# print(html)

#从html中解析出图片URL
def getImg(html):
    reg=r'img src="(.*?\.png)"'
    imgre=re.compile(reg)
    htmld=html.decode('utf-8')
    imglist=imgre.findall(htmld)
    return imglist

#下载处理
def imgDownload(imgUrl):
    urlretrieve(imgUrl, '%s.jpg'%time.time())


#主函数
def main():
    print("开始下载文件")
    url='http://www.gamemm.com'
    html=getHtml(url)
    imglist=getImg(html)
    print(imglist)
    for imgurl in imglist:
        url1 = imgurl
        if ("http" not in imgurl):
            url1 = url+imgurl
        else:
            print('这是含有http'+url1)
        print(url1)
        imgDownload(url1)
        



def down_huaxue_png():
    for i in range(1,275):
        url = "http://zh2019.91taoke.com/file/gz/hx/dzs/2021ban/bbg/dyl/fxjy/rjbxgk/xs/files/mobile/%d.jpg" % i
        imgDownload(url)

#执行主函数
if __name__=='__main__':
    # main()
    #down_huaxue_png()
    print("化学题")
