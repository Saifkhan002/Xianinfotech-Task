import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xaininfotect_task/globals.dart';
import 'package:xaininfotect_task/models/settings_model.dart';

class SettingsProvider with ChangeNotifier {
  late SettingsModel _settings;
  SettingsModel get settings => _settings;

  Future<void> fetchSettings() async {
    try {
      final snapshot = await settingsRef.doc('appSettings').get();
      _settings = SettingsModel.fromMap(snapshot.data()!);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<int> getInvoiceNumber() async {
    await fetchSettings();
    await settingsRef.doc('appSettings').update(
      {'invoiceNumber': FieldValue.increment(1)},
    );
    _settings = settings.copyWith(invoiceNumber: _settings.invoiceNumber + 1);
    notifyListeners();
    return _settings.invoiceNumber;
  }
}
