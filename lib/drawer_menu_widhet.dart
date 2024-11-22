import 'controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String str;

  const DrawerMenuWidget({
    super.key,
    required this.onClicked,
    required this.str,

    // required
  });

  @override
  Widget build(BuildContext context) {
    var row = buildRow(str);
    return row;
  }

  Row buildRow(String str) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (str == 'الصفحة الرئيسية')
          InkWell(
              onTap: () {
                Get.put(MainController()).stateupdate();
              },
              child: GetBuilder<BadgeController>(
                  init: BadgeController(),
                  builder: (controllers) {
                    int spins = box.read('spins');
                    int spinday = box.read('spinday');
                    return badges.Badge(
                      badgeAnimation: const badges.BadgeAnimation.fade(
                        animationDuration: Duration(seconds: 1),
                        disappearanceFadeAnimationDuration:
                            Duration(seconds: 1),
                        loopAnimation: true,
                      ),
                      position: badges.BadgePosition.topEnd(top: -6, end: -4),
                      showBadge: (spins + spinday) > 0,
                      ignorePointer: true,
                      badgeContent: Text(
                        (spins + spinday).toString(),
                        style: TextStyle(
                            fontSize: 1.h,
                            color: (spins + spinday) > 0
                                ? Colors.white
                                : Colors.transparent),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        badgeColor: (spins + spinday) > 0
                            ? Colors.red
                            : Colors.transparent,
                        elevation: 0,
                      ),
                      child: Image.asset('assets/images/spiner_icon.png',
                          width: 8.w),
                    );
                  })),
        const Spacer(),
        Text(str,
            style: TextStyle(
                color: Colors.white,
                fontSize: 2.3.h,
                wordSpacing: 5.w,
                letterSpacing: 0.2.w)),
        IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: onClicked,
            alignment: Alignment.centerRight),
      ],
    );
  }
}
