import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:iamc_flutter/bloc/alertsNews/alerts_news_bloc.dart';
import 'package:iamc_flutter/presentation/screens/alerts_news/alerts_news_detail_page.dart';
import 'package:iamc_flutter/presentation/widgets/image_status.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';

@RoutePage()
class AlertsNewsPage extends StatefulWidget {
  const AlertsNewsPage({super.key});

  @override
  State<AlertsNewsPage> createState() => _AlertsNewsPageState();
}

class _AlertsNewsPageState extends State<AlertsNewsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AlertsNewsBloc>(context).add(GetAlertsNewsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      body: BlocBuilder<AlertsNewsBloc, AlertsNewsState>(
        builder: (context, state) {
          if (state is AlertsNewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlertsNewsSuccess) {
            final alertsList = state.alertsNewsModel;
            return ListView.builder(
              itemCount: alertsList.length,
              itemBuilder: (context, index) {
                final alerts = alertsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AlertsNewsDetailPage(alertsNews: alerts),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageStatus(
                          imageUrl: alerts.image != null
                              ? 'https://mes-mobile.yorc.org/upload/${alerts.image}'
                              : 'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
                          fallbackUrl:
                              'https://mes-mobile.yorc.org/upload/IAMS_MES.jpg',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                alerts.title ?? 'No title',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Text(
                              //   news.text ?? 'No description',
                              //   style: TextStyle(
                              //     fontSize: 12,
                              //     color: Colors.black,
                              //   ),
                              // ),
                              HtmlWidget(
                                alerts.text ?? 'No description',
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 145, 61, 61),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                alerts.datetime ?? 'No date',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is AlertsNewsError) {
            return Center(child: Text('Error: ${state.errorText}'));
          }
          return const Center(child: Text('No news available.'));
        },
      ),
    );
  }
}
