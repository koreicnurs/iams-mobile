// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    AlertsNewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AlertsNewsDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AlertsNewsDetailPage(
          key: args.key,
          alertsNews: args.alertsNews,
        ),
      );
    },
    AlertsNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AlertsNewsPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    EsReportRoute.name: (routeData) {
      final args = routeData.argsAs<EsReportRouteArgs>(
          orElse: () => const EsReportRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EsReportPage(key: args.key),
      );
    },
    FirstAidDetailRoute.name: (routeData) {
      final args = routeData.argsAs<FirstAidDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FirstAidDetailPage(
          key: args.key,
          guide: args.guide,
        ),
      );
    },
    FirstAidRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FirstAidPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsDetailPage(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    WhatToDoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WhatToDoDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WhatToDoDetailPage(
          key: args.key,
          guide: args.guide,
        ),
      );
    },
    WhatToDoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WhatToDoPage(),
      );
    },
  };
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AlertsNewsDetailPage]
class AlertsNewsDetailRoute extends PageRouteInfo<AlertsNewsDetailRouteArgs> {
  AlertsNewsDetailRoute({
    Key? key,
    required AlertsNewsModel alertsNews,
    List<PageRouteInfo>? children,
  }) : super(
          AlertsNewsDetailRoute.name,
          args: AlertsNewsDetailRouteArgs(
            key: key,
            alertsNews: alertsNews,
          ),
          initialChildren: children,
        );

  static const String name = 'AlertsNewsDetailRoute';

  static const PageInfo<AlertsNewsDetailRouteArgs> page =
      PageInfo<AlertsNewsDetailRouteArgs>(name);
}

class AlertsNewsDetailRouteArgs {
  const AlertsNewsDetailRouteArgs({
    this.key,
    required this.alertsNews,
  });

  final Key? key;

  final AlertsNewsModel alertsNews;

  @override
  String toString() {
    return 'AlertsNewsDetailRouteArgs{key: $key, alertsNews: $alertsNews}';
  }
}

/// generated route for
/// [AlertsNewsPage]
class AlertsNewsRoute extends PageRouteInfo<void> {
  const AlertsNewsRoute({List<PageRouteInfo>? children})
      : super(
          AlertsNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlertsNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EsReportPage]
class EsReportRoute extends PageRouteInfo<EsReportRouteArgs> {
  EsReportRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EsReportRoute.name,
          args: EsReportRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EsReportRoute';

  static const PageInfo<EsReportRouteArgs> page =
      PageInfo<EsReportRouteArgs>(name);
}

class EsReportRouteArgs {
  const EsReportRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EsReportRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FirstAidDetailPage]
class FirstAidDetailRoute extends PageRouteInfo<FirstAidDetailRouteArgs> {
  FirstAidDetailRoute({
    Key? key,
    required GuidesModel guide,
    List<PageRouteInfo>? children,
  }) : super(
          FirstAidDetailRoute.name,
          args: FirstAidDetailRouteArgs(
            key: key,
            guide: guide,
          ),
          initialChildren: children,
        );

  static const String name = 'FirstAidDetailRoute';

  static const PageInfo<FirstAidDetailRouteArgs> page =
      PageInfo<FirstAidDetailRouteArgs>(name);
}

class FirstAidDetailRouteArgs {
  const FirstAidDetailRouteArgs({
    this.key,
    required this.guide,
  });

  final Key? key;

  final GuidesModel guide;

  @override
  String toString() {
    return 'FirstAidDetailRouteArgs{key: $key, guide: $guide}';
  }
}

/// generated route for
/// [FirstAidPage]
class FirstAidRoute extends PageRouteInfo<void> {
  const FirstAidRoute({List<PageRouteInfo>? children})
      : super(
          FirstAidRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirstAidRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const PageInfo<NewsDetailRouteArgs> page =
      PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WhatToDoDetailPage]
class WhatToDoDetailRoute extends PageRouteInfo<WhatToDoDetailRouteArgs> {
  WhatToDoDetailRoute({
    Key? key,
    required GuidesModel guide,
    List<PageRouteInfo>? children,
  }) : super(
          WhatToDoDetailRoute.name,
          args: WhatToDoDetailRouteArgs(
            key: key,
            guide: guide,
          ),
          initialChildren: children,
        );

  static const String name = 'WhatToDoDetailRoute';

  static const PageInfo<WhatToDoDetailRouteArgs> page =
      PageInfo<WhatToDoDetailRouteArgs>(name);
}

class WhatToDoDetailRouteArgs {
  const WhatToDoDetailRouteArgs({
    this.key,
    required this.guide,
  });

  final Key? key;

  final GuidesModel guide;

  @override
  String toString() {
    return 'WhatToDoDetailRouteArgs{key: $key, guide: $guide}';
  }
}

/// generated route for
/// [WhatToDoPage]
class WhatToDoRoute extends PageRouteInfo<void> {
  const WhatToDoRoute({List<PageRouteInfo>? children})
      : super(
          WhatToDoRoute.name,
          initialChildren: children,
        );

  static const String name = 'WhatToDoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
