
import 'package:flutter/cupertino.dart';

import '../../res/styles/colours.dart';

class GreenBackground extends StatelessWidget {
  final Widget child;

  const GreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 0.2, 0.3, 0],
          colors: [
            Colours.primaryGreenColor.withOpacity(0.2),
            Colours.primaryGreenColor.withOpacity(0.1),
            Colours.primaryGreenColor.withOpacity(0.01),
            Colours.whiteColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
