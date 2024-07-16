import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_converter/data/model/currency.dart';

class CurrencyRepository {
  final String apiUrl = 'https://nbu.uz/uz/exchange-rates/json/';

  Future<List<Currency>> fetchCurrencies() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Currency> currencies =
          body.map((dynamic item) => Currency.fromJson(item)).toList();
      return currencies;
    } else {
      throw Exception('Failed to load currencies');
    }
  }
}
