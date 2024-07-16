import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_converter/bloc/currency_bloc.dart';
import 'package:test_converter/bloc/currency_state.dart';


class CurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CurrencyLoaded) {
          final currencies = state.currencies;
          return ListView.builder(
            itemCount: currencies.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(currencies[index].title),
                subtitle: Text(
                    '1 ${currencies[index].code} = ${currencies[index].cbPrice} UZS'),
              );
            },
          );
        } else if (state is CurrencyError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
