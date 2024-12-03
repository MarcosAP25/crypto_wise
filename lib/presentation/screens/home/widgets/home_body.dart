import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/presentation/widgets.dart';
import 'package:crypto_wise/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../coin_details/coin_details_screen.dart';


class HomeBody extends StatelessWidget {

  final List<Coin> listOfCoins;
  final List<Coin> mostPopularCoins;

  const HomeBody({
    super.key,
    required this.listOfCoins,
    required this.mostPopularCoins,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Get.theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most popular',
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          Gap(6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...mostPopularCoins.map((coin) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: MostPopularBox(coin: coin),
                ))
              ],
            ),
          ),
          const Gap(24),
          Text(
            'Market',
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          ...listOfCoins.getRange(5, listOfCoins.length).map((coin){

            bool isPositive = double.parse(coin.change!) > 0 ? true : false;

            Color changeColor = isPositive ? Colors.green : Colors.orange;

            return ListTile(
              leading: CustomImgContainer(imageUrl: coin.iconUrl,),
              title: Text(
                coin.name ?? 'N/A',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                coin.symbol,
                style: textTheme.bodySmall,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${Utils().currencyFormatter(double.parse(coin.price!))}',
                    style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: Get.size.width * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon( 
                          isPositive 
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                          size: 15,
                          color: changeColor,
                        ),
                        Text(
                          '${coin.change}%',
                          style: textTheme.labelSmall!.copyWith(
                            
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              onTap: () {
                  var data = {
                    'coin': coin
                  };

                  Get.toNamed('/${CoinDetailsScreen.name}', arguments: data);
              },
              
            );
          }
          )
        ]
      ),
    );
  }
}