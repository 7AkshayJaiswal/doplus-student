import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class FeeChart extends StatelessWidget {
  const FeeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: ColorHelper.primary.withOpacity(0.2),
          width: 0.4,
        ),
      ),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fee Collection Report",
                      style: TextStyleHelper.bold12,
                    ),
                    Container(
                      height: 4,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "View Details",
                style: TextStyleHelper.grey10.copyWith(
                  color: ColorHelper.primary,
                  fontSize: 9,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorHelper.primary.withOpacity(0.6),
                ),
              ),
            ],
          ),
          PieChart(
            animationDuration: Duration(seconds: 2),
            gradientList: [
              [Colors.red.shade900, Colors.red.shade600, Colors.red.shade900],
              [Colors.orange.shade900, Colors.orange.shade600, Colors.orange.shade900],
              [Colors.yellow.shade900, Colors.yellow.shade600, Colors.yellow.shade900],
            ],
            chartValuesOptions: ChartValuesOptions(
              chartValueStyle: TextStyleHelper.grey10,
            ),
            legendOptions: LegendOptions(
              legendTextStyle: TextStyleHelper.normal12,
            ),
            dataMap: {
              "Admission": 13000,
              "Transport": 12000,
              "Monthly": 6500,
            },
          ),
        ],
      ),
    );
  }
}
