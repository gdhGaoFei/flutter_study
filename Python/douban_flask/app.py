from flask import Flask, render_template, request
import sqlite3
from wordcloud import WordCloud   # 词云
import jieba   # 分词，把句子分成词语
from matplotlib import pyplot as plt   # 绘图，数据可视化
from PIL import Image   # 图片处理
import numpy as np   # 矩阵运算


app = Flask(__name__)


# 链接数据库 并且返回数据
def get_data_db(sql_name):
    db_name = 'douban_reptile/movie.db'
    # 链接数据库
    conn = sqlite3.connect(database=db_name)
    # 获取游标
    cc = conn.cursor()
    # 需要执行的语句 - 就是传入的 执行的语句
    # sql_name

    # 进行执行语句
    cursor1 = cc.execute(sql_name)
    # 执行完 进行提交
    conn.commit()
    # 关闭
    # cc.close()
    # conn.close()
    return cursor1, cc, conn


# 首页
@app.route('/')
def hello_world():  # put application's code here
    return render_template("index.html")


# 首页
@app.route("/index")
def index():
    return hello_world()


# 电影
@app.route("/movie")
def movie():
    # 从数据库中取数据
    # name = 'douban_reptile/movie.db'
    # conn = sqlite3.connect(database=name)
    # # 获取游标
    # c = conn.cursor()
    # 中文名、英文名、其他名、电影详情、电影图片、导演和主演、电影类型、评分、评价数量、介绍
    conns = get_data_db("SELECT * from movie250")
    c = conns[1]
    conn = conns[2]
    cursor1 = conns[0]   # c.execute("SELECT * from movie250")
    print(type(cursor1))
    movies = []
    for da in cursor1:
        movies.append(da)
    c.close()
    conn.close()
    return render_template("movie.html", movies=movies)


# 评分
@app.route("/source")
def source():
    # 链接数据库
    # conn = sqlite3.connect(database="douban_reptile/movie.db")
    # cc = conn.cursor()
    # sql_name = """
    #
    # """
    # cc.execute(sql_name)
    # conn.commit()
    # cc.close()
    # conn.close()

    # 评分
    scores = []
    # 当前分的电影个数
    nums = []
    conns = get_data_db("select sorce, count(sorce) from movie250 group by sorce")
    conn = conns[2]
    cursor1 = conns[0]
    for cur in cursor1:
        scores.append(str(cur[0]))
        nums.append(cur[1])
    cc = conns[1]
    cc.close()
    conn.close()
    return render_template("source.html", scores=scores, nums=nums)


# 词云
@app.route('/word', methods=['POST', 'GET'])
def word():
    forms = request.form
    value1 = 'introduce'
    print(forms)
    if len(forms) > 0:
        value1 = forms['key_word']

    # 获取需要生成词云的文字或者词
    conns = get_data_db('select %s from movie250' % value1)
    cursor1 = conns[0]
    text = ''
    for item in cursor1:
        text += item[0]
    cc = conns[1]
    cc.close()
    conn = conns[2]
    conn.close()

    # 使用 jieba分词，把句子分成词语
    cut = jieba.cut(text)
    string = ' '.join(cut)
    # print(string)

    # 绘图
    # 打开遮罩图片
    img = Image.open('static/assets/img/huaduo.jpg')
    # 将图片转化为数组
    imgs = np.array(img)
    # 词云
    wc = WordCloud(
        background_color='white',
        mask=imgs,
        font_path='/System/Library/Fonts/PingFang.ttc',
    )
    wc.generate_from_text(string)   # 传入切好的词

    # 绘制图片
    fig = plt.figure(1)
    plt.imshow(wc)
    plt.axis('off')  # 是否显示坐标轴

    # plt.show()  # 绘制完 显示

    # 保存到本地
    save_path = "static/assets/img/word.jpg"
    # dpi 分辨率
    plt.savefig(save_path, dpi=500)

    return render_template("word.html")


#
def checkSelect():
    print("adadadad")


# 团队
@app.route("/team")
def team():
    return render_template("team.html")


# 主程序入口
if __name__ == '__main__':
    app.run()
