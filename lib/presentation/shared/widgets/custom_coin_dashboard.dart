import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/domain/entities/coin_price_history.dart';
import 'package:crypto_wise/infracstructure/controllers/coin_controller.dart';
import 'package:crypto_wise/presentation/widgets.dart';
import 'package:crypto_wise/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCoinDashboard extends StatefulWidget {
  final Coin coin;
  const CustomCoinDashboard({
    super.key,
    required this.coin
  });

  @override
  State<CustomCoinDashboard> createState() => _CustomCoinDashboardState();
}

class _CustomCoinDashboardState extends State<CustomCoinDashboard> {
  @override
  Widget build(BuildContext context) {

    final textTheme = Get.textTheme;
    final colors = Get.theme.colorScheme;
    CoinController coinCtrl = CoinController();
    Future<List<CoinPriceHistory>> coinPriceHistory = coinCtrl.getCoinPriceHistory(widget.coin.uuid);
    

    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     // Text(
          //     //   widget.coin.name!,
          //     //   style: textTheme.bodyLarge!.copyWith(
          //     //     color: Colors.grey,
          //     //     fontWeight: FontWeight.w100
          //     //   ),
          //     // ),
          //     Text(
          //       ' (${widget.coin.symbol})',
          //       style: textTheme.bodyMedium!.copyWith(
          //         color: Colors.grey,
          //         fontWeight: FontWeight.w100
          //       ),
          //     ),
          //   ],
          // ),
           Text(
            '\$${Utils().currencyFormatter(double.parse(widget.coin.price!))}',
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
            
            ),
          ),
          Row(
            children: [
              Text(
                'Vol: ',
                style: textTheme.labelLarge!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w100
                ),
              ),
              Text(
                '\$${Utils().currencyFormatter(double.parse(widget.coin.the24HVolume!))}',
                style: textTheme.labelLarge!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w100
                ),
              ),
            ],
          ),
          Expanded(child: Container(
            child: FutureBuilder(
              future: coinPriceHistory, 
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){

                  List<FlSpot> valores = snapshot.data!.asMap().entries.map<FlSpot>((coin,) => FlSpot(coin.key.toDouble() , double.parse(coin.value.price))).toList();

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 900,
                      width: valores.length * 10,
                      child: LineChart(
                                LineChartData(
                                  
                                  gridData: const FlGridData(show: true),
                                  titlesData: const FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: true),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: true)
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false)
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: true),
                                    ),
                                  ),
                                  borderData: FlBorderData(show: true),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: valores,
                                      isCurved: true,
                                      color:colors.primary,
                                      barWidth: 2,
                                      isStrokeCapRound: false,
                                      
                                      belowBarData: BarAreaData(show: false),
                                    ),
                                  ],
                                ),
                              ),
                    ),
                  );
            
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          )),
          CustomDayRange()
        ],
      )
    );
  }
}