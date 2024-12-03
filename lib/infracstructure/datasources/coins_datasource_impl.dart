

import 'package:crypto_wise/config/const/enviroment.dart';
import 'package:crypto_wise/domain/datasources/coins_datasource.dart';
import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/domain/entities/coin_price_history.dart';
import 'package:dio/dio.dart';

class CoinsDatasourceImpl extends CoinsDatasource{

  final Dio _dio = Dio(); //Dio instance

  @override
  Future<Coin> getCoinDetails(String coinUuid) async {
    try {

      //Create headers for auth
      var headers = {
        'x-rapidapi-key' : Enviroment.RAPIDAPI_KEY //Get API KEY from .env
      };

      //building request
      var response  = await _dio.request(
        '${Enviroment.BASE_URL}/coin/$coinUuid',
        options: Options(
          method: 'GET',
          headers: headers,
          validateStatus: (status) {
            return status! < 500; //If status code is more than 500 application show Server error
          },
        )
      );

      if(response.statusCode == 200) {
         var data = response.data['data']['coin'];

         Coin coin = Coin.fromJson(data);

         return coin;
      }
      throw 'Response status code are different that 200'; 

    }catch(e){

      print(e.toString());
      throw e.toString();
    }
  }

  @override
  Future<List<CoinPriceHistory>> getCoinPriceHistory(String coinUuid)async {
    try{
      //Create headers for auth
      var headers = {
        'x-rapidapi-key' : Enviroment.RAPIDAPI_KEY //Get API KEY from .env
      };

      var response  = await _dio.request(
        '${Enviroment.BASE_URL}/coin/$coinUuid/history',
        options: Options(
          method: 'GET',
          headers: headers,
          validateStatus: (status) {
            return status! < 500; //If status code is more than 500 application show Server error
          },
        )
      );


      if(response.statusCode == 200){
         var data = response.data['data']['history'];

         List<CoinPriceHistory> coinPriceHistory = data.map<CoinPriceHistory>((json) => CoinPriceHistory.fromJson(json)).toList();

         return coinPriceHistory;
      }

      throw 'Response status code are different that 200'; 

    }catch(e){

      print(e.toString());
      throw e.toString();
      
    }
  }

  @override
  Future<List<Coin>> getListOfCoins() async{
    try{

      //Create headers for auth
      var headers = {
        'x-rapidapi-key' : Enviroment.RAPIDAPI_KEY //Get API KEY from .env
      }; 

      //building request
      var response  = await _dio.request(
        '${Enviroment.BASE_URL}/coins',
        options: Options(
          method: 'GET',
          headers: headers,
          validateStatus: (status) {
            return status! < 500; //If status code is more than 500 application show Server error
          },
        )
      );

      if(response.statusCode == 200){

        var data = response.data['data']['coins'];

        List<Coin> listOfCoins = data.map<Coin>((json) => Coin.fromJson(json)).toList();

        return listOfCoins;
      }

      throw 'Response status code are different that 200';

    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }

}