import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/bloc/crypto_list_event.dart';
import 'package:crypto_app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      title: const Text(
        "Cryptos",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: _buildSearchBar(context),
        ),
      ),
    );
  }

  // CustomSearchBar
  Widget _buildSearchBar(BuildContext context) {
    // Widgets properties
    final TextEditingController searchText = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Icon
          Icon(
            CupertinoIcons.search,
            color: searchText.text.isEmpty
                ? AppColors.accentColor
                : AppColors.primaryColor,
          ),
          const SizedBox(width: 16),
          // Divider
          Container(
            color: AppColors.accentColor,
            width: 0.5,
            height: 16,
          ),
          const SizedBox(width: 16),
          // TextField
          Expanded(
            child: CupertinoTextField(
              autocorrect: false,
              controller: searchText,
              onChanged: (value) {
                context.read<CoinsBloc>().add(SearchCoinsEvent(value: value));
              },
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              placeholder: "Search Coins",
              placeholderStyle: TextStyle(
                color: AppColors.accentColor,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
