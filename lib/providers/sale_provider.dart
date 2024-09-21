import 'package:flutter/material.dart';
import 'package:xaininfotect_task/globals.dart';
import 'package:xaininfotect_task/models/sale_model.dart';

class SaleProvider extends ChangeNotifier {
  List<SaleModel> _sales = [];
  List<SaleModel> get sales => _sales;

  Future<void> fetchSales() async {
    final querySnapshot = await salesRef.get();
    _sales =
        querySnapshot.docs.map((doc) => SaleModel.fromMap(doc.data())).toList();
    notifyListeners();
  }

  Future<void> saveSale(SaleModel sale) async {
    _sales.add(sale);
    await salesRef.doc(sale.id).set(sale.toMap());
  }
}
