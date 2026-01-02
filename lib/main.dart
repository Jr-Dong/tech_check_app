import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_theme.dart';
import 'package:tech_check_app/pages/product_list/product_list_page.dart';

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


// StatelessWidget 으로 변경
// 상태를 바꾸기 위한 여러 코드들이 존재
// 조금 더 무거움
// MyHomePage 불필요해보임.
// MaterialApp의 Home 속성에 ProductListPage 넣기!
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
