import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChangeBadge extends StatelessWidget {
  final double changeRate;
  const CustomChangeBadge({
    super.key,
    required this.changeRate
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Get.theme.textTheme;
    final colors = Get.theme.colorScheme;

    final color = changeRate <= 0 ? colors.primary : const Color.fromARGB(255, 46, 206, 139);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100)
      ),
      padding: EdgeInsets.all(8),
      child: Text(
        "${changeRate}%",
        style: textTheme.labelSmall!.copyWith(
          color: Colors.white
        ),
      ),
    );
  }
}