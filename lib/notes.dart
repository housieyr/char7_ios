import 'dart:async';
import 'package:get/get.dart';
import 'package:char7nass/coin.dart';
import 'package:char7nass/ad_helper.dart';
import 'package:char7nass/controller.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NotesPage extends StatefulWidget {
  final String text;
  final String level;
  final String onwen,
      ta9dim,
      mawdho3,
      mawdho31,
      mawdho32,
      mawdho33,
      mawdho34,
      mawdho35,
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
      linofaker,
      esta3ed,
      ata7awer,
      ontej,
      astafid,
      estethmarWowadhef,
      obdi,
      tawase3;
  const NotesPage(
      {super.key,
      required this.text,
      required this.level,
      required this.onwen,
      required this.ta9dim,
      required this.mawdho3,
      required this.mawdho31,
      required this.mawdho32,
      required this.mawdho33,
      required this.mawdho34,
      required this.mawdho35,
      required this.mi3yar,
      required this.part1,
      required this.part2,
      required this.part3,
      required this.part4,
      required this.part5,
      required this.part6,
      required this.mo3jem1,
      required this.mo3jem2,
      required this.mo3jem3,
      required this.mo3jem4,
      required this.mo3jem5,
      required this.rep1,
      required this.rep2,
      required this.rep3,
      required this.rep4,
      required this.rep5,
      required this.rep6,
      required this.rep7,
      required this.rep8,
      required this.rep9,
      required this.estethmar,
      required this.linatafhm,
      required this.linofaker,
      required this.esta3ed,
      required this.ata7awer,
      required this.ontej,
      required this.astafid,
      required this.estethmarWowadhef,
      required this.obdi,
      required this.tawase3});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

