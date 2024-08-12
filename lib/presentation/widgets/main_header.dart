import 'package:flutter/material.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/png/logo.png',
          width: 42,
          height: 42,
        ),
        const SizedBox(width: 10),
        Text(
          '112 Кыргызстан',
          style:
              AppFonts.s20w500.copyWith(color: AppColors.blueblack),
        ),
      ],
    );
  }
}