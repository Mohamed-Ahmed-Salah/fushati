import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/common/widgets/pagination_error_text.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/home/domain/entity/transaction.dart';
import 'package:fushati/src/manage_card/presentation/app/bloc/card_transaction_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/widgets/card_box.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../home/domain/entity/card.dart';
import '../../../home/presentation/widgets/error_sliver.dart';
import '../app/delete_card_bloc/delete_card_bloc.dart';
import '../widgets/delete_card_button.dart';
import '../widgets/top_up_button.dart';
import '../widgets/transaction_box.dart';
import '../widgets/transaction_history_text_row.dart';

class ManageCardView extends StatefulWidget {
  static String path = "/manage-new";
  static String name = "/manage-new";
  static String param = "card";
  final CardEntity card;

  const ManageCardView({super.key, required this.card});

  @override
  State<ManageCardView> createState() => _ManageCardViewState();
}

class _ManageCardViewState extends State<ManageCardView> {
  late TextEditingController controller;
  late final _formKey;
  static const _scrollThreshold = .70;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    controller = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<DeleteCardBloc>().add(const DeleteCardEvent.reset());

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
      context.read<CardTransactionBlocBloc>().add(GetCardTransactionEvent(
            cardNumber: widget.card.userCard,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              right: SizeConst.horizontalPadding,
              left: SizeConst.horizontalPadding,
              top: SizeConst.verticalPadding),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: SizeConst.verticalPadding),
                      CustomAppBar(
                        text: "${AppLocalizations.of(context)?.manageCard}",
                      ),
                      SizedBox(height: 5.h),
                      CardBox.withoutManage(
                        card: widget.card,
                      ),
                      SizedBox(height: SizeConst.verticalPadding),
                      Row(
                        children: [
                          TopUpButton(
                            card: widget.card,
                          ),
                          SizedBox(
                            width: SizeConst.horizontalPadding,
                          ),
                          DeleteCardButton(
                            card: widget.card,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConst.verticalPadding,
                      ),
                      const TransactionHistoryRowText(),
                    ],
                  ),
                ),
                BlocBuilder<CardTransactionBlocBloc, CardTransactionBlocState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () {
                        return const Center(
                            child: CustomCircularProgressIndicator());
                      },
                      loading: (transactions, _, __) => TransactionsLoading(
                        transactions: transactions,
                      ),
                      failed: (message, transactions, currentPage, ___) {
                        if (transactions.isEmpty) {
                          return ErrorSliver(
                            onPressed: () {
                              context.read<CardTransactionBlocBloc>().add(
                                      CardTransactionBlocEvent
                                          .getCardTransaction(
                                    cardNumber: widget.card.userCard,
                                  ));
                            },
                            message: message,
                          );
                        } else {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                if (index >= transactions.length) {
                                  return PaginationErrorText(
                                    message: message,
                                  );
                                }
                                Transaction transaction = transactions[index];
                                return TransactionBox(
                                  transaction: transaction,
                                  showDashSeparator:
                                      index < transactions.length - 1,
                                  isProfileTransaction: true,
                                );
                              },
                              childCount: transactions.length + 1,
                            ),
                          );
                        }
                      },
                      success: (transactions, _, __) => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            Transaction transaction = transactions[index];
                            return TransactionBox(
                              transaction: transaction,
                              showDashSeparator:
                                  index < transactions.length - 1,
                            );
                          },
                          // Adjusted childCount to include separators
                          childCount: transactions.length,
                        ),
                      ),
                    ); //
                  },
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: SizeConst.verticalPaddingFour,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionsLoading extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsLoading({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          int length = transactions.length;

          if (index == length) {
            return const Center(child: CustomCircularProgressIndicator());
          } else {
            Transaction transaction = transactions[index];
            return TransactionBox(
              transaction: transaction,
              showDashSeparator: index < length - 1,
            );
          }
        },
        childCount: transactions.length + 1,
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Transaction transaction = transactions[index];
          return TransactionBox(
              transaction: transaction,
              showDashSeparator: index < transactions.length - 1);
        },
        childCount: transactions.length,
      ),
    );
  }
}

class DottedLineSeparatedWidget extends StatelessWidget {
  const DottedLineSeparatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (subIndex) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
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
      ..color = Colors.black.withOpacity(0.1) // Color of the dashed line
      ..strokeWidth = 2;

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
