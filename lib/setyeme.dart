import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:char7nass/loading.dart';
import 'package:char7nass/ad_helper.dart';
import 'package:char7nass/controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Setyeme extends StatefulWidget {
  final int niveau;
  final int indice;
  final String title;
  const Setyeme(
      {super.key,
      required this.niveau,
      required this.indice,
      required this.title});

  @override
  State<Setyeme> createState() => _SetyemeState();
}

InterstitialAd? _interstitialAd;
InterstitialAd? ads;
late bool _isInterstitialAdReady;
late bool testy;

void _loadInterstitialAd() {
  testy = false;
  InterstitialAd.load(
    adUnitId: AdHelper.interstitialAdUnitId,
    request: const AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        _interstitialAd = ad;
        testy = true;
      },
      onAdFailedToLoad: (err) {},
    ),
  );
}

class _SetyemeState extends State<Setyeme> {
  @override
  void initState() {
    super.initState();

    testy = false;
    _isInterstitialAdReady = false;
    _interstitialAd = null;
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {},
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _interstitialAd?.dispose();
  }

  final NiveauController controller = Get.put(NiveauController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 10,
        backgroundColor: Colors.lightBlue,
        title: Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 11.w),
          child: Text(widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.3.h,
                  fontFamily: 'NotoNastaliqUrdu',
                  wordSpacing: 5.w,
                  letterSpacing: 0.2.w)),
        ),
      ),
      body: Container(
        color: Colors.blueAccent.withOpacity(0.05),
        child: ListView.builder(
          itemCount: controller.nass.elementAt(widget.indice).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                  child: Material(
                    shadowColor: Colors.purpleAccent,
                    elevation: 10,
                    child: ExpansionTile(
                      textColor: Colors.blueAccent,
                      backgroundColor: Colors.black87,
                      title: Text(
                        controller.nass.elementAt(widget.indice)[index].first,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      children: [
                        const Divider(
                            color: Colors.purpleAccent,
                            indent: 20,
                            endIndent: 20,
                            thickness: 1),
                        for (int i = 1;
                            i <
                                controller.nass
                                    .elementAt(widget.indice)[index]
                                    .length;
                            i++)
                          buildCard(
                              controller.nass
                                  .elementAt(widget.indice)[index]
                                  .elementAt(i),
                              context,
                              '${widget.niveau}${index + 1}$i',
                              i),
                      ],
                    ),
                  ),
                ),
                if (!((controller.nass.elementAt(widget.indice).length - 1) ==
                    index))
                  line(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget line() {
    return Divider(
      color: Colors.lightBlue,
      indent: 15.w,
      endIndent: 15.w,
      thickness: 0.2.h,
    );
  }

  Widget buildCard(String str, BuildContext cto, String id, int tar9im) {
    double height = MediaQuery.of(cto).size.width * .13;
    return Container(
      margin: EdgeInsets.fromLTRB(MediaQuery.of(cto).size.height * .01, 5,
          MediaQuery.of(cto).size.height * .01, 0),
      child: ListTile(
        title: Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.purpleAccent,
                  Colors.lightBlue,
                ]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(180),
              bottomLeft: Radius.circular(180),
              topRight: Radius.circular(180),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      str,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: height / 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 2, 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/circle.png',
                              height: height),
                          Text(
                            '$tar9im',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: height / 2),
                          )
                        ],
                      )))
            ],
          ),
        ),
        onTap: () {
          if (_isInterstitialAdReady && _interstitialAd != null) {
            ads = _interstitialAd;
            _isInterstitialAdReady = false;
            _interstitialAd = null;
            _loadInterstitialAd();
          } else {
            if (testy && _interstitialAd != null) {
              ads = _interstitialAd;
              _interstitialAd = null;
              _loadInterstitialAd();
            }
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoadingScreen(
                        text: id,
                        niveau: '${widget.niveau}',
                        ads: ads,
                      )));
        },
      ),
    );
  }
}
