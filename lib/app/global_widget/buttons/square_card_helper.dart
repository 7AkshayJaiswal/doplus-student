import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';

class SquareCardHelper extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double dimension;
  final Color? borderColor;

  const SquareCardHelper({
    super.key,
    required this.onPressed,
    required this.child,
    this.dimension = 60,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(12.0);
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: borderColor ?? ColorHelper.bold.withOpacity(0.6),
            width: 1,
          ),
        ),
        color: ColorHelper.white,
        type: MaterialType.card,
        child: InkWell(
          splashColor: ColorHelper.splash.withOpacity(0.6),
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox.square(
              dimension: dimension,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
