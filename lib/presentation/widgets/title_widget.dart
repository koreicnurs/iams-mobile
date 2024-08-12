import 'package:flutter/material.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 24.0, horizontal: 20.0),
        color: AppColors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppFonts.s28w700.copyWith(color: AppColors.white)),
            Text('Справочник',
                style: AppFonts.s16norm.copyWith(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}