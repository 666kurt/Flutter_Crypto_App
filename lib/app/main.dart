import 'package:crypto_app/app/app_router.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

void main() {
  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  CryptoApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
