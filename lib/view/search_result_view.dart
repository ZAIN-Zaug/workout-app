import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/home/exercise_cubit.dart';

import 'package:sport_app/widget/search_result_widget/build_search_bar.dart';
import '../cubit/search/search_cubit.dart';
import '../theme/color.dart';
import '../widget/search_result_widget/result_list.dart';
import '../widget/search_result_widget/build_result_count.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) =>
            SearchCubit(BlocProvider.of<ExercisesCubit>(context).exercises),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    return SearchResultsBar(
                      onChanged: (value) {
                        BlocProvider.of<SearchCubit>(
                          context,
                        ).searchExercises(value);
                      },
                    );
                  },
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    final count = state is SearchSuccess
                        ? state.exercises.length
                        : 0;
                    return ResultsCount(count: count);
                  },
                ),
                const SizedBox(height: 8),
                Expanded(child: ResultsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
