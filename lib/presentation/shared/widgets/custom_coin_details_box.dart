import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/presentation/shared/widgets/custom_change_badge.dart';
import 'package:crypto_wise/presentation/shared/widgets/custom_img_container.dart';
import 'package:crypto_wise/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCoinDetailsBox extends StatelessWidget {
  final Coin coin;
  const CustomCoinDetailsBox({
    super.key,
    required this.coin
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Get.textTheme;


    int setCoinColor(String hexColor){
      String newHexColor = hexColor.split('#').last;

      if(newHexColor.length < 6) return 0xFF000000;

      int intColor = int.parse('0xFF${newHexColor}'); 

      return intColor;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImgContainer(
                imageUrl: coin.iconUrl,
                width: 45,
              ),
              const Gap(12),
              Text(
                coin.name!,
                style:  textTheme.bodyLarge!.copyWith(
                  color: Color(setCoinColor(coin.color!))
                ),
              ),
              const Spacer(),
              CustomChangeBadge(changeRate: double.parse(coin.change!))            ],
          ),
          const Gap(16),
          Text(
            '\$${Utils().currencyFormatter(double.parse(coin.price!,), decimals: 8)}',
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 24
            ),
          ),
          const Gap(8),
          // Text(
          //   'Market Cap: \$${Utils().currencyFormatter(double.parse(coin.marketCap!))}',
          //   style: textTheme.labelLarge!.copyWith(
          //     color: Colors.grey.shade700
          //   ),
          // ),
          Text(
            '${coin.description}',
            style: textTheme.labelLarge!.copyWith(
              color: Colors.grey.shade700
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () async{
                  try{
                    Uri url = Uri.parse(coin.websiteUrl!);
                    print(url);

                    if (!await launchUrl(url,)) {
                      throw Exception('Could not launch $url');
                    }
                  }catch(e){
                    print(e.toString());
                  }
                }, 
                icon: const Icon(Icons.link_rounded),
                label: Text('Visit')
              ),
              
            ],
          )
        ],
      )
    );
  }
}