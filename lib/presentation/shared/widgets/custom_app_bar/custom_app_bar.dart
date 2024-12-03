import 'package:crypto_wise/presentation/shared/widgets/custom_app_bar/avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget CustomAppBar({
  final bool showLeading = false,
}){

  final textTheme = Get.theme.textTheme;
  final colors = Get.theme.colorScheme;

  return AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: showLeading,
    leading: showLeading
    ? IconButton(
      onPressed: () {
        
      }, 
      icon: const Icon(Icons.arrow_back_ios_new_rounded)
    )
    : const Avatar(),
    titleSpacing: 2,
    title: Text(
      'Marcos Almone',
      style: textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w500
      )
    ),
    actions: [
      IconButton.filled(
        onPressed: () {
          
        }, 
        icon: Icon(
          Icons.search,
          color: colors.surface,
        ),
        style: IconButton.styleFrom(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor: colors.onSurface
        ),
      )
    ],
    
  );
}