import 'dart:async';
import 'notes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_store/open_store.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:adblock_detector/adblock_detector.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoadingScreen extends StatefulWidget {
  final String text;
  final String niveau;
  final InterstitialAd? ads;

  const LoadingScreen({
    Key? key,
    required this.text,
    required this.niveau,
    required this.ads,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late dynamic timer;

  bool check = false;
  late int _isConnect;
  Future<void> fetchAlbum() async {
    try {
      var url = Uri.parse('https://www.google.com/');
      var response = await http.get(url).timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        _isConnect = 2;
      }
    } on TimeoutException {
      _isConnect = 1;
    } catch (e) {
      _isConnect = 0;
    }
  }

  String version = '';
  Future<void> getVersion() async {}

  @override
  void initState() {
    super.initState();

    _isConnect = 2;
    check = false;

    dynamic onwen,
        ta9dim,
        mawdho3,
        mawdho31,
        mawdho32,
        mawdho33,
        mi3yar,
        part1,
        part2,
        part3,
        part4,
        part5,
        part6,
        mo3jem1,
        mo3jem2,
        mo3jem3,
        mo3jem4,
        mo3jem5,
        rep1,
        rep2,
        rep3,
        rep4,
        rep5,
        rep6,
        rep7,
        rep8,
        rep9,
        estethmar,
        linatafhm,
        linofaker;

    DatabaseReference db =
        FirebaseDatabase.instance.ref("bandito").child("Nokiass").child("vasi");
    db
        .child(widget.niveau)
        .child(widget.text)
        .once()
        .then((DatabaseEvent event) {
      final data = event.snapshot;
      if (data.exists) {
        check = true;
      }
      if (data.child("onwen").exists) {
        onwen = data.child("onwen").value;
      } else {
        onwen = " ";
      }

      if (data.child("ta9dim").exists) {
        ta9dim = data.child("ta9dim").value;
      } else {
        ta9dim = " ";
      }

      if (data.child("mawdho3").exists) {
        mawdho3 = data.child("mawdho3").value;
      } else {
        mawdho3 = " ";
      }
      if (data.child("mawdho31").exists) {
        mawdho31 = data.child("mawdho31").value;
      } else {
        mawdho31 = " ";
      }
      if (data.child("mawdho32").exists) {
        mawdho32 = data.child("mawdho32").value;
      } else {
        mawdho32 = " ";
      }
      if (data.child("mawdho33").exists) {
        mawdho33 = data.child("mawdho33").value;
      } else {
        mawdho33 = " ";
      }

      if (data.child("mi3yar").exists) {
        mi3yar = data.child("mi3yar").value;
      } else {
        mi3yar = " ";
      }

      if (data.child("part1").exists) {
        part1 = data.child("part1").value;
      } else {
        part1 = " ";
      }

      if (data.child("part2").exists) {
        part2 = data.child("part2").value;
      } else {
        part2 = " ";
      }

      if (data.child("part3").exists) {
        part3 = data.child("part3").value;
      } else {
        part3 = " ";
      }

      if (data.child("part4").exists) {
        part4 = data.child("part4").value;
      } else {
        part4 = " ";
      }

      if (data.child("part5").exists) {
        part5 = data.child("part5").value;
      } else {
        part5 = " ";
      }
      if (data.child("part6").exists) {
        part6 = data.child("part6").value;
      } else {
        part6 = " ";
      }
      if (data.child("mo3jem1").exists) {
        mo3jem1 = data.child("mo3jem1").value;
      } else {
        mo3jem1 = " ";
      }

      if (data.child("mo3jem2").exists) {
        mo3jem2 = data.child("mo3jem2").value;
      } else {
        mo3jem2 = " ";
      }

      if (data.child("mo3jem3").exists) {
        mo3jem3 = data.child("mo3jem3").value;
      } else {
        mo3jem3 = " ";
      }

      if (data.child("mo3jem4").exists) {
        mo3jem4 = data.child("mo3jem4").value;
      } else {
        mo3jem4 = " ";
      }

      if (data.child("mo3jem5").exists) {
        mo3jem5 = data.child("mo3jem5").value;
      } else {
        mo3jem5 = " ";
      }

      if (data.child("rep1").exists) {
        rep1 = data.child("rep1").value;
      } else {
        rep1 = " ";
      }

      if (data.child("rep2").exists) {
        rep2 = data.child("rep2").value;
      } else {
        rep2 = " ";
      }

      if (data.child("rep3").exists) {
        rep3 = data.child("rep3").value;
      } else {
        rep3 = " ";
      }
      if (data.child("rep4").exists) {
        rep4 = data.child("rep4").value;
      } else {
        rep4 = " ";
      }
      if (data.child("rep5").exists) {
        rep5 = data.child("rep5").value;
      } else {
        rep5 = " ";
      }
      if (data.child("rep6").exists) {
        rep6 = data.child("rep6").value;
      } else {
        rep6 = " ";
      }
      if (data.child("rep7").exists) {
        rep7 = data.child("rep7").value;
      } else {
        rep7 = " ";
      }
      if (data.child("rep8").exists) {
        rep8 = data.child("rep8").value;
      } else {
        rep8 = " ";
      }
      if (data.child("rep9").exists) {
        rep9 = data.child("rep9").value;
      } else {
        rep9 = " ";
      }
      if (data.child("estethmar").exists) {
        estethmar = data.child("estethmar").value;
      } else {
        estethmar = " ";
      }
      if (data.child("linatafhm").exists) {
        linatafhm = data.child("linatafhm").value;
      } else {
        linatafhm = " ";
      }
      if (data.child("linofaker").exists) {
        linofaker = data.child("linofaker").value;
      } else {
        linofaker = " ";
      }
    });

    timer = Timer(const Duration(seconds: 1), () {
      (widget.ads)?.show();
      timer = Timer(const Duration(seconds: 3), () async {
        fetchAlbum();
        if (check == true) {
          AdBlockDetector adBlockDetector = AdBlockDetector();

          bool isAdblocking = await adBlockDetector
              .isAdBlockEnabled(testAdNetworks: [AdNetworks.googleAdMob]);

          DataSnapshot snapshot = await db.child('version').get();

          final PackageInfo packageInfo = await PackageInfo.fromPlatform();

          int versionlocal = int.parse(packageInfo.version.split('.').join(''));
          int versionFirebase =
              int.parse(snapshot.value.toString().split('.').join(''));

          if (versionFirebase > versionlocal && mounted) {
            update(context);
          } else {
            if (mounted) {
              if (!isAdblocking) {
                Get.off(
                  () => NotesPage(
                    text: widget.text,
                    level: widget.niveau,
                    onwen: onwen,
                    ta9dim: ta9dim,
                    mawdho3: mawdho3,
                    mawdho31: mawdho31,
                    mawdho32: mawdho32,
                    mawdho33: mawdho33,
                    mi3yar: mi3yar,
                    part1: part1,
                    part2: part2,
                    part3: part3,
                    part4: part4,
                    part5: part5,
                    part6: part6,
                    mo3jem1: mo3jem1,
                    mo3jem2: mo3jem2,
                    mo3jem3: mo3jem3,
                    mo3jem4: mo3jem4,
                    mo3jem5: mo3jem5,
                    rep1: rep1,
                    rep2: rep2,
                    rep3: rep3,
                    rep4: rep4,
                    rep5: rep5,
                    rep6: rep6,
                    rep7: rep7,
                    rep8: rep8,
                    rep9: rep9,
                    estethmar: estethmar,
                    linatafhm: linatafhm,
                    linofaker: linofaker,
                  ),
                );
              } else {
                _connection(
                    context,
                    'علاش تستعمل في مانع الإعلانات',
                    ' ',
                    'لزيد هوما يخلصو فيا شويا خاطرني تونسي و تزيد انت تقطع علي جملا بلاهي سكرو',
                    'باهي سخفتني',
                    true,
                    'sad');
              }
            }
          }
        } else {
          timer = Timer(const Duration(seconds: 4), () {
            if (_isConnect == 0) {
              _connection(context, 'ماو حل الإنترنات باش يهبط النص', 'ヅ', '',
                  'باهي بركا', false, 'wifi');
            } else if (_isConnect == 1) {
              _connection(context, 'يظهرلي cnx متعك تاعبة',
                  'برى شوف شكون يبرتاجيلك', '', 'باهي تو نتصرف', false, 'wifi');
            } else {
              _server(context);
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.purpleAccent,
          size: 50,
          duration: Duration(milliseconds: 700),
        ),
      ),
    );
  }

  void _server(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    AwesomeDialog(
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      titleTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      descTextStyle: TextStyle(fontSize: ww / 18, fontWeight: FontWeight.bold),
      buttonsTextStyle: TextStyle(
        fontSize: ww / 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      context: context,
      customHeader: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          'assets/images/server.png',
          fit: BoxFit.fill,
        ),
      ),
      title: 'ثمة برشا ضغط على السرفر',
      desc: 'إستنى شويا و عاود أدخل',
      btnOkText: 'باهي',
      btnOkOnPress: () {
        Get.back();
      },
    ).show();
  }

  void update(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    AwesomeDialog(
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      titleTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      descTextStyle: TextStyle(fontSize: ww / 18, fontWeight: FontWeight.bold),
      buttonsTextStyle: TextStyle(
          fontSize: ww / 20, fontWeight: FontWeight.bold, color: Colors.white),
      context: context,
      customHeader: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          'assets/images/update.png',
          fit: BoxFit.fill,
        ),
      ),
      title: 'تي برا امشي اعمل',
      desc: 'El mise a jour el jdid',
      btnOkText: 'هات خنشوفو الجديد',
      btnOkOnPress: () {
        Get.back();
        OpenStore.instance.open(
          androidAppBundleId:
              'com.housie.char7nass', // Android app bundle package name
        );
      },
    ).show();
  }

  void _connection(BuildContext context, String a, String b, String d, String c,
      bool check, String image) {
    double ww = MediaQuery.of(context).size.width;
    AwesomeDialog(
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      titleTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      descTextStyle: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      buttonsTextStyle: TextStyle(
          fontSize: ww / 20, fontWeight: FontWeight.bold, color: Colors.white),
      context: context,
      customHeader: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          'assets/images/$image.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              a,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
            ),
          ),
          if (!check)
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                b,
                textDirection: TextDirection.rtl,
                style:
                    TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
              ),
            ),
          if (check)
            Text(
              d,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 5.w, fontWeight: FontWeight.bold),
            ),
        ]),
      ),
      btnOkText: c,
      btnOkOnPress: () {
        Get.back();
      },
    ).show();
  }
}
