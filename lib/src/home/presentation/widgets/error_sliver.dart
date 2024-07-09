
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/error_view.dart';

class ErrorSliver extends StatelessWidget {
  final String message;
  final Function()? onPressed;

  const ErrorSliver(
      {super.key, required this.onPressed, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      // child: Text(message),
      child: ErrorView(
        onPressed: onPressed,
        message: message,
      ),
    );
  }
}
