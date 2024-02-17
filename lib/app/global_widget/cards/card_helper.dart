import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';

class CardHelper extends StatelessWidget {
  final double radius;
  final BorderSide? side;
  final EdgeInsets padding;
  final Widget child;
  final Function()? onPressed;

  const CardHelper({
    super.key,
    this.radius = 8,
    this.side,
    this.padding = EdgeInsets.zero,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: side ??
            BorderSide(
              color: ColorHelper.grey,
              width: 1,
            ),
      ),
      color: ColorHelper.white,
      type: MaterialType.card,
      child: InkWell(
        splashColor: ColorHelper.splash,
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          padding: padding,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
