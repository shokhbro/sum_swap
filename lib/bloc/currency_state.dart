import 'package:equatable/equatable.dart';
import 'package:test_converter/data/model/currency.dart';

abstract class CurrencyState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencies;

  CurrencyLoaded(this.currencies);

  @override
  List<Object> get props => [currencies];
}

class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError(this.message);

  @override
  List<Object> get props => [message];
}
