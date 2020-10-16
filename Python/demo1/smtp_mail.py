import smtplib
from email.mime.text import MIMEText
from email.header import Header

sender = '964195787@qq.com'
receivers = ['gdhgaofei@163.com'] # 接收邮件，可设置为你的QQ邮箱或者其他邮箱

# 三个参数：第一个为文本内容，第二个 plain 设置文本格式，第三个 utf-8 设置编码
message = MIMEText(
    'Python 发送的文本。测试测试测试 发送的内容',
    'plain',
    'utf-8'
)

# 发送者
message['From'] = Header(
    'Python 发送者',
    'utf-8'
)

# 接受者
message['To'] = Header(
    'Python 接受者',
    'utf-8'
)

subject = 'Python SMTP 邮件测试'
message['Subject'] = Header(
    subject,
    'utf-8'
)

try:
    smtpObj = smtplib.SMTP('localhost')
    smtpObj.sendmail(sender, receivers, message.as_string())
    print('邮件发送成功')
except smtplib.SMTPException:
    print ("Error: 无法发送邮件")

