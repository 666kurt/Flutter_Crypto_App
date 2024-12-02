// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:crypto_app/features/crypto_details/crypto_details_screen.dart'
    as _i1;
import 'package:crypto_app/features/crypto_list/crypto_list_screen.dart' as _i2;
import 'package:crypto_app/models/coin.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.CryptoDetailsScreen]
class CryptoDetailsRoute extends _i3.PageRouteInfo<CryptoDetailsRouteArgs> {
  CryptoDetailsRoute({
    _i4.Key? key,
    required _i5.Coin coin,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CryptoDetailsRoute.name,
          args: CryptoDetailsRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CryptoDetailsRouteArgs>();
      return _i1.CryptoDetailsScreen(
        key: args.key,
        coin: args.coin,
      );
    },
  );
}

class CryptoDetailsRouteArgs {
  const CryptoDetailsRouteArgs({
    this.key,
    required this.coin,
  });

  final _i4.Key? key;

  final _i5.Coin coin;

  @override
  String toString() {
    return 'CryptoDetailsRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [_i2.CryptoListScreen]
class CryptoListRoute extends _i3.PageRouteInfo<void> {
  const CryptoListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CryptoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.CryptoListScreen();
    },
  );
}
