import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/swipe_button.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class SwipedPrimaryButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String text;

  const SwipedPrimaryButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SwipeButton.expand(
      isLoading: isLoading,
      thumb: isLoading
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : const Icon(
              Icons.double_arrow_rounded,
              color: Colors.white,
            ),
      activeThumbColor: ColorHelper.primary,
      activeTrackColor: Colors.grey.shade300,
      onSwipe: onPressed,
      child: Text(
        text,
        style: TextStyleHelper.primary14,
      ),
    );
  }
}
