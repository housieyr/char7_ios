import 'package:flutter/material.dart';
import 'package:open_store/open_store.dart';
import 'package:char7nass/drawer_menu_widhet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RatePage extends StatelessWidget {
  final VoidCallback openDrawer;

  const RatePage({
    super.key,
    required this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: DrawerMenuWidget(onClicked: openDrawer, str: 'تقييم التطبيق'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: const Text(
                    'بلاهي تعملو مزية تحطو اكا 5 نجو★م  في البلاي ستور',
                    style: TextStyle(height: 2, fontSize: 25, wordSpacing: 10),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center),
              ),
              Ink.image(
                image: const AssetImage('assets/images/aa.png'),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.width / 1.8,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    OpenStore.instance.open(
                      androidAppBundleId:
                          'com.housie.char7nass', // Android app bundle package name
                    );
                  },
                  child: Text(
                    'باهي بركا متبكيش',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ))
            ],
          ),
        ));
  }
}

// AppBar
