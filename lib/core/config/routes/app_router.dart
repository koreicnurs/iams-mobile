import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iamc_flutter/models/alerts_news_model.dart';
import 'package:iamc_flutter/models/guides_model.dart';
import 'package:iamc_flutter/models/news_model.dart';
import 'package:iamc_flutter/presentation/screens/about/about_page.dart';
import 'package:iamc_flutter/presentation/screens/alerts_news/alerts_news_detail_page.dart';
import 'package:iamc_flutter/presentation/screens/alerts_news/alerts_news_page.dart';
import 'package:iamc_flutter/presentation/screens/auth_page/auth_page.dart';
import 'package:iamc_flutter/presentation/screens/es_report/es_report_page.dart';
import 'package:iamc_flutter/presentation/screens/first_aid/first_aid_detail_page.dart';
import 'package:iamc_flutter/presentation/screens/first_aid/first_aid_page.dart';
import 'package:iamc_flutter/presentation/screens/home_page/home_page.dart';
import 'package:iamc_flutter/presentation/screens/login_page.dart';
import 'package:iamc_flutter/presentation/screens/news_page/news_detail_page.dart';
import 'package:iamc_flutter/presentation/screens/news_page/news_page.dart';
import 'package:iamc_flutter/presentation/screens/what_to_do/what_to_do_detail_page.dart';
import 'package:iamc_flutter/presentation/screens/what_to_do/what_to_do_page.dart';
import 'package:iamc_flutter/service/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: NewsRoute.page),
        AutoRoute(page: WhatToDoRoute.page),
        AutoRoute(page: EsReportRoute.page),
      ];
}
