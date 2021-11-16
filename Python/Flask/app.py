import datetime

from flask import Flask, render_template, request
# result 相关请求
# render_template 渲染模板


app = Flask(__name__)


# # 路由解析，通过用户访问的路径，匹配相应的函数
# @app.route('/')
# def hello_world():  # put application's code here
#     return '你好，奥术大师多'


@app.route('/hello')
def hello():
    return "hello"


# 通过访问路径，获取用户传入的字符串
@app.route('/world/<name>')  # <int:id>
def world(name):
    return "你好" + name


# 返回int
@app.route('/user/<int:id>')  # 也可以是 float
def user(id1):
    return "你好，%d号会员，欢迎光临" % id1


# 路由路径不能重复，用户通过唯一的路径访问特定的函数


# 返回给用户渲染后的网页文件
@app.route('/')
def index():
    time = datetime.date.today()  # 普通变量
    names = ["小明", "小红", "小黑", "小白"]  # 列表变量
    tasks = {"任务": "打扫卫生", "时间": "3小时"}  # 字典的类型
    # print(tasks.items())
    return render_template('index.html', var=time, names=names, tasks=tasks)


# 表单提交
@app.route("/test/register")
def register():
    return render_template('test/register.html')


# 提交结果
@app.route("/result", methods=['POST', 'GET'])
def result():
    if request.method == "POST":
        forms = request.form   # 传入进来的数据
        return render_template('result.html', forms=forms)


if __name__ == '__main__':
    app.run()
