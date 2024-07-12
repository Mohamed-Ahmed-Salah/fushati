import 'dart:ui';

class OnBoardingModel {
  final String titleEn;
  final String subtitleEn;
  final String titleAr;
  final String subtitleAr;
  final Color color;
  final String image;
  final double? size;

  OnBoardingModel(
      {required this.titleEn,
      required this.subtitleEn,
        required this.titleAr, required this.subtitleAr,
      required this.color,
      this.size,
      required this.image});
}
