import 'package:news_app_apis/core/constants.dart';
import 'package:news_app_apis/core/enums/languages.dart';

extension LanguagesExtension on Languages {
  String getString() {
    switch (this) {
      case Languages.arabic:
        return kArabic;
      case Languages.english:
        return kEnglish;
      default:
        return kEnglish;
    }
  }
}
