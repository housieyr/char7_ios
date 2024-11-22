import 'dart:io';
import 'dart:convert';
import 'home_pagee.dart';
import 'drawer_items.dart';
import 'drawer_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:char7nass/coin.dart';
import 'package:char7nass/rate.dart';
import 'package:char7nass/about.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:http/http.dart' as http;
import 'package:char7nass/ad_helper.dart';
import 'package:char7nass/controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  bool isDragging = false;

  final Upgrader upgrader = Upgrader(
    durationUntilAlertAgain: const Duration(days: 1),
  );
  late AppOpenAd? _appOpenAd;
  bool isAdAvailable = false;
  bool _isShowingAd = false;

  loadAd() {
    _appOpenAd = null;
    isAdAvailable = false;
    AppOpenAd.load(
      adUnitId: AdHelper.openAdUnitId,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          isAdAvailable = true;
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          // Handle the error.
        },
      ),
      request: const AdRequest(),
    );
  }

  loadSpinCount() async {
    String lastUpdated = '';

    lastUpdated = box.read('lastUpdated') ?? '';

    // Get the current date as a string
    String currentDate = await getCurrentDateFromAPI();

    // Compare dates
    if (lastUpdated != currentDate) {
      lastUpdated = currentDate;

      // Save the updated spin count and date
      box.write('spinday', 1);

      Get.put(BadgeController()).update();
      box.write('lastUpdated', lastUpdated);
    }
  }

  Future<String> getCurrentDateFromAPI() async {
    try {
      final response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/Africa/Tunis'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        String localDatetime = jsonResponse['datetime'];
        // Extract and format the date
        String dateOnly = localDatetime.split('T')[0];

        return dateOnly;
      } else {
        throw Exception('Failed to load date from API');
      }
    } catch (e) {
      // Fallback to local date if API fails
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      loadAd();
      return;
    }
    if (_isShowingAd) {
      return;
    }

    _appOpenAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        _appOpenAd = null;
        ad.dispose();
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        _appOpenAd = null;
        ad.dispose();
        loadAd();
      },
    );

    _appOpenAd?.show();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    FlutterNativeSplash.remove();
    if (!box.hasData('coin')) {
      box.write('coin', 30);
    }
    if (!box.hasData('theme')) {
      box.write('theme', false);
    }
    if (!box.hasData('spins')) {
      box.write('spins', 1);
    }

    if (!box.hasData('spinday')) {
      box.write('spinday', 1);
    }
    loadSpinCount();
    AppOpenAd.load(
      adUnitId: AdHelper.openAdUnitId,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          isAdAvailable = true;
          _appOpenAd = ad;
          showAdIfAvailable();
        },
        onAdFailedToLoad: (error) {
          // Handle the error.
        },
      ),
      request: const AdRequest(),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _appOpenAd?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && isAdAvailable) {
      showAdIfAvailable();
    }
  }

  void closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    isDrawerOpen = false;
    main.update();
  }

  void openDrawer() {
    xOffset = -40;
    yOffset = 130;
    scaleFactor = 0.6;
    isDrawerOpen = true;
    main.update();
  }

  final MainController main = Get.put(MainController());
  DateTime? lastPressedAt;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        DateTime now = DateTime.now();
        if (lastPressedAt == null ||
            now.difference(lastPressedAt!) > const Duration(seconds: 2)) {
          lastPressedAt = now;
        } else {
          AwesomeDialog(
            dismissOnTouchOutside: true,
            dismissOnBackKeyPress: true,
            titleTextStyle:
                TextStyle(fontSize: 100.w / 15, fontWeight: FontWeight.bold),
            descTextStyle:
                TextStyle(fontSize: 100.w / 18, fontWeight: FontWeight.bold),
            buttonsTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 100.w / 20,
                fontWeight: FontWeight.bold),
            context: context,
            customHeader: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/sad2.png',
                fit: BoxFit.fill,
              ),
            ),
            title: 'ظاهر فيك تحب تخرج',
            desc: 'آك راكش لينا',
            btnOkText: 'تي سيبني',
            btnOkOnPress: () {
              exit(0);
            },
          ).show();
        }
      },
      child: Scaffold(
        body: UpgradeAlert(
          shouldPopScope: () => true,
          showIgnore: false,
          barrierDismissible: true,
          dialogStyle: UpgradeDialogStyle.cupertino,
          upgrader: upgrader,
          child: GetBuilder<MainController>(
              init: MainController(),
              builder: (controllers) {
                return Stack(
                  children: [
                    buildDrawer(),
                    buildPage(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget buildDrawer() => SafeArea(
        child: Drawerwidget(
          onSelectedItem: (item) {
            main.selectedItem = item;
            main.update();
            if (item == DrawerItems.app) {
              launchUrl(
                Uri.parse(
                    "https://play.google.com/store/search?q=pub:housie&c=apps"),
                mode: LaunchMode.externalApplication,
              );
            }
            closeDrawer();
          },
        ),
      );

  Widget buildPage() {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (isDrawerOpen) {
          closeDrawer();
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragEnd: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;
          const delta = 1;
          if (details.delta.dx < delta) {
            openDrawer();
          } else if (details.delta.dx > delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: getDrawerPage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (main.selectedItem) {
      case DrawerItems.exit:
        exit(0);
      case DrawerItems.about:
        return Container(
          color: isDrawerOpen ? Colors.white12 : Colors.white,
          child: AboutPage(openDrawer: openDrawer),
        );
      case DrawerItems.rate:
        return Container(
          color: isDrawerOpen ? Colors.white12 : Colors.white,
          child: RatePage(openDrawer: openDrawer),
        );
      case DrawerItems.coin:
        return Container(
          color: isDrawerOpen ? Colors.white12 : Colors.white,
          child: CoinPage(openDrawer: openDrawer),
        );
      case DrawerItems.home:
      default:
        return Container(
          color: isDrawerOpen ? Colors.white12 : Colors.blue.shade50,
          child: HomePagee(openDrawer: openDrawer),
        );
    }
  }
}
