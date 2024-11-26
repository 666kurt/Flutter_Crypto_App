import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/features.dart';
import '../services/network_service.dart';
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
      home: BlocProvider(
        create: (context) =>
            CoinsBloc(NetworkService())..add(FetchCoinsEvent()),
        child: CryptoListScreen(),
      ),
    );
  }
}
