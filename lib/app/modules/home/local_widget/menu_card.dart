import 'package:flutter/material.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/data/enums/roles_enum.dart';
import 'package:student/app/global_widget/cards/card_helper.dart';
import 'package:student/app/global_widget/static/background.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:student/app/utils/constant/app_config_constant.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuCard extends StatelessWidget {
  final Function(String)? onItemClick;
  final String versionDetails;

  const MenuCard({
    super.key,
    this.onItemClick,
    required this.versionDetails,
  });

  LoginDataModel get loginData => Storage.loginData;

  @override
  Widget build(BuildContext context) {
    return BackGround(
      hideBackAction: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: upperWidget,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  getRolesWidget,
                  menuDivider,
                  languageChangeOption(onPressed: () {
                    onItemClick!("onLanguageChangeOption");
                  }),
                  menuDivider,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "connectWithUsWithSocialPlatform".tr,
                            style: TextStyleHelper.normal10,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  circleIcon(FontAwesomeIcons.twitter),
                                  const SizedBox(width: 6),
                                  circleIcon(FontAwesomeIcons.instagram),
                                  const SizedBox(width: 6),
                                  circleIcon(FontAwesomeIcons.facebook),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: ColorHelper.primary.withOpacity(0.2),
                                  width: 0.4,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color:
                                          ColorHelper.primary.withOpacity(0.4),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "rateUs".tr,
                                      style: TextStyleHelper.grey10,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            width: double.infinity,
            color: Colors.white,
            child: footerWidget,
          ),
        ],
      ),
    );
  }

  Widget get getRolesWidget {
    List<ActionDetails> actions = getActionsByRoles;
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ActionDetails action = actions[index];
        return menuItemCard(
          text: action.actionTitle,
          icon: action.actionIcon,
          onPressed: () {
            Get.toNamed(action.actionRoute);
          },
        );
      },
      separatorBuilder: (__, _) => menuDivider,
      itemCount: actions.length,
    );
  }

  Widget get footerWidget => Column(
        children: [
          CardHelper(
            radius: 16,
            side: BorderSide(
              width: 0.5,
              color: ColorHelper.primary.withOpacity(0.4),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            onPressed: () {
              Storage.clearLogin();
              Get.offAllNamed(Routes.PRE_LOGIN);
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/44025097',
                    fit: BoxFit.fill,
                    height: 35.0,
                    width: 30.0,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${loginData.name}",
                        style: TextStyleHelper.bold14,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 1),
                      Text(
                        AppConstant.currentRoleType.name.tr,
                        style: TextStyleHelper.primary10,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: ColorHelper.bold.withOpacity(0.7),
                      size: 20,
                    ),
                    Text(
                      "signOut".tr,
                      style: TextStyleHelper.grey10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(6),
                ),
                child: Text(
                  "privacyPolicy".tr,
                  style: TextStyleHelper.grey12,
                ),
              ),
              Container(
                width: 1,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorHelper.primary.withOpacity(0.4),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(6),
                ),
                onPressed: () {},
                child: Text(
                  "termsConditions".tr,
                  style: TextStyleHelper.grey12,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "@ ALL RIGHT RESERVED DOPLUS TECHNOLOGIES P. LIMITED",
              style: TextStyleHelper.grey10.copyWith(
                fontSize: 7,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              versionDetails,
              style: TextStyleHelper.bold10.copyWith(
                fontSize: 7,
              ),
            ),
          ),
        ],
      );

  Widget get upperWidget => Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetHelper.doplusText,
              width: Get.width * 0.6,
              height: Get.width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
        ],
      );

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.4),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 0.4,
      );

  Widget circleIcon(IconData icon) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorHelper.primary.withOpacity(0.2),
            width: 0.4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: ColorHelper.primary.withOpacity(0.4),
            size: 16,
          ),
        ),
      );

  Widget menuItemCard({
    required IconData icon,
    required String text,
    required Function()? onPressed,
  }) {
    return CardHelper(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: onPressed,
      side: BorderSide.none,
      child: Row(
        children: [
          circleIcon(icon),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$text".tr,
              style: TextStyleHelper.normal14,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorHelper.grey,
            size: 12,
          ),
        ],
      ),
    );
  }

  Widget languageChangeOption({
    required Function()? onPressed,
  }) {
    return CardHelper(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: onPressed,
      side: BorderSide.none,
      child: Row(
        children: [
          //circleIcon(Icons.g_translate_rounded),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorHelper.primary.withOpacity(0.2),
                width: 0.4,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                AssetHelper.language,
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "changeLanguage".tr,
              style: TextStyleHelper.normal14,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorHelper.grey,
            size: 12,
          ),
        ],
      ),
    );
  }
}
