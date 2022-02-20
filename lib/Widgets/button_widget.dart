// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';

class ButtonWidget extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? img;
  String? text;

  ButtonWidget({
    Key? key,
    this.isResponsive = false,
    this.width,
    this.img,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.buttonBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text!,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
