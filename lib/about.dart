import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:char7nass/drawer_menu_widhet.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  final VoidCallback openDrawer;

  const AboutPage({
    super.key,
    required this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: DrawerMenuWidget(onClicked: openDrawer, str: 'حول التطبيق'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "التطبيق هو عبارة عن كراس شرح نص لجميع المستويات الدراسية الهدف منها مساعدة التلاميذ على خدمة الشرح نص و زيد عليه تطبيق حلو برشا و ساهل في الإستعمال عل الأخر .",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black, fontSize: w / 20),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                'ملاحظة :',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.deepOrange, fontSize: w / 20),
              ),
              subtitle: Text(
                "كان ثمة نص مهوش مخدوم الكل ، اعرف راني منجمتش نخدمو ،بلاهي  كان صلحتو في القسم صورو  و أبعثو عل facebook وإلا Gmail  خلي نزيدو .",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black, fontSize: w / 20),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "للتواصل معي :",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w / 13),
                ),
                SizedBox(
                  height: w / 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        const url = 'fb://profile/100078439645165';
                        const url2 =
                            'https://www.facebook.com/profile.php?id=100078439645165';
                        if (await canLaunchUrlString(url.toString())) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          launchUrl(Uri.parse(url2),
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      icon: const Icon(Icons.facebook),
                      iconSize: w / 11,
                      color: Colors.blueAccent,
                    ),
                    IconButton(
                      onPressed: () async {
                        String email =
                            Uri.encodeComponent("banditscreator@gmail.com");
                        String subject =
                            Uri.encodeComponent("Ekteb nasay7 mte3ek");

                        Uri mail = Uri.parse("mailto:$email?subject=$subject");
                        if (await launchUrl(mail)) {
                          launchUrl(mail);
                        }
                      },
                      icon: const Icon(Icons.email),
                      iconSize: w / 11,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "جميع الحقوق محفوظة",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black, fontSize: w / 25),
              ),
              Icon(
                Icons.copyright,
                size: w / 25,
              )
            ],
          ),
        ],
      ),
    );
  }
} // AppBar
