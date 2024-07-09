part of 'get_card_details_bloc.dart';

sealed class GetCardDetailsState extends Equatable {
  const GetCardDetailsState();
  
  @override
  List<Object> get props => [];
}

final class GetCardDetailsInitial extends GetCardDetailsState {}
