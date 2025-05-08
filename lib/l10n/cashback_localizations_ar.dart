// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'cashback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class CashbackLocalizationsAr extends CashbackLocalizations {
  CashbackLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get points => 'النقاط';

  @override
  String get totalCollectedPoints => 'إجمالي النقاط المجمعة';

  @override
  String get level => 'المستوى';

  @override
  String get point => 'نقطة';

  @override
  String get registry => 'السجل';

  @override
  String get howToCollect => 'كيف اجمع؟';

  @override
  String get howToWin => 'كيف افوز؟';

  @override
  String get collectMoreLabel => '!جمع المزيد من النقاط للانضمام الى مسابقات الجوائز';

  @override
  String get weeklyContest => 'المسابقة الاسبوعية';

  @override
  String get monthlyContest => 'المسابقة الشهرية';

  @override
  String get quarterlyContest => 'المسابقة الربع سنوية';

  @override
  String get rank => 'الرتبة';

  @override
  String get toFirstRank => 'حتى الرتبة الاولى';

  @override
  String get rewardsTableLabel => 'قائمة الاوائل للجوائز';

  @override
  String get competeToWinLabel => 'تنافس للحصول علي المرتبة الاولى قبل نهاية كل مسابقة للفوز بالجائزة';

  @override
  String get win => 'اربح';

  @override
  String get weekly => 'الاسبوعية';

  @override
  String get monthly => 'الشهرية';

  @override
  String get quarterly => 'الربع سنوية';

  @override
  String lockedContestTableLabel(String period) {
    return 'حقق نقاطك $period';
  }

  @override
  String lockedContestTableBody(String period) {
    return 'للبدء في المنافسة علي الجائزة $period';
  }

  @override
  String get howToCollectSubtitle => '!اربح جوائز حصرية مع كل نقطة';

  @override
  String get howToCollectS1Label => 'جمع نقاط مع كل طلبية';

  @override
  String get howToCollectS1Body => 'كل 1 EGP في طلبيتك المكتملة تمنحك نقطة واحدة أقرب للفوز بجوائز مذهلة';

  @override
  String get howToCollectS2Label => 'ارتق الى المستوى الأعلى للحصول على نقاط اضافية';

  @override
  String get howToCollectS2Body => 'كلما ارتفع مستواك كلما ربحت نقاطا أكثر';

  @override
  String get howToCollectS3Label => 'ابحث عن العروض الخاصة';

  @override
  String get howToCollectS3Body => 'اكتشف العروض التي تزيد من نقاطك أكثر';

  @override
  String get howToCollectS4Label => 'لا تفوت الأحداث الخاصة';

  @override
  String get howToCollectS4Body => 'ترقب الأحداث الخاصة حيث يمكنك مضاعفة نقاطك';

  @override
  String get theMoreYouCollectLabel => 'كلما زادت النقاط المجمعة زادت الجوائز!';

  @override
  String get startCollectingTody => 'ابدأ في الجمع اليوم';

  @override
  String get howToWinSubtitle => 'انضم الي المسابقة و اصعد الي القمة!';

  @override
  String get howToWinS1Label => 'الانضمام التلقائي';

  @override
  String get howToWinS1Body => 'احصل علي نقاط المطلوبة و ستكون في المسابقة';

  @override
  String get howToWinS2Label => 'تنافس لتكون الأول';

  @override
  String get howToWinS2Body => 'تنافس مع الصيدليات الأخرى علي المركز الأول و الجائزة الكبرى';

  @override
  String get howToWinS3Label => 'تتبع تقدمك';

  @override
  String get howToWinS3Body => 'يبقيك قائمة الاوائل علي اطلاع دائم بترتيبك و تقدمك في المنافسة';

  @override
  String get howToWinS4Label => 'اربح واحصل على جائزتك';

  @override
  String get howToWinS4Body => 'في نهاية كل مسابقة يتم الاعلان عن الفائز اذا كنت انت الفائز فستوجهك نافذة خاصة لاستلام جائزتك';

  @override
  String get pushToTheTop => 'استمر في التقدم نحو القمة';

  @override
  String get collectedPointsRegistry => 'سجل النقاط المجمعة';

  @override
  String get rewards => 'الجوائز';

  @override
  String get noItemsFound => 'لم يتم العثور على عناصر';

  @override
  String get noItemsFoundBody => 'هذة القائمة فارغة حاليا';

  @override
  String completedRequest(String id) {
    return 'استكمال الطلب $id#';
  }

  @override
  String get currencyCode => 'ج.م';
}
