import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xaininfotect_task/providers/sale_provider.dart';
import 'package:xaininfotect_task/providers/settings_provider.dart';
import 'screens/tnx_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => SaleProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Xianinfotech LLC',
        home: TnxDashboard(),
      ),
    );
  }
}
