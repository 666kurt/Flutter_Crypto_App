import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/models/coin.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CryptoDetailsScreen extends StatelessWidget {
  const CryptoDetailsScreen({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
