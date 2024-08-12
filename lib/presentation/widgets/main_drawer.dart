import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iamc_flutter/bloc/lang/lang_bloc.dart';
import 'package:iamc_flutter/bloc/lang/lang_event.dart';
import 'package:iamc_flutter/presentation/screens/about/about_page.dart';
import 'package:iamc_flutter/presentation/screens/alerts_news/alerts_news_page.dart';
import 'package:iamc_flutter/presentation/screens/es_report/es_report_page.dart';
import 'package:iamc_flutter/presentation/screens/first_aid/first_aid_page.dart';
import 'package:iamc_flutter/presentation/screens/home_page/home_page.dart';
import 'package:iamc_flutter/presentation/screens/news_page/news_page.dart';
import 'package:iamc_flutter/presentation/screens/what_to_do/what_to_do_page.dart';
import 'package:iamc_flutter/presentation/widgets/main_header.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  MainDrawerState createState() => MainDrawerState();
}

class MainDrawerState extends State<MainDrawer> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String _selectedLanguage = 'ru';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    String? storedLanguage = await _storage.read(key: 'selectedLanguage');
    if (storedLanguage != null) {
      setState(() {
        _selectedLanguage = storedLanguage;
      });
    }
  }

  Future<void> _saveSelectedLanguage(String language) async {
    await _storage.write(key: 'selectedLanguage', value: language);
  }

  String _mapLanguageToCode(String language) {
    switch (language) {
      case 'Русский':
        return 'ru';
      case 'English':
        return 'en';
      case 'Кыргыз тили':
        return 'ky';
      default:
        return 'ru'; // default language code
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: const EdgeInsets.only(left: 16),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainHeader(),
                  DropdownButton<String>(
                    value: _selectedLanguage == 'ru'
                        ? 'Русский'
                        : _selectedLanguage == 'en'
                            ? 'English'
                            : 'Кыргыз тили',
                    items: <String>['Русский', 'English', 'Кыргыз тили']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedLanguage = _mapLanguageToCode(newValue);
                      });
                      _saveSelectedLanguage(_selectedLanguage);
                      BlocProvider.of<LanguageBloc>(context).add(
                          ChangeLanguageEvent(language: _selectedLanguage));
                    },
                  ),
                ],
              )),
          ListTile(
            title: const Text('Главная'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Сообщить о ЧС'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EsReportPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Важные оповещения'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AlertsNewsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Новости'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Правила поведения в чрезвычайных ситуациях'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WhatToDoPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Инструкция по оказанию доврачебной помощи'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstAidPage()),
              );
            },
          ),
          ListTile(
            title: const Text('О приложении'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
