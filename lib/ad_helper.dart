import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3843819580286818/9127699374";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3843819580286818/6579713268";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3843819580286818/2945434401";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3843819580286818/8307765891";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get openAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3843819580286818/2333237729";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3843819580286818/5883313925";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3843819580286818/1886762586";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3843819580286818/5681602559";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
