import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DayRangeType {
  h1,
  h24,
  d7,
  d30,
  y1
}

class CustomDayRange extends StatefulWidget {
  const CustomDayRange({super.key});

  @override
  State<CustomDayRange> createState() => _CustomDayRangeState();
}

class _CustomDayRangeState extends State<CustomDayRange> {


  DayRangeType dayRangeType = DayRangeType.h1;


  void setNewRange(DayRangeType newRange){
    setState(() {
      dayRangeType = newRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: RangeButton(
            label: '1H',
            onTap: ()=> setNewRange(DayRangeType.h1),
            isSelected: dayRangeType == DayRangeType.h1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: RangeButton(
            label: '24H',
            onTap: ()=> setNewRange(DayRangeType.h24),
            isSelected: dayRangeType == DayRangeType.h24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: RangeButton(
            label: '7D',
            onTap: ()=> setNewRange(DayRangeType.d7),
            isSelected: dayRangeType == DayRangeType.d7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: RangeButton(
            label: '1M',
            onTap: ()=> setNewRange(DayRangeType.d30),
            isSelected: dayRangeType == DayRangeType.d30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: RangeButton(
            label: '1Y',
            onTap: ()=> setNewRange(DayRangeType.y1),
            isSelected: dayRangeType == DayRangeType.y1,
          ),
        ),
        
      ],
    );
  }
}


class RangeButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final bool isSelected;
  const RangeButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context) {

    var colors = Get.theme.colorScheme;
    var textTheme = Get.theme.textTheme;

    return Material(
      borderRadius: BorderRadius.circular(100),
      color: isSelected ? colors.primary : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            label,
            style: textTheme.bodySmall!.copyWith(
              color: isSelected ? colors.surface : colors.surfaceContainerLowest
            ),
          ),
        ),
      ),
    );
  }
}