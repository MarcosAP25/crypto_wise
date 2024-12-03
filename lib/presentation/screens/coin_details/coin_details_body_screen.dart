import 'package:crypto_wise/domain/entities/coin.dart';
import 'package:crypto_wise/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoinDetailsBodyScreen extends StatelessWidget {
  final Coin coin;
  const CoinDetailsBodyScreen({
    super.key,
    required this.coin
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Gap(25),
          CustomCoinDetailsBox(
            coin: coin,
          ),
          const Gap(25),
          Expanded(
            child: CustomCoinDashboard(
              coin: coin,
            )
          ),
          const Gap(30)
        ],
      ),
    );
  }
}