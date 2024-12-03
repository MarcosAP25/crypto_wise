import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/infracstructure/controllers/coin_controller.dart';
import 'package:crypto_wise/presentation/screens/home/widgets/home_body.dart';
import 'package:crypto_wise/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    CoinController coinsCtrl = CoinController();
    var resutl = coinsCtrl.getListOfCoins();

    return Scaffold(
      appBar: CustomAppBar(),
      body: GetBuilder<CoinController>(
        init: coinsCtrl,
        builder: (ctrl) {
          return FutureBuilder(
            future: resutl, 
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.connectionState == ConnectionState.done){

                List<Coin> mostPopular = ctrl.getMostPopularCoins();
                return RefreshIndicator(
                  onRefresh: ctrl.getListOfCoins,
                  child: ListView(
                    children: [
                      HomeBody(
                        listOfCoins: ctrl.lisOfCoins,
                        mostPopularCoins: mostPopular,
                      ),
                    ],
                  ),
                );
              }


              return Text('Error');
            },
          );
        },
      )
    );
  }
}