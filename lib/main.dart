import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/services.dart';
import 'package:student/amplifyconfiguration.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/lang/translation_service.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  await _configureAmplify();
  await loadImage(AssetImage(AssetHelper.back));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var analytics = FirebaseAnalytics.instance;
  var observer = FirebaseAnalyticsObserver(analytics: analytics);
  List<NavigatorObserver> navigatorObservers =
      Foundation.kReleaseMode ? [observer] : [];
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      navigatorObservers: navigatorObservers,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Raleway',
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall: TextStyleHelper.normal12,
          bodyMedium: TextStyleHelper.normal14,
          bodyLarge: TextStyleHelper.normal16,
          titleSmall: TextStyleHelper.bold12,
          titleMedium: TextStyleHelper.bold14,
          titleLarge: TextStyleHelper.bold16,
        ),
        appBarTheme: AppBarTheme(
          color: ColorHelper.primary,
          centerTitle: true,
          toolbarTextStyle: TextStyleHelper.light14,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 12,
          indicatorColor: const Color(0xfff38756),
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return TextStyleHelper.bold12;
              }
              return TextStyleHelper.grey12;
            },
          ),
          iconTheme: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return const IconThemeData(
                  color: Colors.white,
                );
              }
              return IconThemeData(
                color: ColorHelper.grey,
              );
            },
          ),
        ),
        primaryColor: ColorHelper.primary,
        scaffoldBackgroundColor: const Color(0xff808080),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            backgroundColor: ColorHelper.primary,
            textStyle: TextStyleHelper.light14,
            minimumSize: const Size(
              double.infinity,
              40,
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: ColorHelper.primary,
          disabledColor: const Color(0xff808080),
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Future<void> loadImage(ImageProvider provider) {
  final config = ImageConfiguration(
    bundle: rootBundle,
    devicePixelRatio: 1,
    platform: defaultTargetPlatform,
  );
  final Completer<void> completer = Completer();
  final ImageStream stream = provider.resolve(config);

  late final ImageStreamListener listener;

  listener = ImageStreamListener((ImageInfo image, bool sync) {
    debugPrint("Image ${image.debugLabel} finished loading");
    completer.complete();
    stream.removeListener(listener);
  }, onError: (dynamic exception, StackTrace? stackTrace) {
    completer.complete();
    stream.removeListener(listener);
    FlutterError.reportError(FlutterErrorDetails(
      context: ErrorDescription('image failed to load'),
      library: 'image resource service',
      exception: exception,
      stack: stackTrace,
      silent: true,
    ));
  });

  stream.addListener(listener);
  return completer.future;
}

Future<void> _configureAmplify() async {
  try {
    final storage = AmplifyStorageS3();

    // Create the Auth plugin.
    final auth = AmplifyAuthCognito();

    // Add the plugins and configure Amplify for your app.
    await Amplify.addPlugins([auth, storage]);
    await Amplify.configure(amplifyconfig);

    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}