import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/domain/entities/coin_price_history.dart';

abstract class CoinsDatasource {

  Future<List<Coin>> getListOfCoins();
  Future<Coin> getCoinDetails(String coinUuid);
  Future<List<CoinPriceHistory>> getCoinPriceHistory(String coinUuid);
}