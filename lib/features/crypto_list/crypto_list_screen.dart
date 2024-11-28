import 'package:crypto_app/features/crypto_details/crypto_details_screen.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_event.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_state.dart';
import 'package:crypto_app/theme/app_colors.dart';
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
            return Center(
              child: CupertinoActivityIndicator(color: AppColors.primaryColor),
            );
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
                SliverList.separated(
                  itemCount: coins.length,
                  separatorBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Divider(color: AppColors.appBarColor),
                      )),
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    // Cell of list
                    return GestureDetector(
                      child: CryptoListCell(coin: coin),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) =>
                                CryptoDetailsScreen(coin: coin),
                          ),
                        );
                      },
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
