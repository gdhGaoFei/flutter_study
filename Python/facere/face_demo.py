import face_recognition
import cv2
from untils.getPeopleInfoApi import get_people_info

# 第一步: 读取存储的人脸图片

# 设置路径
path = 'images/'

# 调用人脸识别API， 获取人脸识别的每一张图片的人名和128维的特征值
img_people_names, img_people_encoding = get_people_info(path)

# print(img_names)
# print(img_encoding)

# 第二步：进行人脸识别
# 开启摄像头
captures = cv2.VideoCapture(1)
print(captures)

# print(cv2.VideoCapture)

# 确认摄像头是否开启
captures_frame = True

while True:

    # 循环按帧读取图像
    ret, frame = captures.read()

    # opencv的 图像是BGR格式 而我们需要的是RGB格式，所以需要对此作出转换
    rgb_frame = frame[:, :, ::-1]

    # print(rgb_frame)

    if captures_frame:
        # 调用api获取人脸的位置
        face_locations = face_recognition.face_locations(rgb_frame)

        # print(face_locations)

        # 调用api获取人脸的特征值
        face_encodings = face_recognition.face_encodings(rgb_frame, face_locations)

        # 存储人的名字
        face_names = []

        # print(face_encodings)

        for face_encoding in face_encodings:
            # 获取人脸特征值之后，与已知的人脸做相似度的比较，设置相似度的准确值位0.5
            matches = face_recognition.compare_faces(img_people_encoding, face_encoding, tolerance=0.5)

            print(matches)

            # 如果有true存在，即代表识别了某一个人的人脸
            if True in matches:
                index = matches.index(True)
                name = img_people_names[index]
            else:
                name = 'unknown'

            # 识别出来 添加名字
            face_names.append(name)
        # 将捕捉的人脸显示出来
        for (top, right, bottom, left), name in zip(face_locations, face_names):
            # 画人脸矩形框
            cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), cv2.FILLED)
            # 在人脸的矩形框下 添加人脸的名称标签
            cv2.rectangle(frame, (left, bottom-35), (right, bottom), (0, 0, 255), cv2.FILLED)
            # 为人名标签设置字体
            font = cv2.FONT_HERSHEY_DUPLEX
            # 为字体设置相关的参数
            cv2.putText(frame, name, (left+6, bottom-6), font, 1, (255, 255, 255), 1)

        cv2.imshow('frame', frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break


captures.release()
cv2.destroyAllWindows()