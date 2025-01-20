import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwiz_app/core/common/widgets/loader.dart';
import 'package:kwiz_app/core/utils/show_snackbar.dart';
import 'package:kwiz_app/feature/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/question_screen_widgets/background_blur.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/question_screen_widgets/quiz_controls.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = [];
  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    context.read<QuizBloc>().add(GetQuizEvent());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer(int questionCount) {
    timer?.cancel();
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          if (currentQuestionIndex < questionCount - 1) {
            onNextQuestion(questionCount);
          } else {
            showSnackbar(context, 'Quiz has ended.');
          }
        }
      });
    });
  }

  void onAnswerSelected(int selectedIndex) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = selectedIndex;
    });
  }

  void onNextQuestion(int questionCount) {
    setState(() {
      if (currentQuestionIndex < questionCount - 1) {
        currentQuestionIndex++;
        startTimer(questionCount);
      } else {
        timer?.cancel();
        showSnackbar(context, 'You have reached the end of the quiz.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          BlocConsumer<QuizBloc, QuizState>(
            listener: (context, state) {
              if (state is QuizFailure) {
                showSnackbar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is QuizLoading) {
                return const Loader();
              } else if (state is QuizFetchSuccess) {
                final quiz = state.quiz;

                while (selectedAnswers.length < quiz.questions.length) {
                  selectedAnswers.add(null);
                }

                if (timer == null || !(timer!.isActive)) {
                  startTimer(quiz.questions.length);
                }

                return QuizControls(
                  quiz: quiz,
                  currentQuestionIndex: currentQuestionIndex,
                  seconds: seconds,
                  selectedAnswers: selectedAnswers,
                  onAnswerSelected: onAnswerSelected,
                  onNextQuestion: onNextQuestion,
                  timer: timer,
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}


// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kwiz_app/core/common/theme/pallete.dart';
// import 'package:kwiz_app/core/common/widgets/loader.dart';
// import 'package:kwiz_app/core/utils/show_snackbar.dart';
// import 'package:kwiz_app/feature/quiz/presentation/bloc/quiz_bloc.dart';
// import 'package:kwiz_app/feature/quiz/presentation/pages/result_page.dart';
// import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/question_card.dart';
// import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/question_page_button.dart';
// import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/quit_quiz_dialog_box.dart';
// import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/submit_ans.dart';

// class QuestionsScreen extends StatefulWidget {
//   const QuestionsScreen({super.key});

//   @override
//   State<QuestionsScreen> createState() => _QuestionsScreenState();
// }

// class _QuestionsScreenState extends State<QuestionsScreen> {
//   int currentQuestionIndex = 0;
//   List<int?> selectedAnswers = [];
//   int seconds = 60;
//   Timer? timer;

//   @override
//   void initState() {
//     context.read<QuizBloc>().add(GetQuizEvent());
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   void startTimer(int questionCount) {
//     timer?.cancel();
//     print('Starting timer for question $currentQuestionIndex');
//   seconds = 60;
//   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//     if (!mounted) return; 
//     setState(() {
//       if (seconds > 0) {
//         seconds--;
//       } else {
//         timer.cancel();
//         if (currentQuestionIndex < questionCount - 1) {
//           onNextQuestion(questionCount);
//         } else {
//           showSnackbar(context, 'Quiz has ended.');
//         }
//       }
//     });
//   });
// }

//   void onAnswerSelected(int selectedIndex) {
    
//     setState(() {
//       selectedAnswers[currentQuestionIndex] = selectedIndex;
//     });
//   }

//   void onNextQuestion(int questionCount) {
//     setState(() {
//       if (currentQuestionIndex < questionCount - 1) {
//         currentQuestionIndex++;
//         startTimer(questionCount);
//       } else {
//         timer!.cancel();
//         showSnackbar(context, 'You have reached the end of the quiz.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: ImageFiltered(
//               imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//               child: Image.asset(
//                 'assets/images/app_bg.jpeg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           BlocConsumer<QuizBloc, QuizState>(
//             listener: (context, state) {
//               if (state is QuizFailure) {
//                 showSnackbar(context, state.error);
//               }
//             },
//             builder: (context, state) {
//               if (state is QuizLoading) {
//                 return const Loader();
//               } else if (state is QuizFetchSuccess) {
//                 final quiz = state.quiz;

//                 while (selectedAnswers.length < quiz.questions.length) {
//                   selectedAnswers.add(null);
//                 }

//                 final currQuestion = quiz.questions[currentQuestionIndex];

//                 if (timer == null || !(timer!.isActive)) {
//                   startTimer(quiz.questions.length);
//                 }

//                 return Center(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Question ${currentQuestionIndex + 1}',
//                                 style: const TextStyle(
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 '/${quiz.questions.length}',
//                                 style: const TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Slider(
//                           value: currentQuestionIndex.toDouble() + 1,
//                           min: 1,
//                           max: quiz.questions.length.toDouble(),
//                           divisions: quiz.questions.length,
//                           activeColor: Pallete.appTheme,
//                           inactiveColor: Colors.white,
//                           onChanged: (value) {},
//                         ),
//                         QuestionCard(
//                           seconds: seconds,
//                           question: currQuestion,
//                           selectedAnswer: selectedAnswers[currentQuestionIndex],
//                           onAnswerSelected: onAnswerSelected,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         currentQuestionIndex == quiz.questionsCount - 1
//                             ? SubmitAns(
//                                 title: 'Submit your answers',
//                                 onPressed: () {
//                                   timer?.cancel();
//                                   Navigator.pushAndRemoveUntil(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ResultPage(
//                                           quiz: quiz,
//                                           selectedAnswer: selectedAnswers,
//                                         ),
//                                       ),
//                                       (route) => false);

//                                   showSnackbar(context, 'Quiz Submitted.');
//                                 },
//                               )
//                             : Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   QuestionPageButton(
//                                     onPressed: () {
//                                       showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return QuitQuizDialogBox();
//                                         },
//                                       );
//                                     },
//                                     title: 'Quit Quiz',
//                                   ),
//                                   QuestionPageButton(
//                                     onPressed: () {
//                                       onNextQuestion(quiz.questions.length);
//                                     },
//                                     title: 'Next',
//                                   ),
//                                 ],
//                               ),
//                       ],
//                     ),
//                   ),
//                 );
//               }
//               return const SizedBox();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
