import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/home/presentation/widgets/custom_drawer.dart';

import '../../../../core/utils/constants/size_constatnts.dart';
import '../../../splash/presentation/app/app_redirection_bloc/app_redirection_bloc.dart';
import '../widgets/cards_list.dart';
import '../widgets/error_sliver.dart';
import '../widgets/home_appbar.dart';
import '../widgets/loading_sliver.dart';

class HomeView extends StatefulWidget {
  final bool shouldGetAppData;

  const HomeView({super.key, this.shouldGetAppData = false});
  static const param = "shouldGetAppData";

  static String path = "/home";
  static String name = "/home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

@override
  void initState() {

  print("shouldGetAppData ${widget.shouldGetAppData}");
  if (widget.shouldGetAppData) {
    context.read<AppRedirectionBloc>().add(
      GetAppData(context: context),
    );
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomHomeAppBar(
        drawerKey: _scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConst.horizontalPadding,
            // vertical: SizeConst.verticalPadding
          ),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<CardsBloc, CardsState>(builder: (context, state) {
                return state.when(
                    loading: () => const LoadingSliver(),
                    emptyList: () => const EmptyCardList(),
                    failed: (message) => ErrorSliver(
                          onPressed: () {
                            context
                                .read<CardsBloc>()
                                .add(const CardsEvent.getCards());
                          },
                          message: message,
                        ),
                    success: (cards) => LoadedCardList(cards: cards));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
