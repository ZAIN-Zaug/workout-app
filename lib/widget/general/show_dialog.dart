import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/program/program_cubit.dart';
import 'package:sport_app/model/work_out_program.dart';

void showEditFieldDialog({
  required BuildContext context,
  required WorkoutProgram program,
}) {
  final TextEditingController controller = TextEditingController(
    text: program.name,
  );
  String? errorText;
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: StatefulBuilder(
                builder:
                    (
                      BuildContext context,
                      void Function(void Function()) setState,
                    ) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: controller,
                            onChanged: (_) {
                              if (errorText != null)
                                setState(() => errorText = null);
                            },
                            decoration: InputDecoration(
                              errorText: errorText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "الاسم الجديد",
                              hintStyle: TextStyle(
                                color: Colors.black.withAlpha(100),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  final programName = controller.text.trim();
                                  if (programName.isEmpty) {
                                    setState(
                                      () => errorText = 'لا يمكنك حفظ اسم فارغ',
                                    );
                                    return;
                                  }
                                  BlocProvider.of<ProgramCubit>(
                                    context,
                                  ).editNameProgram(
                                    newName: programName,
                                    program: program,
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text('حفظ'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('إلغاء'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
              ),
            ),
          ),
        ),
      );
    },
  );
}
