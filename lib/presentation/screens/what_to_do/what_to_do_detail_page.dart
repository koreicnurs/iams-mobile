import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:iamc_flutter/models/guides_model.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';
import 'package:iamc_flutter/presentation/widgets/image_status.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';

@RoutePage()
class WhatToDoDetailPage extends StatelessWidget {
  final GuidesModel guide;

  const WhatToDoDetailPage({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                guide.title ?? 'No title',
                style: AppFonts.s24700.copyWith(color: AppColors.blueBlackText),
              ),
              const SizedBox(height: 10),
              ImageStatus(
                imageUrl: guide.image != null
                    ? 'https://mes-mobile.yorc.org/upload/${guide.image}'
                    : 'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
                fallbackUrl: 'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
              ),
              const SizedBox(height: 20),
              HtmlWidget(
                guide.text ?? 'No text',
                customStylesBuilder: (element) {
                  if (element.localName == 'img') {
                    return {'height': 'auto', 'width': 'auto'};
                  }
                  return null;
                },
                customWidgetBuilder: (element) {
                  if (element.localName == 'img') {
                    final imageUrl = element.attributes['src'] ?? '';
                    return ImageStatus(
                      imageUrl: imageUrl,
                      fallbackUrl:
                          'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
                    );
                  }
                  return null;
                },
                textStyle: AppFonts.s16w300.copyWith(color: AppColors.blueBlackText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
