import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/storage/taskhiv.dart';
import 'package:flutter_application_14/core/utils/app_colors.dart';
import 'package:flutter_application_14/core/utils/style.dart';
import 'package:flutter_application_14/core/widgets/custom_button.dart';
import 'package:flutter_application_14/core/widgets/home.dart';
import 'package:flutter_application_14/create_task/Add_task.dart';
import 'package:flutter_application_14/functions/functions.dart';
import 'package:flutter_application_14/home/taskitem.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String select_date = DateFormat.yMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                HomeHeader(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.yMMMd().format(DateTime.now()),
                          style: getbodyStyle(),
                        ),
                        Text(
                          'Today',
                          style: getbodyStyle(),
                        )
                      ],
                    ),
                    Spacer(),
                    Custom_(
                      text: 'Add Task',
                      onTap: () {
                        push(context, add_task());
                      },
                      width: 120,
                    )
                  ],
                ),
                Gap(15),
                DatePicker(
                  DateTime.now(),
                  width: 70,
                  height: 90,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    setState(() {
                      select_date = DateFormat.yMMMd().format(date);
                    });
                  },
                ),
                Gap(10),
                Expanded(
                  child: ValueListenableBuilder<Box<task_hiv>>(
                    valueListenable: Hive.box<task_hiv>('task').listenable(),
                    builder: (context, Box<task_hiv> value, child) {
                      List<task_hiv> tasks = [];
                      value.values.forEach((element) {
                        if (select_date == element.date) {
                          tasks.add(element);
                        }
                      });
                      if (tasks.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/delete.gif'),
                              Gap(10),
                              Text(
                                'No Tasks Now',
                                style: getbodyStyle(),
                              )
                            ],
                          ),
                        );
                      }
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            //
                            task_hiv itme = tasks[index];
                            //
                            return Dismissible(
                                key: UniqueKey(),
                                background: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    color: AppColors.redColor,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.done),
                                        Text(
                                          'completa task',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                secondaryBackground: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    color: AppColors.redColor,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.delete),
                                        Text(
                                          'Delete task',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    value.put(
                                        itme.id,
                                        task_hiv(
                                            id: itme.id,
                                            title: itme.title,
                                            note: itme.note,
                                            date: itme.date,
                                            starttime: itme.starttime,
                                            endtime: itme.endtime,
                                            color: itme.color,
                                            iscomplete: true));
                                  } else {
                                    value.delete(itme.id);
                                  }
                                },
                                child: Taskitem(model: itme));
                          },
                          separatorBuilder: (context, index) => Gap(10),
                          itemCount: tasks.length);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
