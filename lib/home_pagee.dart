import 'package:get/get.dart';
import 'drawer_menu_widhet.dart';
import 'package:flutter/material.dart';
import 'package:char7nass/setyeme.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomePagee extends StatelessWidget {
  final VoidCallback openDrawer;

  const HomePagee({
    super.key,
    required this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.lightBlue,
        title: DrawerMenuWidget(
          onClicked: openDrawer,
          str: 'الصفحة الرئيسية',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.w),
        children: [
          info("سابعة أساسي", 7, 0, 'assets/images/setyeme_logo/seven.png',
              context),
          info("ثامنة أساسي", 8, 1, 'assets/images/setyeme_logo/eight.png',
              context),
          info("تاسعة أساسي", 9, 2, 'assets/images/setyeme_logo/nine.png',
              context),
          info("أولى ثانوي", 1, 3, 'assets/images/setyeme_logo/premier.png',
              context),
          info("ثانية ثانوي", 2, 4, 'assets/images/setyeme_logo/deuzieme.png',
              context),
          info("ثالثة ثانوي", 3, 5, 'assets/images/setyeme_logo/troizieme.png',
              context),
          info("باكالوريا", 4, 6, 'assets/images/setyeme_logo/bac.png', context)
        ],
      ), // Ap*pBar*/
    );
  }

  Widget info(String title, int x, int y, String logo, BuildContext context) {
    return BouncingWidget(
      stayOnBottom: false,
      scaleFactor: 0.5,
      onPressed: () {
        Get.to(() => Setyeme(
              niveau: x,
              indice: y,
              title: title,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5.h),
        height: 8.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            boxShadow: const [
              BoxShadow(
                offset: Offset(5.0, 10.0),
                color: Colors.black,
                blurRadius: 20.0,
              )
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                  height: double.maxFinite,
                  margin: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.black,
                          Colors.lightBlueAccent,
                        ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(180),
                      bottomLeft: Radius.circular(180),
                      bottomRight: Radius.circular(320),
                    ),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'NotoNastaliqUrdu',
                        wordSpacing: 2.w,
                        height: 0.24.h,
                        letterSpacing: 0.2.w,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Image.asset(
                    logo,
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
