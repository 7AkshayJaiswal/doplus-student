import 'package:flutter/material.dart';

class ColorHelper {
  static Color get primary => const Color(0xfff06023);

  static Color get grey => const Color(0xff808080);

  static Color get bold => const Color(0xff262425);

  static Color get normal => const Color(0xff424242);

  static Color get splash => Colors.green;

  static Color get white => Colors.white;

  static Color get success => Colors.green;

  static Color get error => Colors.red;

  static Color get warning => Colors.yellow;

  static Gradient get iconGradient => const LinearGradient(
        colors: [
          Color(0xfff29605),
          Color(0xfff28905),
          Color(0xfff37805),
          Color(0xfff25a05),
          Color(0xfff23005),
          Color(0xfff23005),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          0.15,
          0.30,
          0.45,
          0.60,
          0.80,
          1.0,
        ],
      );

  static RadialGradient get iconBaseGradient => const RadialGradient(
        colors: [
          Color(0xfff29605),
          Color(0xfff25a05),
          Color(0xfff23005),
        ],
        stops: [
          0.15,
          0.60,
          1.0,
        ],
      );

  static Widget colorIcon({required Icon child}) => ShaderMask(
    blendMode: BlendMode.srcIn,
    shaderCallback: (Rect bounds) =>
        ColorHelper.iconBaseGradient.createShader(bounds),
    child: child,
  );
}
