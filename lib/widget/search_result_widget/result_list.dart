import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/search/search_cubit.dart';
import '../../theme/color.dart';
import '../../view/exercise_view.dart';
import '../home_widget/exercise_card.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is! SearchSuccess) {
          return Text('لا يوجد نتائج');
        }

        final result = state.exercises;

        if (result.isEmpty) {
          return Center(
            child: Text(
              'ما في تمارين مطابقة لبحثك',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontFamily: 'Tajawal',
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          itemCount: result.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseView(exercise: result[index]),
                  ),
                );
              },
              child: ExerciseCard(exercise: result[index]),
            );
          },
        );
      },
    );
  }
}
