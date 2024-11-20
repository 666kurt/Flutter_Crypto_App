import 'package:flutter/material.dart';
import '../features/features.dart';
import '../theme/app_theme.dart';

void main() {
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const CryptoListScreen(),
    );
  }
}
