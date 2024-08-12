import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iamc_flutter/bloc/about_bloc/about_bloc_bloc.dart';
import 'package:iamc_flutter/bloc/alertsNews/alerts_news_bloc.dart';
import 'package:iamc_flutter/bloc/allNews/all_news_bloc.dart';
import 'package:iamc_flutter/bloc/authBloc/auth_bloc.dart';
import 'package:iamc_flutter/bloc/guidesBloc/guides_bloc.dart';
import 'package:iamc_flutter/bloc/lang/lang_bloc.dart';
import 'package:iamc_flutter/bloc/lang/lang_state.dart';
import 'package:iamc_flutter/bloc/newsBloc/news_bloc.dart';
import 'package:iamc_flutter/bloc/usersBloc/users_bloc.dart';
import 'package:iamc_flutter/core/config/routes/app_router.dart';
import 'package:iamc_flutter/repos/about_repos.dart';
import 'package:iamc_flutter/repos/alerts_news_repos.dart';
import 'package:iamc_flutter/repos/auth_repos.dart';
import 'package:iamc_flutter/repos/dio_settings.dart';
import 'package:iamc_flutter/repos/guides_repos.dart';
import 'package:iamc_flutter/repos/lang_repos.dart';
import 'package:iamc_flutter/repos/news_repos.dart';
import 'package:iamc_flutter/repos/user_get_me_repos.dart';
import 'package:iamc_flutter/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ru');

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    const storage = FlutterSecureStorage();
    final lang = await storage.read(key: 'selectedLanguage');
    if (lang != null && lang.isNotEmpty) {
      setState(() {
        _locale = Locale(lang);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              AuthRepos(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => UserGetMeRepos(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) =>
              NewsRepos(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
            create: (context) => AlertsNewsRepos(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
          create: (context) =>
              AboutRepos(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) =>
              GuidesRepos(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => LanguageRepos(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              repository: RepositoryProvider.of<AuthRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => UsersBloc(
              repository: RepositoryProvider.of<UserGetMeRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => NewsBloc(
              repository: RepositoryProvider.of<NewsRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AllNewsBloc(
              repository: RepositoryProvider.of<NewsRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AlertsNewsBloc(
              repository: RepositoryProvider.of<AlertsNewsRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AboutBloc(
              repository: RepositoryProvider.of<AboutRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => GuidesBloc(
              repository: RepositoryProvider.of<GuidesRepos>(context),
            ),
          ),
          BlocProvider(
            create: (context) => LanguageBloc(
              repository: RepositoryProvider.of<LanguageRepos>(context),
            ),
          ),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageChanged) {
              _locale = Locale(state.language);
            }

            return MaterialApp.router(
              routerConfig: AppRouter().config(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: _locale,
            );
          },
        ),
      ),
    );
  }
}
