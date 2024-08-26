import 'package:equatable/equatable.dart';
import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class AddCard extends UsecaseWithParams<void, AddNewCardParams> {
  const AddCard(this._repo);

  final CardRepo _repo;

  @override
  ResultFuture<void> call(AddNewCardParams params) => _repo.addCard(
      cardNumber: params.cardNumber,
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      studentNumber: params.studentNumber);
}

class AddNewCardParams extends Equatable {
  const AddNewCardParams({
    required this.email,
    required this.cardNumber,
    required this.studentNumber,
    required this.phoneNumber,
    required this.name,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final String cardNumber;
  final String studentNumber;

  @override
  List<dynamic> get props => [
        name,
        email,
        phoneNumber,
      ];
}
