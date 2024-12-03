import 'package:crypto_wise/domain/datasources/coins_datasource.dart';
import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/domain/entities/coin_price_history.dart';
import 'package:crypto_wise/domain/repositories/coins_repository.dart';

class CoinsRepositoryImpl  extends CoinsRepository {

  final CoinsDatasource datasource;

  CoinsRepositoryImpl({
    required this.datasource
  });

  @override
  Future<Coin> getCoinDetails(String coinUuid) {
    return datasource.getCoinDetails(coinUuid);
  }

  @override
  Future<List<CoinPriceHistory>> getCoinPriceHistory(String coinUuid) {
    return datasource.getCoinPriceHistory(coinUuid);
  }

  @override
  Future<List<Coin>> getListOfCoins() {
    return datasource.getListOfCoins();
  }

}