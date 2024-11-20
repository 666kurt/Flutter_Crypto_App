import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar
          CustomSliverAppBar(),
          // ListView
        ],
      ),
    );
  }
}
