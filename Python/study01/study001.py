import math

# # 1.计算圆的周长
# # 输入圆的半径
# r = input("输入圆的半径r:")
# print("圆的半径是"+r)
# r = int(r)

# # 圆的周长 
# zc = 2*3.14*r
# print("圆的半径是"+str(zc))



# # 2.输入两个数, 比较大小后, 从小到大升序输出
# a = input("输入第一个数字:")
# b = input("输入第二个数字:")

# a1 = float(a)
# b1 = float(b)

# if a1 < b1:
#     print(a, b)
# else:
#     print(b, a)



# # 3.依次输入如干个整数, 打印最大的值.如果输入空,则退出程序.
# maxNum = 0
# tccx = True
# while tccx:
#     m1 = input("请输入数字:")
#     # print(m1)
#     if m1 != "":
#         m = int(m1)
#         if maxNum < m:
#             maxNum = m
#     else:
#         tccx = False
#         print("最大的数字是:"+str(maxNum))



# 4.给定一个不超过5位的正整数(不转化为字符串), 判断该数的位数,依次打印出万位/千位/百位/十位/个位
# while True:
#     input_str = input("请输入不超过5位的正整数:")
#     if input_str == "" :
#         break
#     # 输入的文字数字
#     num = int(input_str)
#     if num > 99999 :
#         print("您输入的数字已超纲,请重新输入.")
#         continue
    
#     ws1 = 5
#     flag = True

#     # w = 10000
#     for i in range(4):
#         w = 10 ** (4-i)
#         x = num // w
#         num = num%w
#         print(x, num)
#         if flag :
#             if x:
#                 flag = False
#                 pass
#             else:
#                 ws1 -= 1
#         # w //= 10
#     print(num)
#     print("位数是%d" % ws1)

    # ws = 1

    # ww = 0
    # qw = 0
    # bw = 0
    # sw = 0
    # gw = 0

    # if num > 9999:
    #     ws = 5
    #     ww = int(num/10000)
    #     qw = int((num%10000)/1000)#(num-10000*ww)/1000
    #     bw = int(((num-10000*ww)%1000)/100)
    #     sw = int((num-10000*ww-qw*1000-bw*100)/10)
    # elif num > 999:
    #     ws = 4
    #     qw = int(num/1000)
    #     bw = int((num%1000)/100)#(num-10000*ww)/1000
    #     sw = int((num-1000*qw-bw*100)/10)
    # elif num > 99:
    #     ws = 3
    #     bw = int(num/100)
    #     sw = int((num-100*bw)/10)
    # elif num > 9:
    #     ws = 2
    #     sw = int(num/10)

    # gw = num-10000*ww-qw*1000-bw*100-sw*10
    # print("输入的数字%d是%d位数.万位是%d,千位是%d,百位是%d,十位是%d,个位是%d." % (num, ws, ww, qw, bw, sw, gw))



# 5. 空心的正方形
# n = int(input("请输入正方形的个数:"))
# if n > 2:
#     for i in range(n):
#         if i == 0 or i == n-1:
#             print("*"*n)
#         else:
#             print("*%s*" % ((n-2)*" "))
# else:
#     print("需要输入大于2的数字")





# 6.  打印 菱形※
# n = 7
# e = n // 2
# for i in range(-e, e+1):
#     j = abs(i)
#     print("%s%s" % (" "*j, "※"*(2*(e-j)+1)))

# 序号    菱形个数  前空格  后空格
# 1    0    1       3      3
# 2    1    3       2      2
# 3    2    5       1      1
# 4    3    7       0      0
# 5    2    5       1      1
# 6    1    3       2      2
# 7    0    1       3      3






# 7. 打印对顶三角形
# 序号    菱形个数  前空格  后空格
# 1    3    7       0      0
# 2    2    5       1      1
# 3    1    3       2      2
# 4    0    1       3      3
# 5    1    3       2      2
# 6    2    5       1      1
# 7    3    7       0      0

# n = 11
# e = n // 2
# for i in range(-e, e+1):
#     j = abs(i)
#     str1 = " "*(e-j) + "※" * ((2*j)+1)
#     # print(str1)
#     print("{}".format(str1))




# 8. 打印闪电 三角形
# 序号    菱形个数  前空格  后空格
# 1    0    1       3      3
# 2    1    2       2      3
# 3    2    3       1      3
# 4    3    7       0      0
# 5    2    3       3      1
# 6    1    2       3      2
# 7    0    1       3      3

# n = 11
# e = n // 2
# e1 = e+1
# char_kg = " "
# char_xh = "※"

# for i in range(-e, e1):
#     if i < 0:
#         j = abs(i)
#         str1 = char_kg*j
#         print(str1+char_xh*(e1+i))
#     elif i == 0:
#         print(char_xh*n)
#     else:
#         str1 = char_kg*e
#         print(str1+char_xh*(e1-i))





# 9. 斐波那契数列
# f(0) = 0
# f(1) = 1
# f(1) = f(0)+f(1) = 1
# f(2) = f(1)+f(1) = 2
# f(3) = f(2)+f(1) = 3
# f(4) = f(3)+f(2) = 5


# f0 = 0
# f1 = 1
# print(0, f0)
# print(1, f1)

# for i in range(10):
#     f2 = f0+f1
#     print(i+2, f2)
#     f0 = f1
#     f1 = f2



# 10. 质数又叫素数，指的是在大于1的自然数中，除了1和它本身以外不再有其他因数的自然数。反之，则被称为合数
#     。1和0既非素数，也非合数。质数有无穷个
# 质数又叫素数,指的是在大于1的自然是中,除了1和它本省以外不再有其他的因数的自然数.反之,则被称为合数.1和0既非素数,也非合数.质数有无穷个.
# 求 10以内的质数


# import datetime

# # 有多少个素数
# count = 1
# # 开始计算时间的点
# start = datetime.datetime.now()
# for i in range(3, 10**6, 2):
#     for j in range(3, int(i**0.5)+1, 2):
#         if i % j == 0:
#             # print("{}是合数".format(i))
#             break
#     else:
#         count += 1
#         print(i)

# # 完成计算的时间
# endTime = (datetime.datetime.now() - start).total_seconds()
# print("\n素数的个数有{}, 运行时间是{}".format(count, endTime))
# # 素数的个数有9592, 运行时间是133.59731  --> 素数的个数有9592, 运行时间是1.243665


# 11. Python 内存管理
print("asdasds")
# face_recognition   opencv
import face_recognition
import cv2


# face_recognition.load_image_file('')