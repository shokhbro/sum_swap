class Currency {
  final String title;
  final String code;
  final double cbPrice;
  final String date;

  Currency(
      {required this.title,
      required this.code,
      required this.cbPrice,
      required this.date});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      title: json['title'],
      code: json['code'],
      cbPrice: double.parse(json['cb_price']),
      date: json['date'],
    );
  }
}
