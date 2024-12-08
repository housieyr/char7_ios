import 'ad_helper.dart';
import 'package:get/get.dart';
import 'package:ftoast/ftoast.dart';
import 'package:flutter/material.dart';
import 'package:char7nass/drawer_item.dart';
import 'package:char7nass/drawer_items.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final box = GetStorage();

class UpdateController extends GetxController {}

class BadgeController extends GetxController {}

class MainController extends GetxController {
  DrawerItem selectedItem = DrawerItems.home;
  stateupdate() {
    selectedItem = DrawerItems.coin;
    update();
  }
}

class NiveauController extends GetxController {
  List<List<List<String>>> nass = [
    [
      [
        "المحور الاول: الأسرة",
        "نص المدرسة الأولى",
        "نص أحبّك و لكنّي أريد أن ألعب",
        "نص عصفور الصباح",
        "نص أخذت غيباته تطول",
        "نص أنا أيضا مسؤول",
        "نص كلّ آمالنا فيك",
        "نص العنقود",
        "نص الاخوان",
        "نص أخي ابراهيم",
        "نص أختي سعيدة",
        "نص المزارع الصغير",
        "نص أصبح رجلا",
      ],
      [
        "المحور الثاني : المدرسة",
        "نص رهبة",
        "نص جزاء المثابرة",
        "رسام موهوب",
        "نص نحو المجد",
        "نص الاعتراف",
        "نص الرحلة",
        "أصبحت تلميذا نجيبا",
        "أنا و أساتذتي",
        "من ذكريات تلميذة",
        "نجحت في المناظرة",
        "أجمل الذكريات",
        "رسالة اعتذار",
      ],
      [
        "المحور الثالث : الحي",
        "نص مدرستي الثانية",
        "نص لكم أحببتُ هذا الحيّ",
        "نص العودة الى الحي",
        "نص حنين",
        "نص في حي الحمزاوي",
        "نص قلق ممض",
        "نص الحي العجيب",
        "نص حي يواجه الشدايد",
        "نص العم باخير",
        "نص النادل الظريف",
        "نص بدر العنكبوت",
        "نص بونوّارة",
        "نص تحولات",
      ],
      [
        "المحور الرابع : تونس الجميلة",
        "نص تونس الأحلام",
        "نص صور من الماضي",
        "نص الشوق إلى تونس",
        "نص في جبال خمير",
        "نص سوسة العتيقة",
        "عرس الواحة",
        "نص بين تمثالين",
        "نص عرس تقليدي",
        "نص القيروان",
        "نص تونس الجميلة",
        "نص اغتيال حشاد",
        "نص جسر الاجيال",
        "نص في سبيل الوطن",
      ],
      [
        "المحور الخامس: الأطفال في العالم",
        "نص حياتنا في لابونيا",
        "نص أطفال في أتون الحرب",
        "نص صبي الدكان",
        "نص امتحان الشجاعة",
        "أطفال غزة",
        "طفلان من النيبال",
        "نص ضيفة من بلاد بعيدة",
        "نص صديقة من فلسطين",
        "نص اصبحنا نحب أتشان",
        "نص تقريب المسافات",
      ],
      [
        "المحور السادس: حكايات وأساطير",
        "نص رأي الجازية في الرجال",
        "نص نصيف",
        "نص الثعلبان والأسد",
        "نص في كهف التنين",
        "نص منارة فريدة",
        "نص القمقم",
        "نص جسر على نهر درينا",
        "نص حصان طروادة",
        "نص تشانغ والقاضي الحكيم",
        "نص أوديب",
        "نص في المطحنة",
        "نص طائر الفينيكس",
        "نص ديمترا",
      ]
    ],
    [
      [
        "المحور الأول : المدينة و الريف",
        "شرح نص احتفال",
        "شرح نص عروس العالم",
        "شرح نص في بيونس آيريس",
        "شرح نص النهج",
        "شرح نص شارع الأميرات",
        "شرح نص الفندق الصغير",
        "شرح نص تاكسي",
        "شرح نص النائمة في الشارع",
        "شرح نص في الجريد",
        "شرح نص أم مخول",
        "شرح نص سمعته يغني",
        "شرح نص الأشجار هي الحياة",
        "شرح نص تغيرت أشياء",
      ],
      [
        "المحور الثاني : الطبيعة",
        "شرح نص أبدت لنا الأيام",
        "شرح نص النرجس",
        "شرح نص الغاب",
        "شرح نص عند الغروب",
        "شرح نص في الشاطئ",
        "شرح نص أيلول الشاعر",
        "شرح نص مطر",
        "شرح نص العاصفة",
        "شرح نص المطاردة",
        "شرح نص ليلى والعصفور",
        "شرح نص تسونامي",
        "شرح نص درع ضد التلوث",
      ],
      [
        "المحور الثالث : الثقافة و الترفيه",
        "شرح نص الأفق الواسع",
        "شرح نص الكتاب",
        "شرح نص تونس عاصمة الثقافة",
        "شرح نص الساحر الجديد",
        "شرح نص الكرنفال",
        "شرح نص رحلة بين القمم",
        "شرح نص أغنية البحر والصحراء",
        "شرح نص أثر الموسيقى في إيلزا",
        "شرح نص حجة دامغة",
        "شرح نص السيرك",
        "شرح نص قبل المباراة",
        "شرح نص النغم الشجي",
      ],
      [
        "المحور الرابع : أعلام و مشاهير",
        "شرح نص الحكيم",
        "شرح نص ابن خلدون",
        "شرح نص رائد في الطب",
        "شرح نص غاندي",
        "شرح نص نداء الحرية والتطور",
        "شرح نص بيتهوفن",
        "يوم الحصول على جائزة نوبل",
        "شرح نص فلتة فن",
        "شرح نص أبو القاسم الشابي",
        "شرح نص أم كلثوم",
        "شرح نص حكاية اصرار",
        "شرح نص بطلة أولمبية",
      ],
      [
        "المحور الخامس : أحلام و مطامح",
        "شرح نص مسيرة شاب",
        "شرح نص الحلم يصنع الانسان",
        "شرح نص اختيار",
        "شرح نص أريد أن أعيش بحرية",
        "شرح نص نشيد الجبار",
        "شرح نص كانت أماله عراضا",
        "شرح نص أحلم بقرطبة",
        "شرح نص أحلم باكتشاف عظيم",
        "نص حلم",
        "شرح نص البنفسجة الطموح",
        "نص دون كيشوت",
      ]
    ],
    [
      [
        "المحور الأول : العمل",
        "شرح نص انا اعمل اذن انا موجود",
        "شرح نص كيف هزمت عدوي الاول",
        "شرح نص العمل إرادة",
        "شرح نصّ: سيّد الأرض",
        "شرح نص احب من الناس العامل",
        "شرح نص نحن بالساعد اعلينا الوطن",
        "شرح نص السماء لا تمطر ذهبا",
        "شرح نص ارهقني العمل",
        "شرح نص المدير المبدع",
        "شرح نص انما العمل اخلاق",
        "شرح نص السلسلة الجهنمية",
        "شرح نص لنرحم العامل",
        "شرح نص وقت الفراغ",
        "شرح نص الوقت هو الحياة",
        "شرح نص مهنة المصاحبة التكنولوجية",
      ],
      [
        "المحور الثاني : المرأة في المجتمعات المعاصرة",
        "شرح نص تعليم المرأة فرض",
        "شرح نص ضحية الجسد",
        "شرح نص المرأة العربية وحجاب الأوهام",
        "شرح نص:متى ستنصف المرأة العربية ؟",
        "شرح نص معلمة لاجئة",
        "شرح نص المرأة اليابانية",
        "شرح نص المرأة الصينية",
        "شرح نص طريق الحرية",
        "نص امرأة البحر",
        "نص عن أنثوية الإبداع والعلم",
        "شرح نص كن صديقي",
        "شرح نص: المرأة بين التحرير والمسؤولية",
        "شرح نص المرأة كيف نحبها و نضطهدها",
        "شرح نص المرأة في الاعلام الروسي",
        "شرح نص جسد المرأة في القنوات للفضائية"
      ],
      [
        "المحور الثالث : من شواغل عالمنا المعاصر",
        "شرح نص الضغط النفسي",
        "شرح نص الانتحار البطيء",
        "شرح نص تجارة القراطيس الصغيرة",
        "شرح النص المقامرون",
        "شرح نص الانسان عنيف بطبعه",
        "نص الشباب التائه",
        "شرح نص اطفال الشوارع : الى اين",
        "نص الثوم على الجبين",
        "شرح قصيدة أخي",
        "شرح نص الفقر و العولمة",
        "شرح نص الجوع صناعة بشرية",
        "شرح نص داء بلا دواء",
        "شرح نص زلزال اليابان",
        "شرح نص الطفل والتلفزة",
        "شرح نص مجتمع الصورة",
        "نص زمن الأجهزة",
        "شرح نص تضامن",
        "شرح نص لنتبرع"
      ],
      [
        "المحور الرابع : الفنون",
        "شرح نص لولا الجمال",
        "شرح نص الفن ما هو؟",
        "شرح نص هل الفنون الجميلة ضرورية",
        "شرح نص التقليد والفن",
        "نص سحر مغنية",
        "شرح نص عازف الكمنجة",
        "نص الباليه",
        "شرح نص في الرسم شفاء",
        "شرح نص الادب و السينما",
        "نص المسرح",
        "شرح نص فن اصيل",
        "شرح نص يريك ما لا تراه",
        "نص الشرق في فنون الغرب",
        "شرح نص الفن و الثورة الرقمية",
        "نص السريالية والدادائية"
      ],
      [
        "المحور الخامس : تفاعل الثقافات و الحضارات",
        "نص التوليد العقلي في العصر العباسي",
        "نص المغلوب مولع أبدا بالاقتداء بالغالب",
        "نص أسباب تقدم الغرب",
        "نص حتمية التفاعل الحضاري",
        "نص أهمية الترجمة",
        "نص الشرق في فنون الغرب",
        "نص بين الشرق والغرب",
        "نص الانترنت",
        "نص رحلة إلى كوريا",
        "نص غرناطة",
        "نص من مذكرات سفير عربي",
        "نص طباق",
        "نص السبيل الى مقاومة التخلف",
        "نص الحوار بين الحضارات",
        "نص الهوية بين الانفتاح و الإنغلاق",
        "نص كيف نصنع ثقافة جادة"
      ]
    ],
    [
      [
        "المحور الأول : شعر الغزل",
        "شرح قصيدة أفي النّاس أمثالي؟",
        "شرح نص خشية و رجاء",
        "شرح قصيدة الصديق الشافع",
        "شرح قصيدة غربة العشاق",
        "شرح قصيدة الوداع الأخير",
        "تذكرت ليلى",
        "شرح قصيدة ليت هندا",
        "شرح قصيدة يا من لقلب متيم",
        "شرح قصيدة إحدى ثلاث",
        "شرح قصيدة هل يخفى القمر؟",
        "شرح قصيدة مغامرة"
      ],
      [
        "المحور الثاني : الحكاية المثلية",
        "شرح نصّ دمنة يحرّش الأسد على الثور",
        "شرح نصّ دمنة يحرّش الثور على الأسد",
        "شرح نص الفحص عن أمر دمنة",
        "شرح نصّ دمنة في مجلس القضاء (1)",
        "شرح نصّ دمنة في مجلس القضاء (2)",
        "شرح نص الأسد وابن آوى الناسك (1)",
        "شرح نص الأسد وابن آوى الناسك (2)",
        "شرح نص الحمامة المطوقة",
        "شرح نص الحمامة و الثعلب و مالك الحزين",
        "شرح نص الملك والطائر فنزة"
      ],
      [
        "المحور الثالث : الشعر الوطني",
        "شرح قصيدة يا ابن أمّي",
        "شرح قصيدة إرادة الحياة",
        "شرح قصيدة إلى طغاة العالم",
        "شرح قصيدة تونس الجميلة",
        "شرح نص في عيد الجلاء عن بنزرت",
        "شرح قصيدة انا انسان جديد",
        "شرح قصيدة أنة البعيد عن الأوطان",
        "شرح قصيدة العودة إلى الوطن",
        "شرح قصيدة بالحقيقة يبنى الوطن",
        "شرح قصيدة إلام الخلف بينكم؟",
        "شرح قصيدة وطني",
        "شرح قصيدة حرية شعب"
      ],
      [
        "المحور الرابع : محور الأقصوصة",
        "شرح نص نبوت الخفير",
        "شرح نص الأرض المستحيلة",
        "شرح نص صادق",
        "نص المروض والثور",
        "نص أمانة",
        "نص الكراسي المقلوبة",
        "نص حكاية الباب",
        "نص في شاطئ حمام الأنف",
        "نص شهوة الصبية بألف مشرية",
      ]
    ],
    [
      [
        "المحور الأول : الشعر الجاهلي",
        "شرح قصيدة لخولة أطلال",
        "شرح قصيدة عوجاء مرقال",
        "شرح نص ثلاث هن من عيشة الفتى",
        "شرح نص ستبدي لك الأيام ما كنت جاهلا",
        "شرح نص لنا الدنيا و من أضحى عليها",
        "شرح نص أغشى الوغى عند المغنم",
        "شرح قصيدة ليس على ناري حِجاب",
        "شرح نص اني مانع جاري",
        "شرح قصيدة ضرّاب الكماة",
        "شرح نص حامي العرين",
        "شرح نص تلف مقيم",
        "شرح نص بدا لي وجه نعم",
        "شرح نص يا طائر البان",
        "شرح نص تداويت منها بها",
        "شرح نص من حكم الجاهليين",
        "شرح نص الخير بنواصي الخيل معصوب"
      ],
      [
        "المحور الثاني : شعر التجديد في القرن الثاني للهجرة",
        "شرح قصيدة سلام الله ذي العرش",
        "شرح قصيدة لا تبكين على رسم و لاعلى طلل",
        "شرح نص بنا شوق إليك",
        "شرح نص الارجوزة ذات الامثال",
        "شرح قصيدة الخمر و الطبيعة",
        "شرح قصيدة المغتسلة",
        "شرح نص دعاني من هويت فلم أجبه",
        "شرح قصيدة أيها الباني لهدم الليالي",
        "شرح قصيدة يا خاطب القهوة الصهباء",
        "شرح قصيدة لأشربن بكأس الموت",
        "شرح نص وذات دل",
        "المنايا تجوس كل البلاد",
        "هذا العيش لا خيم البوادي",
        "شرح نص فابكي على قبري",
        "شرح نص دع عنك لومي"
      ],
      [
        "المحور الثالث : النادرة عند الجاحظ",
        "شرح نص كلام بكلام",
        "شرح نص مثل هذا لا يكون إلا سماويا",
        "شرح نص رد القميص عفاك الله",
        "شرح نصّ: بَصُرَ بملِك الموت",
        "شرح نص أراني انفخ في غير فحم",
        "شرح نص ان الخرق شؤم",
        "شرح نص فما هضمه الا الضحك",
        "شرح نص اجرش يا أبا كعب اجرش",
        "شرح نص إنما العين مكروه يحدث",
        "شرح نص قد أشكل علينا هذا الأمر",
      ],
      [
        "المحور الرابع : الرومنطقية",
        "شرح نص الشاعر",
        "شرح نصّ: الشّاعر لإيليا أبو الماضي",
        "شرح نص يا شعر",
        "شرح نص ملكة الخيال",
        "شرح قصيدة عش للجمال",
        "شرح نص الفن الجميل",
        "شرح نصّ: قُلتُ للشّعر",
        "شرح نصّ: الشاعر و المقلّد",
        "شرح نصّ: المعراج",
        "شرح نص مناجاة أرواح",
        "شرح قصيدة مناجاة عصفور",
        "شرح نصّ: الجبابرة",
        "شرح نص ليل الأشواق",
        "شرح نص الأشواق التائهة",
        "شرح قصيدة اغنية ريفية",
        "شرح نص الجمال المنشود",
        "شرح نصّ رؤيا",
        "شرح نص كم تشتكي",
        "شرح نص نشيد الجبار",
        "شرح قصيدة التمثال",
      ],
      [
        "المحور الخامس : النص المسرحي",
        "شرح نص سادن المعبد",
        "شرح نص خلف الستار",
        "شرح نص جاليتنا تنبض بالحياة",
        "شرح نص جالاتيا الأخرى",
        "شرح نص ما أنا إلا حلمك",
        "شرح نص ما نحن إلا سجناء هذه الذات",
        "شرح نص آه و في يدها مكنسة",
        "شرح نص أين هي السماء",
        "شرح نص لست أثري الخالد",
        "شرح نص أيهما الأصل وأيهما الصورة ؟",
        "شرح نص الصراع والعبث",
      ]
    ],
    [
      [
        "المحور الأول : الفكاهة والهزل في القص العربي القديم",
        "شرح نص من المقامة الحلوانية",
        "شرح نص من المقامة المجاعية",
        "شرح نص أبو دلامة والمهدي",
        "شرح نص الكساحة",
        "شرح نصّ: من المقامة الموصليّة",
        "شرح نص المقامة الأرمنية",
        "شرح نصّ: أشير إليها باللّقمة",
        "شرح نص دع الحمار مكانه",
        "شرح نص عد لنزيدك"
      ],
      [
        "المحور الثاني : صور و نصوص",
        "شرح نص لوحة غرنكيا",
        "شرح نص الحرية تقود الشعب",
        "شرح نص جينفيرا دي بنشي",
        "شرح نص البهجة الأبدية",
        "شرح نص المرأة في صورة الإشهار",
        "شرح نص سلاح دمار شامل",
        "شرح نص اغتيال محمد الدرة",
        "شرح نص صيرفي",
      ],
      [
        "المحور الثالث : شواغل المرأة بقلم المرأة",
        "شرح نص من هي المرأة الحقيقية",
        "شرح نص تريد المشاركة",
        "شرح نص لا خلاص الا بالمساواة",
        "شرح نص الحريم",
        "شرح نص الزمن المضاد للشعر",
        "شرح قصيدة دعوة إلى الحياة",
        "شرح نصّ: المرأة البرمكيّة",
        "شرح نصّ: حمزة",
        "شرح نص المرأة والمدنية",
        "شرح نص حوار مع منى واصف",
        "شرح نص الاتجار بالنساء والأطفال",
        "شرح نص عالم بلا قلب",
        "شرح نصّ العولمة وتشغيل المرأة"
      ],
      [
        "المحور الرابع : العدل و الإنصاف",
        "شرح نصّ لا سبيل الى العمارة الا بالعدل",
        "شرح نص الثوب الجديد",
        "شرح نص اربط و حل كما تشاء",
        "شرح نص في محكمة الاستئناف",
        "شرح نص  شهادة أم",
        "شرح نص إني مظلوم وقد أعوزني الإنصاف",
        "شرح نص بردت غضبي بفوتك",
        "شرح نص إصلاح السلطان",
        "شرح نص حكاية الثريا التي رجعت تسف الثرى",
        "شرح نص عدل روما"
      ],
      [
        "المحور الخامس : حرية التعبير",
        "شرح نص الحرية منبع التقدم والتمدن",
        "شرح نص حرية الصحافة",
        "شرح نص وثنية الرؤية في الإعلام",
        "شرح نص الإعلام والغزو الثقافي",
        "شرح نص دفاعا عن حرية الرأي",
        "شرح نص الاستبداد والحرية واللسان",
        "شرح نص الدولة وحرية التعبير",
        "شرح نص عوائق حرية التعبير",
        "شرح نص مدن الحرية",
        "شرح نص أحب نكهة تمردي"
      ],
      [
        "المحور السادس : الإنسان والمكان",
        "شرح نص ليس البيت فندقا ولا مطعما",
        "شرح نص وادي العيون",
        "شرح نص كيف يموت النخل ؟",
        "شرح نص القرية المحفورة في الذاكرة",
        "شرح نص مرسيليا",
        "شرح نص شارع الأميرات",
        "شرح نص مجالي الزهراء",
        "شرح نص غريب على الخليج",
        "شرح نص قصيدة الأرض",
        "شرح نص حرية السجين",
        "شرح نص البيئة والإنسان",
        "شرح نص الولاء للبيئة ولاء للإنسانية"
      ]
    ],
    [
      [
        "المحور الأول : في التفكير العلمي",
        "شرح نص نسبية المعرفة الحسية",
        "شرح نص الشك طريق الى اليقين",
        "شرح نص طريقة البحث العلمي عند ابن الهيثم",
        "شرح نصّ: التشريح و الدورة الدموية الصغرى",
        "شرح نص فضل علم التاريخ",
        "شرح نصّ: المفاضلة بين البلاغة والحساب",
        "شرح نص في علوم اللسان",
        "شرح نص اضافة العالم العربي",
        "شرح نص مضخة الجزري"
      ],
      [
        "المحور الثاني : في الفن و الأدب",
        "شرح نص طموح أهل الفضل",
        "شرح نص أدم والشعر",
        "شرح نص كم قليل مستطاب",
        "شرح نص حد الشعر وبنيته",
        "شرح نص اثر الغناء في النفس",
        "شرح نص العمارة العربية الإسلامية",
        "شرح نص فن الرسم في الثقافة العربية الإسلامية",
        "شرح نص الخط والتجريد"
      ],
      [
        "المحور الثالث : في حوار الحضارات",
        "شرح نص الترجمة سبيل الى حوار الحضارات",
        "شرح نص ندخله آمنين",
        "شرح نص امة تواجه عصرا جديدا",
        "شرح نصّ حتمية الحوار في عصر العولمة",
        "شرح نصّ حضارة متجذرة",
        "شرح نص صدام أم ذوبان",
        "شرح نص الغرب في مرآة الذات",
        "شرح نص حيطة الفرنسي"
      ],
      [
        "المحور الرابع : في الفكر والفن",
        "شرح نص السيف والقانون",
        "شرح نص التكنولوجيا الحديثة",
        "شرح نص الديمقراطية أولا",
        "شرح نص التعليم والمستقبل",
        "شرح نص استشراق المستقبل",
        "شرح نص فضائيات الصخب",
        "شرح نص المسرح بين التثقيف والتسلية",
        "شرح نص السينما"
      ]
    ]
  ];

