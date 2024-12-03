import 'package:crypto_wise/presentation/screens.dart';
import 'package:get/get.dart';

final appRouter = <GetPage>[
  GetPage(
    name: '/${HomeScreen.name}', 
    page: () => const HomeScreen(),
    transition: Transition.cupertino
  ),
  GetPage(
    name: '/${CoinDetailsScreen.name}', 
    page: () => const CoinDetailsScreen(),
    transition: Transition.cupertino
  )
];