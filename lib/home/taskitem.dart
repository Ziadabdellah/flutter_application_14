import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/storage/taskhiv.dart';
import 'package:flutter_application_14/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class Taskitem extends StatelessWidget {
  const Taskitem({super.key, required this.model});
  final task_hiv model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: model.iscomplete
              ? AppColors.greenColor
              : model.color == 0
                  ? AppColors.redColor
                  : model.color == 1
                      ? AppColors.dark
                      : AppColors.greyColor),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.watch_later),
                  Gap(10),
                  Text('${model.starttime}- ${model.endtime}'),
                  Text(model.note)
                ],
              )
            ],
          ),
          Spacer(),
          Container(
            height: 60,
            width: 2,
            color: AppColors.greyColor,
          ),
          RotatedBox(quarterTurns: 3, child: Text(model.iscomplete?'DONE':'todo'))
        ],
      ),
    );
  }
}
