import 'package:flutter/material.dart';
import 'package:hm_demo/Global/global_theme.dart';
import 'package:hm_demo/Routes/routes.dart';
import 'package:hm_demo/ViewModel/main/settingTheme_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingThemeView extends StatefulWidget {
  const SettingThemeView({Key key}) : super(key: key);

  @override
  _SettingThemeViewState createState() => _SettingThemeViewState();
}

class _SettingThemeViewState extends State<SettingThemeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('设置主题'),
      body: Container(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: themes.length,
          shrinkWrap: true,
        ),
      ),
    );
  }

// 创建 item - Cell
  Widget _itemBuilder(BuildContext context, int index) {
    int curIndex = Provider.of<SettingThemeViewModel>(context).getColor;
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            color: themes[index],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: curIndex == index
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12.w,
                    )
                  ],
                )
              : null,
        ),
        onTap: () async {
          var prefers = await SharedPreferences.getInstance();
          prefers.setInt(kSharedPreferencesThemeColor, index);
          context.read<SettingThemeViewModel>().setColor(index);
        },
      ),
    );
  }
}
