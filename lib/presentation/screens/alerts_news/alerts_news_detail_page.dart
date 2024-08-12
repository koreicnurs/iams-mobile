import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:iamc_flutter/models/alerts_news_model.dart';
import 'package:iamc_flutter/presentation/widgets/image_status.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';

@RoutePage()
class AlertsNewsDetailPage extends StatelessWidget {
  final AlertsNewsModel alertsNews;

  const AlertsNewsDetailPage({super.key, required this.alertsNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageStatus(
                imageUrl: alertsNews.image != null
                    ? 'https://mes-mobile.yorc.org/upload/${alertsNews.image}'
                    : 'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
                fallbackUrl: 'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
              ),
              const SizedBox(height: 10),
              Text(
                alertsNews.title ?? 'No title',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                alertsNews.datetime ?? 'No date',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              HtmlWidget(
                alertsNews.text ?? 'No text',
                textStyle: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
