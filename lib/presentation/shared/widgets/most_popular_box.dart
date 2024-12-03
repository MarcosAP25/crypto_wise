
import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/presentation/screens.dart';
import 'package:crypto_wise/presentation/widgets.dart';
import 'package:crypto_wise/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MostPopularBox extends StatelessWidget {

  final Coin coin;

  const MostPopularBox({
    super.key,
    required this.coin
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Get.theme.textTheme;
    // final colors = Get.theme.colorScheme;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
       borderRadius: BorderRadius.circular(12),
        onTap: () {

          var data = {
            'coin': coin
          };

          Get.toNamed('/${CoinDetailsScreen.name}', arguments: data);
        },
        child: Container(
          // margin: EdgeInsets.only(bottom: 15, right: 2, left: 8),
          padding: const EdgeInsets.only(left: 12, top: 18, bottom: 18, right: 45),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     blurRadius: 8,
                
            //     offset: Offset(2, 4)
            //   )
            // ]
          ),
          width: Get.size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 45,
                height: 45,
                child: SvgPicture.network(coin.iconUrl!, fit: BoxFit.contain,),
              ),
              const Gap(18),
              
              Row(
                children: [
                  Text(
                    coin.name ?? '',
                    style: textTheme.bodySmall,
                  ),
                  const Gap(8),
                  CustomChangeBadge(
                    changeRate: double.parse(coin.change!)
                  )
                ],
              ),
              
        
              const Gap(4),
              Text(
                '\$${Utils().currencyFormatter(double.parse(coin.price!))}',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                coin.symbol,
                style: textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}