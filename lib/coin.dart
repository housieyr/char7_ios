import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';
import 'package:char7nass/controller.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:badges/badges.dart' as badges;
import 'package:char7nass/drawer_menu_widhet.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class MyRoulette extends StatelessWidget {
  const MyRoulette({
    super.key,
    required this.controller,
  });

  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.all(6.w),
          width: 90.w,
          child: Roulette(
            // Provide controller to update its state
            controller: controller,
            // Configure roulette's appearance
            style: const RouletteStyle(
              dividerThickness: 0.0,
              dividerColor: Colors.black,
              centerStickSizePercent: 0.05,
              centerStickerColor: Colors.black,
            ),
          ),
        ),
        Image.asset(
          'assets/images/wheel.png',
          width: 90.w,
        ),
      ],
    );
  }
}

class CoinPage2 extends StatefulWidget {
  const CoinPage2({
    super.key,
  });

  @override
  State<CoinPage2> createState() => CoinPage2State();
}

class CoinPage2State extends State<CoinPage2>
    with SingleTickerProviderStateMixin {
  late RouletteController _controller;

  final colors = <Color>[
    Colors.red.withAlpha(150),
    Colors.amber.withAlpha(150),
    Colors.indigo.withAlpha(170),
    Colors.green.withAlpha(130),
    Colors.blue.withAlpha(170),
  ];
  final values = <String>['المرة الجايا', '20', '40', '60', 'تدويرتين'];

  int spins = 0;
  int spinday = 0;
  @override
  void initState() {
    super.initState();
    controller.coin = box.read('coin') ?? 0;

    final group = RouletteGroup.uniform(
      values.length,
      colorBuilder: (index) => colors[index],
      textBuilder: (index) => values[index],
    );

// Create controller
    _controller = RouletteController(group: group, vsync: this);
  }

  final NiveauController controller = Get.put(NiveauController());
  final UpdateController update = Get.put(UpdateController());
  bool isRotate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'نقطة',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GetBuilder<UpdateController>(
                    init: UpdateController(),
                    builder: (controllers) {
                      return AnimatedFlipCounter(
                        curve: Curves.bounceOut,
                        duration: const Duration(seconds: 3),
                        textStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        value: controller.coin,
                        fractionDigits: 0,
                        hideLeadingZeroes: false,
                        thousandSeparator: '',
                      );
                    }),
              ],
            ),
            const Spacer(),
            MyRoulette(controller: _controller),
            const Spacer(),
            GetBuilder<UpdateController>(
                init: UpdateController(),
                builder: (controller2) {
                  spins = box.read('spins');
                  spinday = box.read('spinday');
                  return badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.fade(
                      animationDuration: Duration(seconds: 1),
                      disappearanceFadeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: true,
                    ),
                    position: badges.BadgePosition.topEnd(top: -6, end: -4),
                    showBadge: (spins + spinday) > 0,
                    ignorePointer: true,
                    badgeContent: Text(
                      (spins + spinday).toString(),
                      style: TextStyle(
                          fontSize: 13.sp,
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (spins + spinday) > 0
                            ? Colors.blue
                            : Colors.blue.shade100, // Background color
                        // Text color
                        shadowColor: Colors.black, // Shadow color
                        elevation: 5, // Elevation
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.5.h), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      // Use the controller to run the animation with rollTo method
                      onPressed: () {
                        if ((spins + spinday) > 0 && !isRotate) {
                          isRotate = true;

                          if (spins == 0) {
                            spinday = 0;
                            box.write('spinday', spinday);
                          } else {
                            spins--;
                            box.write('spins', spins);
                          }

                          controller2.update();
                          final random = Random();

                          int count = random.nextInt(5);

                          if (count == 4) {
                            // Re-roll with a certain probability
                            double rerollChance =
                                0.8; // 70% chance to reroll if the count is 4
                            if (random.nextDouble() < rerollChance) {
                              count =
                                  random.nextInt(4); // Re-roll between 0 and 3
                            }
                          }
                          if (count == 3) {
                            // Re-roll with a certain probability
                            double rerollChance =
                                0.7; // 70% chance to reroll if the count is 4
                            if (random.nextDouble() < rerollChance) {
                              count =
                                  random.nextInt(3); // Re-roll between 0 and 3
                            }
                          }
                          if (count == 2) {
                            // Re-roll with a certain probability
                            double rerollChance =
                                0.6; // 70% chance to reroll if the count is 4
                            if (random.nextDouble() < rerollChance) {
                              count =
                                  random.nextInt(2); // Re-roll between 0 and 3
                            }
                          }
                          FlameAudio.play('roli.mp3', volume: 0.3);
                          _controller.rollTo(
                            count,
                            offset: Random().nextDouble(),
                          );
                          Future.delayed(const Duration(seconds: 5), () {
                            if (count != 4 && count != 0) {
                              controller.coin += int.parse(values[count]);
                              box.write('coin', controller.coin);
                            } else if (count == 4 && count != 0) {
                              spins += 2;
                              box.write('spins', spins);
                            }
                            update.update();
                            Get.put(BadgeController()).update();
                            isRotate = false;
                          });
                        } else if ((spins + spinday) <= 0 && !isRotate) {
                          cnn(context);
                        }
                      },
                      child: const Text(
                        'دور العجلة',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void cnn(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    AwesomeDialog(
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      titleTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      descTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      buttonsTextStyle:
          TextStyle(fontSize: ww / 20, fontWeight: FontWeight.bold),
      context: context,
      customHeader: Padding(
        padding: EdgeInsets.all(1.5.w),
        child: Image.asset(
          'assets/images/spiner.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'معادش عندك تدويرات كان تحب اتفرج في فيديو و خوذ تدويرة',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
        ),
      ),
      btnCancel: InkWell(
        onTap: (() {
          Get.back();
        }),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: Center(
              child: Text(
                'لا معينيش',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
      btnOk: InkWell(
        onTap: (() {
          Get.back();
          controller.showRewardAds(ww, context, 2);
        }),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: Center(
              child: Text(
                'هات بركا',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
    ).show();
  }
}

class CoinPage extends StatefulWidget {
  final VoidCallback openDrawer;
  const CoinPage({
    super.key,
    required this.openDrawer,
  });

  @override
  State<CoinPage> createState() => CoinPageState();
}

class CoinPageState extends State<CoinPage>
    with SingleTickerProviderStateMixin {
  late RouletteController _controller;

  final colors = <Color>[
    Colors.red.withAlpha(150),
    Colors.amber.withAlpha(150),
    Colors.indigo.withAlpha(170),
    Colors.green.withAlpha(130),
    Colors.blue.withAlpha(170),
  ];
  final values = <String>['المرة الجايا', '20', '40', '60', 'تدويرتين'];

  int spins = 0;
  int spinday = 0;
  @override
  void initState() {
    super.initState();
    controller.coin = box.read('coin') ?? 0;

// Build uniformed group
    final group = RouletteGroup.uniform(
      values.length,
      colorBuilder: (index) => colors[index],
      textBuilder: (index) => values[index],
    );

// Create controller
    _controller = RouletteController(group: group, vsync: this);
  }

  final NiveauController controller = Get.put(NiveauController());
  final UpdateController update = Get.put(UpdateController());
  bool isRotate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:
            DrawerMenuWidget(onClicked: widget.openDrawer, str: 'دور العجلة'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'نقطة',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GetBuilder<UpdateController>(
                    init: UpdateController(),
                    builder: (controllers) {
                      return AnimatedFlipCounter(
                        curve: Curves.bounceOut,
                        duration: const Duration(seconds: 3),
                        textStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        value: controller.coin,
                        fractionDigits: 0,
                        hideLeadingZeroes: false,
                        thousandSeparator: '',
                      );
                    }),
              ],
            ),
            const Spacer(),
            MyRoulette(controller: _controller),
            const Spacer(),
            GetBuilder<UpdateController>(
                init: UpdateController(),
                builder: (controller2) {
                  spins = box.read('spins');
                  spinday = box.read('spinday');
                  return badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.fade(
                      animationDuration: Duration(seconds: 1),
                      disappearanceFadeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: true,
                    ),
                    position: badges.BadgePosition.topEnd(top: -6, end: -4),
                    showBadge: (spins + spinday) > 0,
                    ignorePointer: true,
                    badgeContent: Text(
                      (spins + spinday).toString(),
                      style: TextStyle(
                          fontSize: 13.sp,
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (spins + spinday) > 0
                            ? Colors.blue
                            : Colors.blue.shade100, // Background color
                        // Text color
                        shadowColor: Colors.black, // Shadow color
                        elevation: 5, // Elevation
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.5.h), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      // Use the controller to run the animation with rollTo method
                      onPressed: () {
                        if ((spins + spinday) > 0 && !isRotate) {
                          isRotate = true;

                          if (spins == 0) {
                            spinday = 0;
                            box.write('spinday', spinday);
                          } else {
                            spins--;
                            box.write('spins', spins);
                          }

                          controller2.update();
                          final random = Random();

                          int count = random.nextInt(5);

                          if (count == 4) {
                            // Re-roll with a certain probability
                            double rerollChance =
                                0.8; // 70% chance to reroll if the count is 4
                            if (random.nextDouble() < rerollChance) {
                              count =
                                  random.nextInt(4); // Re-roll between 0 and 3
                            }
                          }
                          if (count == 3) {
                            // Re-roll with a certain probability
                            double rerollChance =
                                0.7; // 70% chance to reroll if the count is 4
                            if (random.nextDouble() < rerollChance) {
                              count =
                                  random.nextInt(3); // Re-roll between 0 and 3
                            }
                          }
                          if (count == 2) {
                            // Re-roll with a certain probability
                            double rerollChance =
                                0.6; // 70% chance to reroll if the count is 4
                            if (random.nextDouble() < rerollChance) {
                              count =
                                  random.nextInt(2); // Re-roll between 0 and 3
                            }
                          }
                          FlameAudio.play('roli.mp3', volume: 0.3);
                          _controller.rollTo(
                            count,
                            offset: Random().nextDouble(),
                          );
                          Future.delayed(const Duration(seconds: 5), () {
                            if (count != 4 && count != 0) {
                              controller.coin += int.parse(values[count]);
                              box.write('coin', controller.coin);
                            } else if (count == 4 && count != 0) {
                              spins += 2;
                              box.write('spins', spins);
                            }
                            update.update();
                            Get.put(BadgeController()).update();
                            isRotate = false;
                          });
                        } else if ((spins + spinday) <= 0 && !isRotate) {
                          cnn(context);
                        }
                      },
                      child: const Text(
                        'دور العجلة',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void cnn(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    AwesomeDialog(
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      titleTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      descTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      buttonsTextStyle:
          TextStyle(fontSize: ww / 20, fontWeight: FontWeight.bold),
      context: context,
      customHeader: Padding(
        padding: EdgeInsets.all(1.5.w),
        child: Image.asset(
          'assets/images/spiner.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'معادش عندك تدويرات كان تحب اتفرج في فيديو و خوذ تدويرة',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
        ),
      ),
      btnCancel: InkWell(
        onTap: (() {
          Get.back();
        }),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: Center(
              child: Text(
                'لا معينيش',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
      btnOk: InkWell(
        onTap: (() {
          Get.back();
          controller.showRewardAds(ww, context, 2);
        }),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: Center(
              child: Text(
                'هات بركا',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
    ).show();
  }
}
