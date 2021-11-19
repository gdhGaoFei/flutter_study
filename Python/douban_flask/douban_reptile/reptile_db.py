"""
1. 分析网址，准备抓取数据内容
2. 分析数据内容，进行爬取
3. 将爬取的数据保存到数据库中

豆瓣电影Top250
# 中文名、英文名、其他名、电影详情、电影图片、导演和主演、电影类型、评分、评价数量、介绍

"""

# print("准备开始")

import requests   # 数据请求
import re   # 正则表达式
from bs4 import BeautifulSoup
import sqlite3

# 第一步 分析网址 抓取数据 豆瓣Top250
base_url = 'https://movie.douban.com/top250'
# 伪装请求头
headers = {
    'User-Agent': "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1",
}


# 访问网址 - 返回字符串
def get_url(url):
    req = requests.get(url=url, headers=headers)
    code = req.status_code
    content = ''
    if code == 200:   # 请求成功
        content = req.content.decode(encoding='utf-8')
    else:
        print("请求失败,错误码%d" % code)
    return content


# 去掉 一些特殊符号 空格等 如'\xa0/\xa0The Shawshank Redemption'
def remove_kg_qt(str1):
    tit = str1.replace("\xa0", "")
    tit = tit.replace("/", "")
    return tit


# 分析数据 - 进行保存的前一步
def analyze_data():
    # 保存数据时的 数组
    data_list = []

    # 标题的正则表达式
    re_title = re.compile(r'<span class="title">(.*?)</span>')
    # 其他的名
    re_other_tit = re.compile(r'<span class="other">(.*?)</span>')
    # 电影详情
    re_link_info = re.compile(r'<a href="(.*?)">')
    # 电影图片 <img alt="肖申克的救赎" class="" src="https://img2.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg" width="100"/>
    re_img = re.compile(r'<img alt=.*? class="" src="(.*?)" .*?/>')
    # director 导演
    re_director = re.compile(r'<p class="">(.*?)</p>', re.S)   # 包含换行符
    # 评分 <span class="rating_num" property="v:average">9.7</span>
    re_source = re.compile(r'<span class="rating_num" property="v:average">(.*?)</span>')
    # <span>2485539人评价</span> 评价
    re_evaluation = re.compile(r'<span>(.*?)人评价</span>')
    # 介绍 <span class="inq">希望让人自由。</span>
    re_inq = re.compile(r'<span class="inq">(.*?)</span>')

    # 请求数据
    for i in range(0, 10):
        b_url = base_url+"?start=%d" % (i*25)
        content = get_url(url=b_url)
        # 进行取值   # 逐一解析数据
        soup = BeautifulSoup(content, 'html.parser')
        # 查找符合要求的字符串，形成列表 <div class="item">
        for re_soup in soup.find_all(name='div', class_='item'):
            re_str = str(re_soup)
            # print(re_str)
            # print("===============\n\n\n")
            # 保存数据 每一个数据 都是一个电影对象.中文名 英文名 其他名
            # 中文名、英文名、其他名、电影详情、电影图片、导演和主演、电影类型、评分、评价数量、介绍
            movie = []

            # 标题
            titles = re.findall(pattern=re_title, string=re_str)
            if len(titles) == 1:
                titles.append("")
            for tit in titles:
                tit = remove_kg_qt(str1=tit)
                movie.append(tit)

            # 其他的标题
            other_tits = re.findall(pattern=re_other_tit, string=re_str)
            if len(other_tits) > 0:
                oth_t = other_tits[0].lstrip()
                oth_t = oth_t.lstrip('/').lstrip()
                movie.append(oth_t)
            else:
                movie.append("")

            # 电影详情
            link_infos = re.findall(pattern=re_link_info, string=re_str)
            if len(link_infos) > 0:
                movie.append(link_infos[0])
            else:
                movie.append("")

            # 电影图片
            link_imgs = re.findall(pattern=re_img, string=re_str)
            if len(link_imgs):
                movie.append(link_imgs[0])
            else:
                movie.append("")

            # 导演
            directors = re.findall(pattern=re_director, string=re_str)
            if len(directors) > 0:
                dir_re = directors[0].replace("\n", "").rstrip()
                dir_res = dir_re.split('<br/>')
                for j in range(0,2):
                    if j < len(dir_res):
                        dir1 = dir_res[j].lstrip()
                        movie.append(dir1)
                    else:
                        movie.append("")
            else:
                movie.append("")
                movie.append("")

            # 评分
            sources = re.findall(pattern=re_source, string=re_str)
            if len(sources) > 0:
                dir_re = sources[0]
                movie.append(dir_re)
            else:
                movie.append("")

            # re_evaluation 评价
            evaluas = re.findall(pattern=re_evaluation, string=re_str)
            if len(evaluas) > 0:
                dir_re = evaluas[0]
                movie.append(dir_re)
            else:
                movie.append("")

            # 介绍
            inqs = re.findall(pattern=re_inq, string=re_str)
            if len(inqs) > 0:
                dir_re = inqs[0]
                movie.append(dir_re)
            else:
                movie.append("")

            # 中文名、英文名、其他名、电影详情、电影图片、导演和主演、电影类型、评分、评价数量、介绍
            data_list.append(movie)
            # print("===============\n\n\n")
            # print(movie)
            # break
        # print(soup)
        # break
    return data_list


# 初始化数据库
def init_db(name):
    con = sqlite3.connect(name)   # 初始化 如果没有这个数据 则创建

    # 操作数据库的对象 游标
    con1 = con.cursor()

    # 中文名、英文名、其他名、电影详情、电影图片、导演和主演、电影类型、评分、评价数量、介绍
    # 执行的语句 - 创建数据库
    sql_name1 = '''CREATE TABLE movie250
       (id INTEGER PRIMARY KEY autoincrement,
       cname           TEXT,
       ename           TEXT,
       oname           TEXT,
       linkinfo        TEXT,
       linkimg         TEXT,
       sort_direction  TEXT,  
       type            TEXT,
       sorce           REAL,
       numnva          TEXT,
       introduce       TEXT );'''

    # 执行操作
    con1.execute(sql_name1)
    # 保存提交
    con.commit()

    # 保存完成之后 关闭
    con1.close()
    con.close()


# 把数据写入 数据库中
def movie_write_database(name, lists):
    print("写入数据库")
    # 获取数据库
    conn = sqlite3.connect(database=name)
    # 获取游标
    cc = conn.cursor()
    # 需要执行的语句 - 插入数据
    # 中文名、英文名、其他名、电影详情、电影图片、导演和主演、电影类型、评分、评价数量、介绍
    for list1 in lists:
        for i in range(len(list1)):
            if i != 7:
                list1[i] = '"'+list1[i]+'"'
        list_str = ", ".join(list1)
        sql_name = """
    INSERT INTO movie250 
    (cname, ename, oname, linkinfo, linkimg, sort_direction, type, sorce, numnva, introduce)
    VALUES (%s)
    """ % list_str
        # print(sql_name)
        # 开始执行语句
        cc.execute(sql_name)
        # 执行之后 提交到数据库
        conn.commit()
        # break
    # 进行关闭
    cc.close()
    conn.close()


# 主程序
def main():
    # 抓取数据
    # get_url(url=base_url)
    # 分析数据
    lists = analyze_data()

    # 数据库的名称
    db_name = "movie.db"
    # 进行数据存储 - 使用 sqlite 数据库
    # init_db(name=db_name)
    # 写入数据库
    movie_write_database(name=db_name, lists=lists)


# 程序的主入口
if __name__ == '__main__':
    print("程序入口，开始走程序")
    main()

