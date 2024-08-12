import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/bloc/guidesBloc/guides_bloc.dart';
import 'package:iamc_flutter/presentation/screens/first_aid/first_aid_detail_page.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';
import 'package:iamc_flutter/presentation/widgets/title_widget.dart';

@RoutePage()
class FirstAidPage extends StatefulWidget {
  const FirstAidPage({super.key});

  @override
  State<FirstAidPage> createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GuidesBloc>(context).add(GetGuidesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const TitleWidget(
            title: 'Первая медициская помощь',
          ),
          Expanded(
            child: BlocBuilder<GuidesBloc, GuidesState>(
              builder: (context, state) {
                if (state is GuidesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GuidesSuccess) {
                  final guides = state.guides
                      .where((guide) => guide.category.toString() == "1")
                      .toList();
                  return ListView.builder(
                    itemCount: guides.length,
                    itemBuilder: (context, index) {
                      final guide = guides[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FirstAidDetailPage(guide: guide),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.symmetric(vertical: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.greyWhiteBG,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 25),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.redArrow,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(
                                        guide.title ?? 'No title',
                                        style: AppFonts.s14norm.copyWith(
                                            color: AppColors.blueblack),
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
                } else if (state is GuidesError) {
                  return Center(child: Text('Error: ${state.errorText}'));
                }
                return const Center(child: Text('No news available.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
