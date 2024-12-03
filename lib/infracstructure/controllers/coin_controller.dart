import 'package:crypto_wise/domain/datasources/coins_datasource.dart';
import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/domain/entities/coin_price_history.dart';
import 'package:crypto_wise/infracstructure/datasources/coins_datasource_impl.dart';
import 'package:crypto_wise/infracstructure/repositories/coins_repository_impl.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CoinController  extends GetxController{

  RxList<Coin> _listOfCoins = <Coin>[].obs;
  List<Coin> get lisOfCoins => _listOfCoins.value;
  List<CoinPriceHistory> currenCoinPriceHistory = [];

  Future<void> getListOfCoins() async {
    EasyLoading.show(status: 'Cargando');
    final CoinsDatasource datasource = CoinsDatasourceImpl();

    _listOfCoins.value = await CoinsRepositoryImpl(datasource: datasource).getListOfCoins();

    getMostPopularCoins();
    EasyLoading.dismiss();
    
  }

  List<Coin> getMostPopularCoins(){
    List<Coin> mostPopularCoins = _listOfCoins.value.getRange(0, 5).toList();
    
    return mostPopularCoins;
  }

  Future<Coin> getCoinDetails(String coinUuid) async {

    EasyLoading.show(status: 'Cargando');
    final CoinsDatasource datasource = CoinsDatasourceImpl();

    Coin coin = await CoinsRepositoryImpl(datasource: datasource).getCoinDetails(coinUuid);
    EasyLoading.dismiss();

    return coin;
  }

  Future<List<CoinPriceHistory>> getCoinPriceHistory(String coinUuid) async {
     
    final CoinsDatasource datasource = CoinsDatasourceImpl();

    List<CoinPriceHistory> coinPriceHistory = await CoinsRepositoryImpl(datasource: datasource).getCoinPriceHistory(coinUuid);
    currenCoinPriceHistory = coinPriceHistory;

    return coinPriceHistory;
  }
}