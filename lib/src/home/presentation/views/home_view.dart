import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/home/presentation/widgets/custom_drawer.dart';

import '../../../../core/utils/constants/size_constatnts.dart';
import '../../../profile/presentation/app/user_info_bloc/user_info_bloc.dart';
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
  static const _scrollThreshold = .70;
  late final ScrollController _scrollController;

  @override
  void initState() {
    if (widget.shouldGetAppData) {
      context.read<AppRedirectionBloc>().add(
            GetAppData(context: context),
          );
    }

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * _scrollThreshold &&
        !_scrollController.position.outOfRange) {
      context.read<CardsBloc>().add(const CardsEvent.getCards());
    }
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
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                return state.when(
                  loading: () => const LoadingSliver(),
                  failed: (message) => ErrorSliver(
                    onPressed: () {
                      context
                          .read<UserInfoBloc>()
                          .add(const UserInfoEvent.getUserInfo());
                    },
                    message: message,
                  ),
                  success: (user) => BlocBuilder<CardsBloc, CardsState>(
                      builder: (context, state) {
                    return state.when(
                        initial: () => const LoadingSliver(),
                        loading: (cards, currentPage, maxPage) {
                          if (cards.isEmpty) {
                            return const LoadingSliver();
                          } else {
                            return LoadedCardList(
                              isLoading: true,
                              cards: cards,
                              userId: user.id,
                            );
                          }
                        },
                        emptyList: () => const EmptyCardList(),
                        failed: (message, cards, currentPage, maxPage) =>
                            ErrorSliver(
                              onPressed: () {
                                context
                                    .read<CardsBloc>()
                                    .add(const CardsEvent.getCards());
                              },
                              message: message,
                            ),
                        success: (cards, currentPage, maxPage) =>
                            LoadedCardList(
                              isLoading: false,
                              cards: cards,
                              userId: user.id,
                            ));
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
