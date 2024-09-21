import 'dart:convert';

class SettingsModel {
  final int invoiceNumber;
  SettingsModel({
    required this.invoiceNumber,
  });

  SettingsModel copyWith({
    int? invoiceNumber,
  }) {
    return SettingsModel(
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceNumber': invoiceNumber,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      invoiceNumber: map['invoiceNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) =>
      SettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SettingsModel(invoiceNumber: $invoiceNumber)';
}
