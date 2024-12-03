import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {

  static String RAPIDAPI_KEY = dotenv.env['RAPIDAPI_KEY'] ?? '';
  static String BASE_URL = dotenv.env['BASE_URL'] ?? '';
}