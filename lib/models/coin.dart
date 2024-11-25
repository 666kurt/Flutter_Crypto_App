class Coin {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  int fullyDilutedValuation;
  int totalVolume;
  double high24H;
  double low24H;
  double priceChange24H;
  double priceChangePercentage24H;
  double marketCapChange24H;
  double marketCapChangePercentage24H;
  DateTime lastUpdated;
  double priceChangePercentage24HInCurrency;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.lastUpdated,
    required this.priceChangePercentage24HInCurrency,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"]?.toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"],
        high24H: json["high_24h"]?.toDouble(),
        low24H: json["low_24h"]?.toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble(),
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
        priceChangePercentage24HInCurrency:
            json["price_change_percentage_24h_in_currency"]?.toDouble(),
      );
}
