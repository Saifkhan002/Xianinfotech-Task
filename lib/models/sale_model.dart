// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SaleModel {
  final String billingName;
  final DateTime timestamp;
  final int invoiceNumber;
  final double total;
  final double balance;
  final String id;
  final List<ItemModel> items;

  SaleModel({
    required this.billingName,
    required this.timestamp,
    required this.invoiceNumber,
    required this.total,
    required this.balance,
    required this.id,
    required this.items,
  });

  SaleModel copyWith({
    String? billingName,
    DateTime? timestamp,
    int? invoiceNumber,
    double? total,
    double? balance,
    String? id,
    List<ItemModel>? items,
  }) {
    return SaleModel(
      billingName: billingName ?? this.billingName,
      timestamp: timestamp ?? this.timestamp,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      total: total ?? this.total,
      balance: balance ?? this.balance,
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'billingName': billingName,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'invoiceNumber': invoiceNumber,
      'total': total,
      'balance': balance,
      'id': id,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      billingName: map['billingName'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
      invoiceNumber: map['invoiceNumber'] as int,
      total: map['total'] as double,
      balance: map['balance'] as double,
      id: map['id'] as String,
      items: List<ItemModel>.from(
        (map['items'] as List<int>).map<ItemModel>(
          (x) => ItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) =>
      SaleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SaleModel(billingName: $billingName, timestamp: $timestamp, invoiceNumber: $invoiceNumber, total: $total, balance: $balance, id: $id, items: $items)';
  }

  @override
  bool operator ==(covariant SaleModel other) {
    if (identical(this, other)) return true;

    return other.billingName == billingName &&
        other.timestamp == timestamp &&
        other.invoiceNumber == invoiceNumber &&
        other.total == total &&
        other.balance == balance &&
        other.id == id &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return billingName.hashCode ^
        timestamp.hashCode ^
        invoiceNumber.hashCode ^
        total.hashCode ^
        balance.hashCode ^
        id.hashCode ^
        items.hashCode;
  }
}

class ItemModel {
  final String itemName;
  ItemModel({
    required this.itemName,
  });

  ItemModel copyWith({
    String? itemName,
  }) {
    return ItemModel(
      itemName: itemName ?? this.itemName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      itemName: map['itemName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemModel(itemName: $itemName)';

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName;
  }

  @override
  int get hashCode => itemName.hashCode;
}
