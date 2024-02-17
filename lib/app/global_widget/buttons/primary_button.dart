import 'package:flutter/material.dart';
import 'package:student/app/helper/text_style_helper.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String text;
  final bool fullWidth;
  final Size? minimumSize;

  const PrimaryButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
    this.minimumSize,
    this.fullWidth = false,
  });

  Size get customSize {
    if (fullWidth) {
      return const Size(double.infinity, 35);
    }
    if (minimumSize != null) {
      return minimumSize!;
    }
    return const Size(50, 35);
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(minimumSize: customSize),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: TextStyleHelper.light18,
            ),
    );
  }
}
