import 'package:flutter/material.dart';
import '../../../models/coin.dart';

class CryptoListCell extends StatelessWidget {
  const CryptoListCell({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          // Coin image
          SizedBox(
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
          ),
          const Spacer(),
          // Column with price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${coin.currentPrice}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                "${coin.marketCapChangePercentage24H}%",
                style: TextStyle(
                  color: coin.marketCapChangePercentage24H >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
