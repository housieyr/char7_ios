import 'drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItems {
  static const home =
      DrawerItem(title: 'الصفحة الــرئسيــة', icon: Icons.home_sharp);
  static const coin = DrawerItem(
      title: 'دور الــــعـجـلـــــة', icon: Icons.confirmation_number);
  static const about =
      DrawerItem(title: 'حول التـطـبيــق', icon: Icons.announcement);
  static const rate =
      DrawerItem(title: 'تقييم التطبيق', icon: Icons.star_rate_sharp);
  static const app =
      DrawerItem(title: 'تطبيقاتي', icon: Icons.phone_android_outlined);
  static const exit = DrawerItem(title: 'الخروج', icon: Icons.exit_to_app);
  static final List<DrawerItem> all = [
    home,
    coin,
    about,
    rate,
    app,
    exit,
  ];
}
