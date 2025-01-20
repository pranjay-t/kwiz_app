import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';

class TabBarSection extends StatelessWidget {
  final TabController tabController;

  const TabBarSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.white,
        unselectedLabelStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        tabs: const [
          Tab(text: 'Leaderboard'),
          Tab(text: 'Summary'),
          Tab(text: 'Play Again'),
        ],
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 5, color: Pallete.appTheme),
        ),
      ),
    );
  }
}
