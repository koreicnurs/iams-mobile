
import 'package:flutter/material.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({
    super.key,
    required this.title,
    required this.icon, required this.onPressed,
  });

  final String title;
  final Icon icon;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orange,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            textStyle: AppFonts.s14bold,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            children: [
              icon,
              SizedBox(height: 10,),
              Text(
                title,
                style: AppFonts.s14bold.copyWith(color: AppColors.white),
              )
            ],
          ),
        ));
  }
}