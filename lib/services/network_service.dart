import 'dart:async';
import 'package:crypto_app/models/coin.dart';
import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio;

  NetworkService()
      : _dio = Dio(
          BaseOptions(
              baseUrl: 'https://api.coingecko.com/api/v3',
              contentType: 'application/json',
              connectTimeout: const Duration(seconds: 10)),
        );

  Future<List<Coin>> fetchCoins({
    required String vsCurrency,
    required String order,
    required int perPage,
    required int page,
    required bool sparkline,
    required String priceChangePercentage,
    required String locale,
  }) async {
    try {
      final responce = await _dio.get('/coins/markets', queryParameters: {
        "vs_currency": vsCurrency,
        "order": order,
        "per_page": perPage,
        "page": page,
        "sparkline": sparkline,
        "price_change_percentage": priceChangePercentage,
        "locale": locale,
      });

      if (responce.statusCode == 200) {
        final data = responce.data as List;
        return data.map((json) => Coin.fromJson(json)).toList();
      } else {
        throw Exception("Bad status code: ${responce.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
