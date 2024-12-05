import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/features/crypto_details/widgets/coin_data_row.dart';
import 'package:crypto_app/models/coin.dart';
import 'package:crypto_app/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CryptoDetailsScreen extends StatelessWidget {
  const CryptoDetailsScreen({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Markets",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14.5),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // Main column with content
            Column(
              children: [
                // Section with header
                _buildHeaderSection(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(color: AppColors.appBarColor),
                ),

                // Section with data
                _buildDataSection(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(color: AppColors.appBarColor),
                ),

                // Section with chart
                AspectRatio(
                  aspectRatio: 1.5,
                  child: LineChart(
                    LineChartData(
                      // Линия графика
                      lineBarsData: [
                        LineChartBarData(
                          spots: coin.sparklineIn7D.price.asMap().entries.map(
                            (price) {
                              return FlSpot(
                                price.key.toDouble() + 1,
                                price.value,
                              );
                            },
                          ).toList(),
                          isCurved: true,
                          barWidth: 1,
                          color: AppColors.primaryColor,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(
                            show: false,
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppColors.primaryColor.withOpacity(0.1),
                          ),
                        ),
                      ],
                      // Сетка графика
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            strokeWidth: 1,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            strokeWidth: 1,
                          );
                        },
                      ),
                      // Рамка графика
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                      ),
                      // Заголовки графика
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 25,
                            maxIncluded: false,
                            getTitlesWidget: bottomTitleWidgets,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // Coin image
            Image.network(coin.image, width: 48),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value) {
      case >= 1 && < 24:
        text = const Text('ПН', style: style);
        break;
      case >= 24 && < 48:
        text = const Text('ВТ', style: style);
        break;
      case >= 48 && < 72:
        text = const Text('СР', style: style);
        break;
      case >= 72 && < 96:
        text = const Text('ЧТ', style: style);
        break;
      case >= 96 && < 120:
        text = const Text('ПТ', style: style);
        break;
      case >= 120 && < 144:
        text = const Text('СБ', style: style);
        break;
      case >= 144:
        text = const Text('ВС', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      fitInside: const SideTitleFitInsideData(
        enabled: true,
        distanceFromEdge: 10,
        parentAxisSize: 10,
        axisPosition: 0,
      ),
      child: text,
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${coin.name} (${coin.symbol.toUpperCase()})",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "\$${coin.currentPrice.toStringAsFixed(3)}",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                coin.priceChange24H >= 0
                    ? Icons.arrow_circle_up
                    : Icons.arrow_circle_down,
                color: coin.priceChange24H >= 0 ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                "${coin.priceChange24H.toStringAsFixed(3)} (${coin.marketCapChangePercentage24H.toStringAsFixed(2)}%)",
                style: TextStyle(
                  color: coin.priceChange24H >= 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDataSection(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.accentColor,
            ),
          ),
          const SizedBox(height: 8),
          CoinDataRow(title: "Current price", value: coin.currentPrice),
          const SizedBox(height: 16),
          CoinDataRow(title: "High price", value: coin.high24H),
          const SizedBox(height: 16),
          CoinDataRow(title: "Low price", value: coin.low24H),
        ],
      ),
    );
  }
}
