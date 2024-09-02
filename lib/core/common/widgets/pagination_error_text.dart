
import 'package:flutter/material.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaginationErrorText extends StatelessWidget {
  final String message;

  const PaginationErrorText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colours.blackColor, fontWeight: FontWeight.w400),
        ),
      ),
    );

  }
}
