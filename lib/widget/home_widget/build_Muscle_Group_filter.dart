import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/home/exercise_cubit.dart';
import 'category_muscle_item.dart';

class MuscleGroupFilter extends StatefulWidget {
  const MuscleGroupFilter({super.key});
  static final groups = ['الكل', 'الصدر', 'الظهر', 'الأرجل', 'الكتف', 'الذراع'];

  @override
  State<MuscleGroupFilter> createState() => _MuscleGroupFilterState();
}

class _MuscleGroupFilterState extends State<MuscleGroupFilter> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: MuscleGroupFilter.groups.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              if (MuscleGroupFilter.groups[selectedIndex] == 'الكل') {
                BlocProvider.of<ExercisesCubit>(context).showAllExercises();
              } else {
                BlocProvider.of<ExercisesCubit>(
                  context,
                ).fetchExercisesByMuscleGroup(
                  muscleGroup: MuscleGroupFilter.groups[selectedIndex],
                );
              }
              setState(() {});
            },
            child: CategoryMuscleItem(
              isSelected: isSelected,
              group: MuscleGroupFilter.groups[index],
            ),
          );
        },
      ),
    );
  }
}
