import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:iamc_flutter/bloc/about_bloc/about_bloc_bloc.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AboutBloc>(context).add(GetAboutEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      body: BlocBuilder<AboutBloc, AboutBlocState>(
        builder: (context, state) {
          if (state is AboutLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AboutSuccess) {
            final about = state.about;
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 20.0), // Отступы вокруг текста
                    color: AppColors.orange,
                    child: const Text(
                      'О приложение',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700 // Цвет текста
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HtmlWidget(
                    about.description ?? 'No description',
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            );
          } else if (state is AboutError) {
            return Center(child: Text('Error: ${state.errorText}'));
          }
          return const Center(child: Text('No news available.'));
        },
      ),
    );
  }
}
