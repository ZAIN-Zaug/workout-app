import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/program/program_cubit.dart';
import 'package:sport_app/view/program_detail_view.dart';
import 'package:sport_app/widget/program_list_view/program_card.dart';
import '../theme/color.dart';
import '../widget/program_list_view/empty_state.dart';
import 'create_program_view.dart';

class ProgramsListView extends StatelessWidget {
  const ProgramsListView({super.key});

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
              _buildHeader(),
              Expanded(
                child: BlocBuilder<ProgramCubit, ProgramState>(
                  builder: (context, state) {
                    if (state is! ProgramsLoaded || state.programs.isEmpty) {
                      return const EmptyProgramsState();
                    }
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        final program = state.programs[index];
                        return ProgramCard(
                          name: program.name,
                          exerciseCount: program.exerciseIds.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProgramDetailsView(program: program);
                                },
                              ),
                            );
                          },
                          onPressed: () {
                            state.programs[index].delete();
                            BlocProvider.of<ProgramCubit>(
                              context,
                            ).loadPrograms();
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemCount: state.programs.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.accent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateProgramView(),
              ),
            );
          },
          child: Icon(Icons.add, color: AppColors.background),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Text(
            'برامجي',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              fontFamily: 'Tajawal',
            ),
          ),
        ],
      ),
    );
  }
}
