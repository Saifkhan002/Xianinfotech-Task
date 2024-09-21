import 'package:flutter/material.dart';
import 'package:xaininfotect_task/firebase_options.dart';
import 'tnx_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xianinfotech LLC',
      home: const TnxDashboard(),
    );
  }
}
