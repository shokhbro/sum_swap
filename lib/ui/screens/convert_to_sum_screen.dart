import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_converter/bloc/currency_bloc.dart';
import 'package:test_converter/bloc/currency_event.dart';
import 'package:test_converter/bloc/currency_state.dart';
import 'package:test_converter/data/repository/currency_repository.dart';

class ConvertToSumScreen extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert to UZS'),
      ),
      body: BlocProvider(
        create: (context) =>
            CurrencyBloc(CurrencyRepository())..add(FetchCurrencies()),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Expanded(child: BlocBuilder<CurrencyBloc, CurrencyState>(
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
                          onTap: () {
                            final amount =
                                double.tryParse(_amountController.text) ?? 0;
                            final convertedAmount =
                                amount * currencies[index].cbPrice;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      '${amount.toStringAsFixed(2)} ${currencies[index].code} = ${convertedAmount.toStringAsFixed(2)} UZS'),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  } else if (state is CurrencyError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('Something went wrong!'));
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
