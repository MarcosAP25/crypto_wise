import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/infracstructure/controllers/coin_controller.dart';
import 'package:crypto_wise/presentation/screens/coin_details/coin_details_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinDetailsScreen extends StatelessWidget {
  static const String name = 'coin-details';

  
  const CoinDetailsScreen({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Get.textTheme;
    Coin coin = Get.arguments['coin'];
    
    CoinController coinCtrl = CoinController();
    Future<Coin> coinDetails = coinCtrl.getCoinDetails(coin.uuid);
    

    return SafeArea(
      child: FutureBuilder(
        future: coinDetails,
        builder: (context, snapshot) {
          
          if(snapshot.connectionState == ConnectionState.done){
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  coin.name!,
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                centerTitle: true,
              ),
              body: GetBuilder<CoinController>(
                builder: (controller) {
                  return CoinDetailsBodyScreen(
                    coin: snapshot.data!,
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      )
    );
  }
}