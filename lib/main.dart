import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwiz_app/feature/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/quiz_home_page.dart';
import 'package:kwiz_app/init_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initDependencies();
  
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<QuizBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kwiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
            ),
          ),
          colorScheme: ColorScheme.light(
            primary: Colors.black,
          )),
      home: const QuizHomePage(),
    );
  }
}
