
import 'package:flutter/cupertino.dart';
import 'package:fushati/core/res/theme/app_theme.dart';

import '../../res/styles/colours.dart';

class GreenBackground extends StatelessWidget {
  final Widget child;

  const GreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: CustomTheme.linearGradiant
      ),
      child: SafeArea(child: child),
    );
  }
}
