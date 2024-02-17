import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_typing/animated_typing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class DashboardSliderList extends StatelessWidget {
  final currentIndex = 0.obs;

  DashboardSliderList({super.key});

  final List<String> imagesList = [
    'https://images.theconversation.com/files/45159/original/rptgtpxd-1396254731.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=754&fit=clip',
    'https://img.freepik.com/premium-photo/opened-book-with-flying-pages-butterflies-dark-backgroundgenerative-ai_391052-12859.jpg',
    'https://images.inc.com/uploaded_files/image/1920x1080/getty_655998316_2000149920009280219_363765.jpg',
    'https://assets.architecturaldigest.in/photos/624c2654cf7483eb90e638d6/4:3/w_1440,h_1080,c_limit/Books-1.jpg',
  ];
  final List<String> titles = [
    'Board exams to be held twice a year',
    'Special arrangements for sports and Olympiad students',
    '',
    'No separate answer book for Accountancy',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: ColorHelper.primary.withOpacity(0.2),
            width: 0.4,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "schoolNews".tr,
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
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                height: 140,
                autoPlayInterval: const Duration(seconds: 10),
                pauseAutoPlayOnTouch: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                },
              ),
              items: imagesList
                  .map(
                    (item) => Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyleHelper.grey10,
                    child: Obx(
                      () => AnimatedTyping(
                        text: titles[currentIndex.value],
                        duration: const Duration(seconds: 3),
                        style: TextStyleHelper.grey10,
                        loop: false,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagesList.map((urlOfItem) {
                    int index = imagesList.indexOf(urlOfItem);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex.value == index
                            ? ColorHelper.primary
                            : ColorHelper.grey.withOpacity(0.4),
                      ),
                    );
                  }).toList(),
                ).marginOnly(right: 6),
              ],
            )
          ],
        ),
      ),
    );
  }
}
