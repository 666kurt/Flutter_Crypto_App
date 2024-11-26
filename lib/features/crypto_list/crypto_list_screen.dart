import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class CryptoListScreen extends StatelessWidget {
  CryptoListScreen({super.key});

  // Widgets properties
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoinsBloc, CoinsState>(
        builder: (context, state) {
          if (state is CoinsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CoinsErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is CoinsSuccessState) {
            final coins = state.coins;
            return CustomScrollView(
              slivers: [
                // AppBar
                CustomSliverAppBar(searchText: searchText),
                // ListView
                SliverList.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    return Text(
                      coin.name,
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
