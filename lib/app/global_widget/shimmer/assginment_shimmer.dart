import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AssignmentShimmer extends StatelessWidget {
  const AssignmentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 3),
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemBuilder: (c, i) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white38
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Container(
                  width: 16,
                  height: 92,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          empty(40, 16),
                          empty(30, 12),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                empty(80, 14),
                                const SizedBox(height: 2),
                                empty(75, 14),
                                const SizedBox(height: 2),
                                empty(40, 14),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                empty(60, 12),
                                const SizedBox(height: 2),
                                empty(60, 12),
                                const SizedBox(height: 2),
                                empty(60, 12),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ).marginSymmetric(vertical: 8),
        itemCount: 6,
      ),
    );
  }

  Widget empty(double w, double h) => Container(
        width: w,
        height: h,
        color: Colors.grey,
      );
}
