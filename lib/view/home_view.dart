import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../widget/home_widget/build_Muscle_Group_filter.dart';
import '../widget/home_widget/build_header.dart';
import '../widget/home_widget/build_search_bar.dart';
import '../widget/home_widget/exercise_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildHeader(),
              BuildSearchBar(),
              MuscleGroupFilter(),
              const SizedBox(height: 12),
              Expanded(child: ExerciseList()),
            ],
          ),
        ),
      ),
    );
  }
}
