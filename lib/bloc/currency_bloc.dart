import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_converter/data/repository/currency_repository.dart';
import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository currencyRepository;

  CurrencyBloc(this.currencyRepository) : super(CurrencyInitial()) {
    on<FetchCurrencies>((event, emit) async {
      emit(CurrencyLoading());
      try {
        final currencies = await currencyRepository.fetchCurrencies();
        emit(CurrencyLoaded(currencies));
      } catch (e) {
        emit(CurrencyError(e.toString()));
      }
    });
  }
}
