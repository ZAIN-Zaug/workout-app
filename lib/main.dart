import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_app/cubit/home/exercise_cubit.dart';
import 'package:sport_app/theme/color.dart';

import 'package:sport_app/view/main_navgation.dart';

import 'cubit/program/program_cubit.dart';
import 'model/progress_entry.dart';
import 'model/work_out_program.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(WorkoutProgramAdapter());
  Hive.registerAdapter(ProgressEntryAdapter());

  await Hive.openBox<WorkoutProgram>('programsBox');
  await Hive.openBox<ProgressEntry>('progressBox');
  runApp(const SportApp());
}

class SportApp extends StatelessWidget {
  const SportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExercisesCubit()..fetchExercises()),
        BlocProvider(create: (context) => ProgramCubit()..loadPrograms()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainNavigationShell(),
      ),
    );
  }
}
