import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

final salesRef = db.collection('sales');
final settingsRef = db.collection('settings');