Future<void> secureScreen() async {
//  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

class _NotesPageState extends State<NotesPage> with WidgetsBindingObserver {
  late BannerAd _bannerAd;
  late bool testi = false;
  late bool testi2 = false;
  late bool testi3 = false;
  bool _isBannerAdReady = false;
  InterstitialAd? _interstitialAd;
  Timer? _timer;
  late bool _isInterstitialAdReady;
  void _createAd() {
    _isBannerAdReady = false;
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          _interstitialAd = null;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.mawdho31 != " ") {
      c++;
    }
    if (widget.mawdho32 != " ") {
      c++;
    }
    if (widget.mawdho33 != " ") {
      c++;
    }
    if (widget.mawdho34 != " ") {
      c++;
    }
    if (widget.mawdho35 != " ") {
      c++;
    }
    _createAd();
    _loadInterstitialAd();
    _timer = Timer.periodic(const Duration(minutes: 2), (timer) {
      // Perform your task here
      if (_isInterstitialAdReady && _interstitialAd != null) {
        _interstitialAd?.show();
        _isInterstitialAdReady = false;
        _interstitialAd = null;
        _loadInterstitialAd();
      }
    });
    secureScreen();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  int count = 1;
  int c = 1;
  bool show = false;
  final NiveauController controller = Get.put(NiveauController());
  @override
  Widget build(BuildContext context) {
   
    controller.coin = box.read('coin') ?? 0;
    testi = widget.rep1 == " " &&
        widget.rep2 == " " &&
        widget.rep3 == " " &&
        widget.rep4 == " " &&
        widget.rep5 == " " &&
        widget.rep6 == " " &&
        widget.rep7 == " " &&
        widget.rep8 == " " &&
        widget.rep9 == " ";
    testi2 = widget.mo3jem1 == " " &&
        widget.mo3jem2 == " " &&
        widget.mo3jem3 == " " &&
        widget.mo3jem4 == " " &&
        widget.mo3jem5 == " ";

    testi3 = widget.part1 == " " &&
        widget.part2 == " " &&
        widget.part3 == " " &&
        widget.part4 == " " &&
        widget.part5 == " " &&
        widget.part6 == " ";

    var color = Colors.blue;
    double tale = 100.w;

    double ww = 10;
    double bodyHeight = 100.h - (MediaQuery.of(context).padding.top + _bannerAd.size.height.toDouble()+0.5.h);

    if (_isBannerAdReady) {
      bodyHeight -= _bannerAd.size.height.toDouble();
    }

    return PopScope(
      canPop: !show,
      onPopInvokedWithResult: (didPop, result) {
        if (show) {
          show = false;
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: color.shade100,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      height: bodyHeight,
                      margin: EdgeInsets.all(ww),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: tale,
                                  height: 20.h,
                                  margin: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/aaf.png"),
                                          fit: BoxFit.fill)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        tale / 7, 0, tale / 7, 0),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        widget.onwen,
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: tale / 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    if (widget.ta9dim != " ")
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: ListTile(
                                          title: Text(
                                            "التقديم :",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: tale / 15,
                                                fontWeight: FontWeight.bold,
                                                color: color),
                                          ),
                                          subtitle: txt(widget.ta9dim),
                                        ),
                                      ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if ((box.hasData(
                                                      '${widget.text}mawdho3')
                                                  ? box.read(
                                                      '${widget.text}mawdho3')
                                                  : 1) <
                                              c)
                                            Expanded(
                                              child: Center(
                                                child: NeumorphicButton(
                                                    style: NeumorphicStyle(
                                                        boxShape:
                                                            const NeumorphicBoxShape
                                                                .stadium(),
                                                        border:
                                                            NeumorphicBorder(
                                                                color: Colors
                                                                    .white,
                                                                width: 0.5.w),
                                                        shadowDarkColor:
                                                            Colors.black,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 50, 247, 1)),
                                                    onPressed: () {
                                                      if (controller.coin >=
                                                          15) {
                                                        cnn(
                                                            context,
                                                            'كانك تحب موضوع آخر يتكلفلك 15 نقطة',
                                                            'mawdho3');
                                                      } else {
                                                        cnnCoin(context);
                                                      }
                                                    },
                                                    child: const Text(
                                                        'هات موضوع آخر')),
                                              ),
                                            ),
                                          if (widget.mawdho3 != " ")
                                            Text("الموضوع :",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize: tale / 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: color)),
                                        ],
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          mawdho3Txt(widget.mawdho3, 1),
                                          if ((box.hasData(
                                                      '${widget.text}mawdho3')
                                                  ? box.read(
                                                      '${widget.text}mawdho3')
                                                  : 1) >=
                                              2)
                                            mawdho3Txt(widget.mawdho31, 2),
                                          if ((box.hasData(
                                                      '${widget.text}mawdho3')
                                                  ? box.read(
                                                      '${widget.text}mawdho3')
                                                  : 1) >=
                                              3)
                                            mawdho3Txt(widget.mawdho32, 3),
                                          if ((box.hasData(
                                                      '${widget.text}mawdho3')
                                                  ? box.read(
                                                      '${widget.text}mawdho3')
                                                  : 1) >=
                                              4)
                                            mawdho3Txt(widget.mawdho33, 4),
                                          if ((box.hasData(
                                                      '${widget.text}mawdho3')
                                                  ? box.read(
                                                      '${widget.text}mawdho3')
                                                  : 1) >=
                                              5)
                                            mawdho3Txt(widget.mawdho34, 5),
                                          if ((box.hasData(
                                                      '${widget.text}mawdho3')
                                                  ? box.read(
                                                      '${widget.text}mawdho3')
                                                  : 1) >=
                                              6)
                                            mawdho3Txt(widget.mawdho35, 6),
                                        ],
                                      ),
                                    ),
                                    if (testi3 == false)
                                      ListTile(
                                        title: Text("المقاطع :",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: tale / 15,
                                                fontWeight: FontWeight.bold,
                                                color: color)),
                                      ),
                                    if (testi3 == false)
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 10),
                                        child: Row(
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Text("المعيار : ",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize: tale / 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: color)),
                                            at(widget.mi3yar),
                                          ],
                                        ),
                                      ),
                                    widd(widget.part1, 1),
                                    widd(widget.part2, 2),
                                    widd(widget.part3, 3),
                                    widd(widget.part4, 4),
                                    widd(widget.part5, 5),
                                    widd(widget.part6, 6),
                                    if (testi2 == false)
                                      Container(
                                          ///////////////////////////////////////////////////////////////////////////////////////
                                          width: double.infinity,
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            title: Text(
                                              "معجمي :",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: tale / 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: color),
                                            ),
                                          )),
                                    widd(widget.mo3jem1, 1),
                                    widd(widget.mo3jem2, 2),
                                    widd(widget.mo3jem3, 3),
                                    widd(widget.mo3jem4, 4),
                                    widd(widget.mo3jem5, 5),
                                    if (testi == false)
                                      Container(
                                          width: double.infinity,
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "الإجابة عن الأسئلة",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: tale / 12,
                                                fontWeight: FontWeight.bold,
                                                color: color),
                                          )),
                                    widd(widget.rep1, 1),
                                    widd(widget.rep2, 2),
                                    widd(widget.rep3, 3),
                                    widd(widget.rep4, 4),
                                    widd(widget.rep5, 5),
                                    widd(widget.rep6, 6),
                                    widd(widget.rep7, 7),
                                    widd(widget.rep8, 8),
                                    widd(widget.rep9, 9),
                                    newWid(
                                        widget.estethmar,
                                        "إستثمر",
                                        box.hasData('${widget.text}estethmar')
                                            ? box
                                                .read('${widget.text}estethmar')
                                            : 2,
                                        'estethmar'),
                                    newWid(widget.linatafhm, "لنتفهم معا", 1,
                                        'linatafhm'),
                                    newWid(
                                        widget.linofaker,
                                        "لنفكر معا",
                                        box.hasData('${widget.text}linofaker')
                                            ? box
                                                .read('${widget.text}linofaker')
                                            : 2,
                                        'linofaker'),
                                    newWid(
                                        widget.esta3ed,
                                        "أستعد للدرس",
                                        box.hasData('${widget.text}esta3ed')
                                            ? box.read('${widget.text}esta3ed')
                                            : 2,
                                        'esta3ed'),
                                    newWid(
                                        widget.ata7awer,
                                        "أتحاور مع أصدقائي",
                                        box.hasData('${widget.text}ata7awer')
                                            ? box.read('${widget.text}ata7awer')
                                            : 2,
                                        'ata7awer'),
                                    newWid(
                                        widget.ontej,
                                        "أنتج",
                                        box.hasData('${widget.text}ontej')
                                            ? box.read('${widget.text}ontej')
                                            : 2,
                                        'ontej'),
                                    newWid(
                                        widget.obdi,
                                        "أبدي رأيي",
                                        box.hasData('${widget.text}obdi')
                                            ? box.read('${widget.text}obdi')
                                            : 2,
                                        'obdi'),
                                    newWid(
                                        widget.estethmarWowadhef,
                                        "أستثمر و أوظف",
                                        box.hasData(
                                                '${widget.text}estethmarWowadhef')
                                            ? box.read(
                                                '${widget.text}estethmarWowadhef')
                                            : 2,
                                        'estethmarWowadhef'),
                                    newWid(
                                        widget.astafid,
                                        "أستفيد",
                                        box.hasData('${widget.text}astafid')
                                            ? box.read('${widget.text}astafid')
                                            : 2,
                                        'astafid'),
                                    newWid(
                                        widget.tawase3,
                                        "توسع",
                                        box.hasData('${widget.text}tawase3')
                                            ? box.read('${widget.text}tawase3')
                                            : 2,
                                        'tawase3'),
                                    SizedBox(
                                      height: 5.h,
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    if (_isBannerAdReady)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          width: _bannerAd.size.width.toDouble(),
                          height: _bannerAd.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd),
                        ),
                      ),
                  ],
                ),
              ),
              if (show) const CoinPage2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget mawdho3Txt(String s, int i) {
    if (s == " ") {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 1.h, 0, 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            at(s),
            // Adjust how the image should be fitted inside the box),

            Text("$i )  ",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue))
          ],
        ),
      );
    }
  }

  Widget txt(String ss) {
    return Text(
      '$ss.',
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 18.sp, color: Colors.black),
    );
  }

  Widget at(String ss) {
    return Expanded(
        child: Text(
      ss,
      style: TextStyle(fontSize: 18.sp, color: Colors.black),
      textDirection: TextDirection.rtl,
    ));
  }

  Widget widd(String s, int i) {
    if (s == " ") {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            at(s),
            // Adjust how the image should be fitted inside the box),

            Text("$i )  ",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue))
          ],
        ),
      );
    }
  }

  Widget newWid(String s, String onwen, int test, String save) {
    if (s == " ") {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 5.h, left: 3.w, right: 3.w),
        child: test==1?TextFormField(
          textDirection: TextDirection.rtl,
          maxLines: null,
          style: TextStyle(
            fontSize: 17.sp,
          ),
          initialValue: s,
          readOnly: true,
          decoration: InputDecoration(
            labelText: onwen,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            // Label text above the field
            labelStyle: TextStyle(
                fontSize: 11.w,
                fontWeight: FontWeight.bold,
                color: Colors.blue), // Customize label color if needed
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.blue, width: 1.0), // Border when enabled
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.blue, width: 2.0), // Border when focused
              borderRadius: BorderRadius.circular(8.0),
            ),
            // Optional: Add an icon or helper text inside the text field
            // Helper text under the field
          ),
        ):NeumorphicButton(
                                                    style: NeumorphicStyle(
                                                        boxShape:
                                                            const NeumorphicBoxShape
                                                                .stadium(),
                                                        border:
                                                            NeumorphicBorder(
                                                                color: Colors
                                                                    .white,
                                                                width: 0.5.w),
                                                        shadowDarkColor:
                                                            Colors.black,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 50, 247, 1)),
                                                    onPressed: () {
                                                      if (controller.coin >=
                                                          15) {
                                                        cnn(
                                                            context,
                                                            'كانك تحب { $onwen } راهو يتكلفلك 15 نقطة',
                                                            save);
                                                      } else {
                                                        cnnCoin(context);
                                                      }
                                                    },
                                                    child:   Text(
                                                        'هات { $onwen }')),
      );
    }
  }

  void cnn(BuildContext context, String a, String ss) {
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
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            controller.coin.toString(),
            style: TextStyle(fontSize: 25.sp, color: Colors.blue),
          ),
        ),
      ),
      body: Text(
        a,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
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
                'مغير مالا',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
      btnOk: InkWell(
        onTap: (() {
          controller.coin -= 15;
          box.write('coin', controller.coin);
          if (ss == 'mawdho3') {
            count++;
            box.write('${widget.text}$ss', count);
          } else {
            box.write('${widget.text}$ss', 1);
          }
          FlameAudio.play('pick.mp3');
          setState(() {});
          Get.back();
        }),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: Center(
              child: Text(
                'برى برك',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
    ).show();
  }

  void cnnCoin(BuildContext context) {
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
        padding: const EdgeInsets.all(5.0),
        child: Text(
          controller.coin.toString(),
          style: TextStyle(fontSize: 22.sp, color: Colors.blue),
        ),
      ),
      body: Text(
        'النقاط متعك متكفيش خسارة',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: ww / 15, fontWeight: FontWeight.bold),
      ),
      btnCancel: InkWell(
        onTap: (() {
          Get.back();
          show = true;
          setState(() {});
        }),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'دور العجلة',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
      btnOk: InkWell(
        onTap: (() {
          Get.back();
          controller.showRewardAds(ww, context, 1);
        }),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            height: 5.h,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'شوف اعلان وخوذ +25',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            )),
      ),
    ).show();
  }
}
