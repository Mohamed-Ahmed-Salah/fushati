import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DottedLineSeparatedWidget extends StatelessWidget {
  const DottedLineSeparatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (subIndex) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 5,
          ),
          alignment: AppLocalizations.of(context)?.localeName == "ar"
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: CustomPaint(
            painter: DottedLinePainter(),
          ),
        );
      }),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colours.borderGreyColor // Color of the dashed line
      ..strokeWidth = 1;

    double dashHeight = 3; // Height of each dash
    double dashSpace =
        (size.height - (dashHeight * 4)) / 3; // Space between dashes
    double startY = 0;

    for (int i = 0; i < 4; i++) {
      // Draw each dash
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
