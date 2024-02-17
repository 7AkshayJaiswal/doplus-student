import 'package:flutter/material.dart';
import 'package:student/app/global_widget/shimmer/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ListPageSkeleton extends StatelessWidget {
  const ListPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 3),
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      child: const Row(
        children: [
          Skeleton(height: 120, width: 120),
          SizedBox(width: defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(width: 80),
                SizedBox(height: defaultPadding / 2),
                Skeleton(),
                SizedBox(height: defaultPadding / 2),
                Skeleton(),
                SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Expanded(
                      child: Skeleton(),
                    ),
                    SizedBox(width: defaultPadding),
                    Expanded(
                      child: Skeleton(),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
