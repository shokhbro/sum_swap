import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_converter/bloc/currency_bloc.dart';
import 'package:test_converter/bloc/currency_event.dart';
import 'package:test_converter/data/repository/currency_repository.dart';
import 'package:test_converter/ui/screens/currencylist_screen.dart';


class CurrencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: BlocProvider(
        create: (context) =>
            CurrencyBloc(CurrencyRepository())..add(FetchCurrencies()),
        child: CurrencyList(),
      ),
    );
  }
}
