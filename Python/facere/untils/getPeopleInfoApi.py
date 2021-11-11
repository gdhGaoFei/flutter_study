import face_recognition
import os

# 方法 获取图片的名称及128维特征值
def get_people_info(path):
    # 存储已知人的名字列表
    img_people_name = []
    # 存储已知人的特征值
    img_people_encoding = []

    #统一加载预存的所有图片
    for image_name in os.listdir(path):
        load_image = face_recognition.load_image_file(path+image_name)
        
        # 获得128维度特征值:128维矩阵; 又因为可能存在多个人脸,所以返回的是矩阵列表
        image_people_face_encoding = face_recognition.face_encodings(load_image)[0]

        # 将读取到的图片所展示的人名存储进 已知人的列表
        img_people_name.append(image_name.split(".")[0])

        # 将每张图片获取的128维 特征值存储进 特征值列表
        img_people_encoding.append(image_people_face_encoding)
    
    return img_people_name, img_people_encoding