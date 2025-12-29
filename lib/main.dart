import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_theme.dart';
import 'package:tech_check_app/pages/product_list/product_list_page.dart';
import 'package:tech_check_app/presentation/debug/design_system_preview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Check',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ProductListPage();
  }
}
