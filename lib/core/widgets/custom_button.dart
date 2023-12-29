import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/utils/app_colors.dart';
import 'package:flutter_application_14/core/utils/style.dart';

class Custom_botton extends StatelessWidget {
  const Custom_botton(
      {super.key, required this.text, required this.onTap, this.width = 100});

  final String text;
  final Function()? onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.dark, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text,
          style: getbodyStyle(),
        )),
      ),
    );
  }
}

class Custom_ extends StatelessWidget {
  const Custom_(
      {super.key,
      required this.text,
      required this.onTap,
      this.width = 100,
      this.style});

  final String text;
  final Function()? onTap;
  final double width;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: 45,
          width: width,
          decoration: BoxDecoration(
              color: AppColors.dark, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            text,
            style: getbodyStyle(),
          )),
        ),
      ),
    );
  }
}
