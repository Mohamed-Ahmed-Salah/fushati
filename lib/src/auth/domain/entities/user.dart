import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';


class User extends Equatable {
  final int customerStatus;
  final String apiToken;
  final CustomerModel customer;

  User({
    required this.customerStatus,
    required this.apiToken,
    required this.customer,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Customer {
  final int id;
  final String username;
  final DateTime birthdate;
  final String gender;
  final String walletAmount;
  final String email;
  final String phone;
  final dynamic workplace;

  Customer({
    required this.id,
    required this.username,
    required this.birthdate,
    required this.gender,
    required this.walletAmount,
    required this.email,
    required this.phone,
    required this.workplace,
  });
}

//
//
// class User extends Equatable {
//   final int customerStatus;
//   final String apiToken;
//   final int id;
//   final String name;
//
//   User({
//     required this.name,
//     required this.id,
//     required this.customerStatus,
//     required this.apiToken,
//   });
//
//   @override
//   List<dynamic> get props => [id, customerStatus, apiToken, name];
// }
