import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class CryptoListScreen extends StatelessWidget {
  CryptoListScreen({super.key});

  // Widgets properties
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar
          CustomSliverAppBar(searchText: searchText),
          // ListView
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container();
            },
          )
        ],
      ),
    );
  }
}
