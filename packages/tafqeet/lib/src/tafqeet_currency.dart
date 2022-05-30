import 'dart:convert';

import 'package:equatable/equatable.dart';

class TafqeetCurrency extends Equatable {
  final String currency;
  final String currencyMultiple;
  final String currencyPlural;
  final int currncyFrcDigits;
  final String currencyFrc;
  final String currencyFrcMultiple;
  final String currencyFrcPlural;
  final String gender;
  final String country;
  TafqeetCurrency({
    required this.currency,
    required this.currencyMultiple,
    required this.currencyPlural,
    required this.currncyFrcDigits,
    required this.currencyFrc,
    required this.currencyFrcMultiple,
    required this.currencyFrcPlural,
    required this.gender,
    required this.country,
  });

  TafqeetCurrency copyWith({
    String? currency,
    String? currencyMultiple,
    String? currencyPlural,
    int? currncyFrcDigits,
    String? currencyFrc,
    String? currencyFrcMultiple,
    String? currencyFrcPlural,
    String? gender,
    String? country,
  }) {
    return TafqeetCurrency(
      currency: currency ?? this.currency,
      currencyMultiple: currencyMultiple ?? this.currencyMultiple,
      currencyPlural: currencyPlural ?? this.currencyPlural,
      currncyFrcDigits: currncyFrcDigits ?? this.currncyFrcDigits,
      currencyFrc: currencyFrc ?? this.currencyFrc,
      currencyFrcMultiple: currencyFrcMultiple ?? this.currencyFrcMultiple,
      currencyFrcPlural: currencyFrcPlural ?? this.currencyFrcPlural,
      gender: gender ?? this.gender,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'currency': currency});
    result.addAll({'currencyMultiple': currencyMultiple});
    result.addAll({'currencyPlural': currencyPlural});
    result.addAll({'currncyFrcDigits': currncyFrcDigits});
    result.addAll({'currencyFrc': currencyFrc});
    result.addAll({'currencyFrcMultiple': currencyFrcMultiple});
    result.addAll({'currencyFrcPlural': currencyFrcPlural});
    result.addAll({'gender': gender});
    result.addAll({'country': country});

    return result;
  }

  factory TafqeetCurrency.fromMap(Map<String, dynamic> map) {
    return TafqeetCurrency(
      currency: map['currency'] ?? '',
      currencyMultiple: map['currencyMultiple'] ?? '',
      currencyPlural: map['currencyPlural'] ?? '',
      currncyFrcDigits: map['currncyFrcDigits']?.toInt() ?? 0,
      currencyFrc: map['currencyFrc'] ?? '',
      currencyFrcMultiple: map['currencyFrcMultiple'] ?? '',
      currencyFrcPlural: map['currencyFrcPlural'] ?? '',
      gender: map['gender'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TafqeetCurrency.fromJson(String source) =>
      TafqeetCurrency.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TafqeetCurrency(currency: $currency, currencyMultiple: $currencyMultiple, currencyPlural: $currencyPlural, currncyFrcDigits: $currncyFrcDigits, currencyFrc: $currencyFrc, currencyFrcMultiple: $currencyFrcMultiple, currencyFrcPlural: $currencyFrcPlural, gender: $gender, country: $country)';
  }

  @override
  List<Object> get props {
    return [
      currency,
      currencyMultiple,
      currencyPlural,
      currncyFrcDigits,
      currencyFrc,
      currencyFrcMultiple,
      currencyFrcPlural,
      gender,
      country,
    ];
  }
}
