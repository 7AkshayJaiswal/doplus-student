import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';

class EditableImageAppBar extends StatelessWidget {
  final String? imagePath;
  final File? imageFile;
  final Function()? getImage;
  final String? customerImageUrl;
  final bool editable;
  final String? assetImagePath;

  const EditableImageAppBar({
    Key? key,
    required this.imagePath,
    this.imageFile,
    this.customerImageUrl,
    this.getImage,
    this.editable = true,
    this.assetImagePath,
  }) : super(key: key);

  ImageProvider get getProfileImage {
    if (imagePath != null && imageFile != null) return FileImage(imageFile!);
    if (customerImageUrl != null && customerImageUrl!.isNotEmpty) {
      return const NetworkImage(
        "https://avatars.githubusercontent.com/u/44025097",
      );
    }
    return NetworkImage(
      "https://avatars.githubusercontent.com/u/44025097",
    );
  }

  bool get hasAssetImage =>
      assetImagePath != null && assetImagePath!.isNotEmpty;

  Widget get editIcon {
    if (editable) {
      return Positioned(
        top: 6,
        right: 4,
        child: CircleAvatar(
          radius: 12,
          backgroundColor: ColorHelper.primary.withOpacity(0.8),
          // foregroundColor: Colors.white,
          child: CircleAvatar(
            radius: 9,
            backgroundColor: ColorHelper.primary,
            child: Icon(
              Icons.edit,
              size: 15,
              color: ColorHelper.white,
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }

  Widget get normalImage => CircleAvatar(
        radius: 52,
        backgroundColor: ColorHelper.primary.withOpacity(0.2),
        child: CircleAvatar(
          backgroundColor: ColorHelper.primary,
          radius: 50,
          backgroundImage: getProfileImage,
        ),
      );

  Widget get assetImage => CircleAvatar(
        radius: 40,
        backgroundColor: ColorHelper.white,
        child: CircleAvatar(
          radius: 37,
          backgroundColor: ColorHelper.primary,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: ColorHelper.white,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorHelper.white,
              child: Image.asset(
                assetImagePath!,
                fit: BoxFit.contain,
                color: ColorHelper.primary,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return hasAssetImage
        ? assetImage
        : Center(
            child: GestureDetector(
              onTap: editable ? getImage : null,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  normalImage,
                  editIcon,
                ],
              ),
            ),
          );
  }
}
