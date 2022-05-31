import 'dart:convert';

import 'package:equatable/equatable.dart';

class TafqeetCurrency extends Equatable {
  final String country;
  final String currency;
  final String currencyMultiple;
  final String currencyPlural;
  final String currencyGender;
  final int currncyFrcDigits;
  final String currencyFrc;
  final String currencyFrcMultiple;
  final String currencyFrcPlural;
  final String currencyFrcGender;
  TafqeetCurrency({
    required this.currency,
    required this.currencyMultiple,
    required this.currencyPlural,
    required this.currencyGender,
    required this.currncyFrcDigits,
    required this.currencyFrc,
    required this.currencyFrcMultiple,
    required this.currencyFrcPlural,
    required this.currencyFrcGender,
    required this.country,
  });

  TafqeetCurrency copyWith({
    String? currency,
    String? currencyMultiple,
    String? currencyPlural,
    String? currencyGender,
    int? currncyFrcDigits,
    String? currencyFrc,
    String? currencyFrcMultiple,
    String? currencyFrcPlural,
    String? currencyFrcGender,
    String? country,
  }) {
    return TafqeetCurrency(
      currency: currency ?? this.currency,
      currencyMultiple: currencyMultiple ?? this.currencyMultiple,
      currencyPlural: currencyPlural ?? this.currencyPlural,
      currencyGender: currencyGender ?? this.currencyGender,
      currncyFrcDigits: currncyFrcDigits ?? this.currncyFrcDigits,
      currencyFrc: currencyFrc ?? this.currencyFrc,
      currencyFrcMultiple: currencyFrcMultiple ?? this.currencyFrcMultiple,
      currencyFrcPlural: currencyFrcPlural ?? this.currencyFrcPlural,
      currencyFrcGender: currencyFrcGender ?? this.currencyFrcGender,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'currency': currency});
    result.addAll({'currencyMultiple': currencyMultiple});
    result.addAll({'currencyPlural': currencyPlural});
    result.addAll({'currencyGender': currencyGender});
    result.addAll({'currncyFrcDigits': currncyFrcDigits});
    result.addAll({'currencyFrc': currencyFrc});
    result.addAll({'currencyFrcMultiple': currencyFrcMultiple});
    result.addAll({'currencyFrcPlural': currencyFrcPlural});
    result.addAll({'currencyFrcGender': currencyFrcGender});
    result.addAll({'country': country});

    return result;
  }

  factory TafqeetCurrency.fromMap(Map<String, dynamic> map) {
    return TafqeetCurrency(
      currency: map['currency'] ?? '',
      currencyMultiple: map['currencyMultiple'] ?? '',
      currencyPlural: map['currencyPlural'] ?? '',
      currencyGender: map['currencyGender'] ?? '',
      currncyFrcDigits: map['currncyFrcDigits']?.toInt() ?? 0,
      currencyFrc: map['currencyFrc'] ?? '',
      currencyFrcMultiple: map['currencyFrcMultiple'] ?? '',
      currencyFrcPlural: map['currencyFrcPlural'] ?? '',
      currencyFrcGender: map['currencyFrcGender'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TafqeetCurrency.fromJson(String source) =>
      TafqeetCurrency.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TafqeetCurrency(currency: $currency, currencyMultiple: $currencyMultiple, currencyPlural: $currencyPlural, currencyGender: $currencyGender, currncyFrcDigits: $currncyFrcDigits, currencyFrc: $currencyFrc, currencyFrcMultiple: $currencyFrcMultiple, currencyFrcPlural: $currencyFrcPlural, currencyFrcGender: $currencyFrcGender, country: $country)';
  }

  @override
  List<Object> get props {
    return [
      currency,
      currencyMultiple,
      currencyPlural,
      currencyGender,
      currncyFrcDigits,
      currencyFrc,
      currencyFrcMultiple,
      currencyFrcPlural,
      currencyFrcGender,
      country,
    ];
  }
}
