import 'package:flutter/cupertino.dart';

import '../../../../core/common/widgets/loading_view.dart';

class LoadingSliver extends StatelessWidget {
  const LoadingSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: LoadingWidget(),
    );
  }
}
