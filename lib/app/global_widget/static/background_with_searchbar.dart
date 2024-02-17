import 'package:flutter/material.dart';
import 'package:student/app/global_widget/search_page/search_appbar.dart';
import 'package:student/app/global_widget/static/background_card.dart';
import 'package:get/get.dart';

class BackgroundWithSearchBar extends StatelessWidget {
  final String titleText;
  final VoidCallback? filterAction;
  final VoidCallback? sortAction;
  final ValueChanged<String>? searchAction;
  final Widget child;

  const BackgroundWithSearchBar({
    super.key,
    required this.titleText,
    required this.child,
    this.filterAction,
    this.sortAction,
    this.searchAction,
  });

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        const BackgroundCard(),
        Column(
          children: [
            SizedBox(height: topPadding),
            SizedBox(
              width: double.infinity,
              child: SearchAppBar(
                titleText: titleText,
                filterAction: filterAction,
                searchAction: searchAction,
                sortAction: sortAction,
              ),
            ).paddingAll(16),
            Expanded(
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                child: child,
              ),
            ),
          ],
        )
      ],
    );
  }
}
