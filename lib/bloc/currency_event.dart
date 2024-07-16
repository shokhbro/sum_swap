import 'package:equatable/equatable.dart';

abstract class CurrencyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCurrencies extends CurrencyEvent {}
