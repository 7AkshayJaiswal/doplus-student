import 'package:flutter/material.dart';
import 'package:student/app/lang/en.dart';
import 'package:student/app/lang/hi.dart';
import 'package:student/app/lang/te.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "hi": hi,
        "te": te,
      };
}
