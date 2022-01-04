import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_luban/flutter_luban.dart';
import 'package:hm_demo/View/home/love/jh_photo_allscreen_show.dart';
import 'package:hm_demo/ViewModel/love/hmloveimage_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HMLoveImageView extends StatefulWidget {
  const HMLoveImageView({Key key}) : super(key: key);

  @override
  _HMLoveImageViewState createState() => _HMLoveImageViewState();
}

class _HMLoveImageViewState extends State<HMLoveImageView> {
  // 获取相册中的图片和用相机拍照
  final _picker = ImagePicker();

  // 初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 加载数据
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('恋爱日记'),
      body: GridView.count(
        //一行的Widget数量
        crossAxisCount: 3,
        shrinkWrap: true,
        //垂直子Widget之间间距
        mainAxisSpacing: 8.h,
        //水平子Widget之间间距
        crossAxisSpacing: 8.0.w,
        //GridView内边距
        padding: EdgeInsets.all(8.0.w),
        //子Widget列表
        children: _itemBuilderGridlist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }

  // gridview的子视图 列表  Cells
  List<Widget> _itemBuilderGridlist() {
    List<Widget> widgets = [];
    HMLoveImageViewModel vm = Provider.of<HMLoveImageViewModel>(context);
    List imgs = vm.getImgs;
    if (imgs != null) {
      List images = [];
      for (var item in imgs) {
        images.add(item['url']);
      }
      for (var i = 0; i < imgs.length; i++) {
        dynamic e = imgs[i];
        widgets.add(
          Stack(
            // 层叠布局
            children: [
              GestureDetector(
                child: CachedNetworkImage(
                  imageUrl: e['url'],
                  fit: BoxFit.fill,
                  width: 200.w,
                  height: 200.h,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context, Animation animation,
                              Animation secondaryAnimation) =>
                          FadeTransition(
                        opacity: animation,
                        child: JhPhotoAllScreenShow(
                          imgDataArr: images,
                          index: i,
                        ),
                      ),
                    ),
                  );
                },
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onTap: () {
                  context
                      .read<HMLoveImageViewModel>()
                      .delete(e['id'].toString());
                },
              )
            ],
          ),
        );
      }
      // widgets = imgs
      //     .map(
      //       (e) => Stack(
      //         // 层叠布局
      //         children: [
      //           GestureDetector(
      //             child: CachedNetworkImage(
      //               imageUrl: e['url'],
      //               fit: BoxFit.fill,
      //               width: 200,
      //               height: 200,
      //             ),
      //             onTap: () {
      //               Navigator.of(context).push(
      //                 PageRouteBuilder(
      //                   pageBuilder: (BuildContext context, Animation animation,
      //                           Animation secondaryAnimation) =>
      //                       FadeTransition(
      //                     //使用渐隐渐入过渡,
      //                     opacity: animation,
      //                     child: JhPhotoAllScreenShow(
      //                       imgDataArr: [e['url']],
      //                       index: 0,
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //           ),
      //           GestureDetector(
      //             child: Align(
      //               alignment: Alignment.topRight,
      //               child: Icon(Icons.delete),
      //             ),
      //             onTap: () {
      //               // 删除的操作
      //               context
      //                   .read<HMLoveImageViewModel>()
      //                   .delete(e["id"].toString());
      //             },
      //           ),
      //         ],
      //       ),
      //     )
      //     .toList();
    }
    return widgets;
  }

  // 加载数据
  void loadData() async {
    context.read<HMLoveImageViewModel>().loadData();
  }

  // 进行选择照片 - 还是拍照
  void _getImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("拍照"),
              trailing: Icon(Icons.camera_alt),
              onTap: _camera,
            ),
            ListTile(
              title: Text("选择图片"),
              trailing: Icon(Icons.image),
              onTap: _selectImage,
            ),
            ListTile(
              title: Text("取消"),
              trailing: Icon(Icons.cancel),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        );
      },
    );
  }

  // 进行拍照
  void _camera() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      uploadFile(pickedFile.path);
    }
  }

  // 选择照片
  void _selectImage() async {
    // 选择照片
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadFile(pickedFile.path);
    }
  }

  // 上传图片
  void uploadFile(String path) async {
    Navigator.pop(context);
    print('object ==================');

    EasyLoading.show(status: '正在上传中...');

    File file = File(path);
    // 进行压缩图片的操作
    CompressObject compressObject = CompressObject(
      imageFile: file, //image
      path: file.path.substring(
        0,
        file.path.lastIndexOf("/"),
      ), //compress to path
    );

    // 进行压缩
    Luban.compressImage(compressObject).then(
      (_path) async {
        String filename = _path.substring(_path.lastIndexOf("/") + 1);
        dynamic da = FormData.fromMap(
          {
            'file': await MultipartFile.fromFile(
              _path,
              filename: filename,
            ),
          },
        );
        context.read<HMLoveImageViewModel>().updateImage(da);
      },
    );
  }
}

//PhotoPreview 点击小图后的效果
class PhotoPreview extends StatefulWidget {
  final int initialIndex;
  final List<String> photoList;
  final PageController pageController;

  PhotoPreview({this.initialIndex, this.photoList})
      : pageController = PageController(initialPage: initialIndex);

  @override
  _PhotoPreviewState createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  //图片切换
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
        itemCount: widget.photoList.length,
        pageController: widget.pageController,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(widget.photoList[index]),
            minScale: PhotoViewComputedScale.contained * 0.6,
            maxScale: PhotoViewComputedScale.covered * 1.1,
            initialScale: PhotoViewComputedScale.contained,
          );
        },
      ),
    );
  }
}