  int coin = 0;
  late RewardedAd? rewardedAd;
  bool load = false;
  @override
  void onInit() {
    coin = box.read('coin');
    loadRewardAds();

    super.onInit();
  }

  loadRewardAds() {
    rewardedAd = null;
    load = false;
    RewardedAd.load(
        adUnitId: AdHelper.rewardAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            rewardedAd = null;
            // Keep a reference to the ad so you can show it later.
            rewardedAd = ad;
            load = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            load = false;
          },
        ));
  }

  showRewardAds(double ww, BuildContext context, int k) {
    rewardedAd?.fullScreenContentCallback =
        FullScreenContentCallback(onAdFailedToShowFullScreenContent: (ad, err) {
      ad.dispose();
      FToast.toast(
        context,
        duration: 6800,
        msg: 'ظاهر فيه مثماش إعلان توا أنت زيد شويا وجرب معندك ما خاسر',
        msgStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'tota',
            fontWeight: FontWeight.bold,
            fontSize: ww * 0.04),
      );
      loadRewardAds();
    }, onAdDismissedFullScreenContent: (ad) {
      ad.dispose();
      rewardedAd = null;

      loadRewardAds();
    });
    if (load == false) {
      FToast.toast(
        context,
        duration: 6800,
        msg: "ظاهر فيه مثماش إعلان أنت زيد شويا وجرب معندك ما خاسر",
        msgStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'tota',
            fontWeight: FontWeight.bold,
            fontSize: ww * 0.04),
      );
      loadRewardAds();
    }
    if (rewardedAd != null) {
      rewardedAd?.show(onUserEarnedReward: (ad, reward) {
        if (k == 1) {
          coin += 25;

          box.write('coin', coin);
          FlameAudio.play('coin_win.mp3', volume: 0.3);
        } else {
          int spins = box.read('spins');
          spins++;
          FlameAudio.play('pick.mp3', volume: 0.5);
          box.write('spins', spins);
          Get.put(UpdateController()).update();
        }
      });

      rewardedAd = null;
      loadRewardAds();
    }
  }

  @override
  void onClose() {
    if (rewardedAd != null) {
      rewardedAd?.dispose();
    }

    super.onClose();
  }
}
