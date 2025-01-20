import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/result_page_widgets/stats_row.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/result_page_widgets/tab_bar_section.dart';

class ResultHeader extends StatelessWidget {
  final TabController tabController;
  final int score;

  const ResultHeader({
    super.key,
    required this.tabController,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 123, 41, 194),
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 420.0,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/app_bg.jpeg',
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(350.0),
        child: Column(
          children: [
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 230,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Congratulations !',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                StatsRow(
                                  score: score,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/trophy.png',
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
            TabBarSection(tabController: tabController),
          ],
        ),
      ),
    );
  }
}
