import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_event.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoinsBloc, CoinsState>(
        builder: (context, state) {
          if (state is CoinsLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is CoinsErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is CoinsSuccessState) {
            final coins = state.coins;
            return CustomScrollView(
              slivers: [
                // AppBar
                const CustomSliverAppBar(),

                // Refresh indicator
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    context
                        .read<CoinsBloc>()
                        .add(const RefreshCoinsEvent(vsCurrency: "usd"));
                  },
                  builder: (
                    BuildContext context,
                    RefreshIndicatorMode refreshState,
                    double pulledExtent,
                    double refreshTriggerPullDistance,
                    double refreshIndicatorExtent,
                  ) {
                    return CupertinoSliverRefreshControl.buildRefreshIndicator(
                      context,
                      refreshState,
                      pulledExtent,
                      refreshTriggerPullDistance,
                      refreshIndicatorExtent,
                    );
                  },
                ),

                // ListView
                SliverList.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          // Coin image
                          Container(
                            width: 32,
                            height: 32,
                            child: Image.network(coin.image),
                          ),
                          const SizedBox(width: 8),
                          // Column with title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coin.symbol.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                coin.name,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
