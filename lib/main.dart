import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/splash.dart';
import 'package:flutter_application_14/core/storage/taskhiv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(taskhivAdapter());
  await Hive.openBox<task_hiv>('Task');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: splash_view());
  }
}
