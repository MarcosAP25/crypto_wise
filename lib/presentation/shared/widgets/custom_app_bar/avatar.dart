import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Get.theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 50,
          height: 50,
          color: colors.surface,
          child: Icon(
            Icons.person,
            color: colors.surfaceContainerLowest,
            size: 35,
          ),
        ),
      ),
    );
  }
}