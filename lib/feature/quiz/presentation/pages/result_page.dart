import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwiz_app/core/common/widgets/loader.dart';
import 'package:kwiz_app/core/utils/show_snackbar.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/leaderboard_page.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/play_again_page.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/quiz_results.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/result_page_widgets/result_header.dart';

class ResultPage extends StatefulWidget {
  final Quiz quiz;
  final List<int?> selectedAnswer;

  const ResultPage({
    super.key,
    required this.quiz,
    required this.selectedAnswer,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<QuizBloc>().add(QuizResponseEvent(
          quiz: widget.quiz,
          selectedAnswers: widget.selectedAnswer,
        ));

    return Scaffold(
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizFailure) {
            showSnackbar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Loader();
          } else if (state is QuizResponseSuccess) {
            return CustomScrollView(
              slivers: [
                ResultHeader(
                  tabController: _tabController,
                  score: state.quizResponse.score,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        LeaderboardPage(),
                        QuizResults(
                            quiz: widget.quiz,
                            selectedAnswer: widget.selectedAnswer),
                        PlayAgainPage(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
