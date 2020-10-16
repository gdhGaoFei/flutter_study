import mysql
import mysql.connector

# mydb = mysql.connector.connect(
#     # 数据库的主机地址
#     host = '127.0.0.1',
#     # 数据库的用户名
#     user = 'root',
#     # 数据库密码
#     password = '123456'
# )

# print(mydb)

import pymysql


# 打开数据库连接 创建数据库连接
db = pymysql.connect('127.0.0.1', 'root', '123456', 'demo1')
print(db)

# 创建数据库
mycursor = db.cursor()
mycursor.execute("CREATE DATABASE demo1")


