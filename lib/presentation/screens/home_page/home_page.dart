import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart';
import 'package:iamc_flutter/bloc/alertsNews/alerts_news_bloc.dart';
import 'package:iamc_flutter/bloc/allNews/all_news_bloc.dart';
import 'package:iamc_flutter/presentation/screens/alerts_news/alerts_news_detail_page.dart';
import 'package:iamc_flutter/presentation/screens/alerts_news/alerts_news_page.dart';
import 'package:iamc_flutter/presentation/screens/es_report/es_report_page.dart';
import 'package:iamc_flutter/presentation/screens/first_aid/first_aid_page.dart';
import 'package:iamc_flutter/presentation/screens/news_page/news_detail_page.dart';
import 'package:iamc_flutter/presentation/screens/news_page/news_page.dart';
import 'package:iamc_flutter/presentation/screens/what_to_do/what_to_do_page.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';
import 'package:iamc_flutter/presentation/widgets/faw.dart';
import 'package:iamc_flutter/presentation/widgets/image_status.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';
import 'package:iamc_flutter/generated/l10n.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();

  Future<void> clearSecureStorage() async {
    await storage.deleteAll();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AllNewsBloc>(context).add(GetAllNewsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            textStyle: AppFonts.s14bold,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EsReportPage()));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 30,
                            ),
                            Text(
                              S.of(context).emergency,
                              style: AppFonts.s14bold
                                  .copyWith(color: AppColors.white),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        FaqWidget(
                          icon: const Icon(
                            Icons.help_rounded,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: 'Что делать, если',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WhatToDoPage()));
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FaqWidget(
                          icon: const Icon(
                            Icons.add_circle,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: 'Первая помощь',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FirstAidPage()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: MainTitleWidget(
              text: 'Срочные оповещения',
              arrowColor: AppColors.red,
              textColor: AppColors.red,
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlertsNewsPage()));
              },
            ),
          ),
          const SliverToBoxAdapter(child: Carousel()),
          SliverToBoxAdapter(
            child: MainTitleWidget(
              text: 'Новости',
              arrowColor: AppColors.black,
              textColor: AppColors.blue,
              onClick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewsPage()));
              },
            ),
          ),
          BlocBuilder<AllNewsBloc, AllNewsState>(
            builder: (context, state) {
              if (state is AllNewsLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is AllNewsSuccess) {
                final newsList = state.allNewsModel;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final news = newsList[index];
                      final document = parse(news.text ?? '');
                      final firstParagraph =
                          document.querySelector('p')?.outerHtml ??
                              'No description';
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(news: news),
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
                                imageUrl: news.image != null
                                    ? 'https://mes-mobile.yorc.org/upload/${news.image}'
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
                                      news.title ?? 'No title',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    HtmlWidget(
                                      firstParagraph,
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 145, 61, 61),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      news.datetime ?? 'No date',
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
                    childCount: newsList.length,
                  ),
                );
              } else if (state is AllNewsError) {
                return SliverFillRemaining(
                  child: Center(child: Text('Error: ${state.errorText}')),
                );
              }
              return const SliverFillRemaining(
                child: Center(child: Text('No news available.')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    super.key,
    required this.text,
    required this.arrowColor,
    required this.textColor,
    required this.onClick,
  });

  final String text;
  final Color arrowColor;
  final Color textColor;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: AppFonts.s18wbold.copyWith(color: textColor),
                ),
                Text('Нажмите, чтобы узнать подробнее',
                    style: AppFonts.s14norm.copyWith(color: AppColors.black)),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: arrowColor,
            ),
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AlertsNewsBloc>(context).add(GetAlertsNewsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsNewsBloc, AlertsNewsState>(
      builder: (context, state) {
        if (state is AlertsNewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AlertsNewsSuccess) {
          final alertsNews = state.alertsNewsModel;
          return Stack(
            children: [
              Positioned(
                bottom: 175, // Adjust this value based on your carousel height
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 85.0, // Height of the red line
                    width: double.infinity, // Full width of the screen
                    color: Colors.red, // Color of the red line
                  ),
                ),
              ),
              CarouselSlider.builder(
                itemCount: alertsNews.length,
                itemBuilder: (context, index, realIndex) {
                  final alerts = alertsNews[index];
                  final document = parse(alerts.text ?? '');
                  final firstParagraph =
                      document.querySelector('p')?.outerHtml ??
                          'No description';

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
                      child: SingleChildScrollView(
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
                                  HtmlWidget(
                                    firstParagraph,
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
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 350.0, // Set a fixed height for the carousel items
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 0.8,
                ),
              ),
            ],
          );
        } else if (state is AlertsNewsError) {
          return Center(child: Text('Error: ${state.errorText}'));
        }
        return const Center(child: Text('No news available.'));
      },
    );
  }
}
