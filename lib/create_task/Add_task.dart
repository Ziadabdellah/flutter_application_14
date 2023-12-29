import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/storage/taskhiv.dart';
import 'package:flutter_application_14/core/utils/app_colors.dart';
import 'package:flutter_application_14/core/utils/style.dart';
import 'package:flutter_application_14/core/widgets/custom_button.dart';
import 'package:flutter_application_14/create_task/color_widg.dart';
import 'package:flutter_application_14/create_task/custom_text.dart';
import 'package:flutter_application_14/functions/functions.dart';
import 'package:flutter_application_14/home/home_view.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  var titlecon = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var notecon = TextEditingController();
  String Date = DateFormat.yMMMd().format(DateTime.now());

  String start_time = DateFormat("hh:mm").format(DateTime.now());

  String end_time =
      DateFormat('hh:mm').format(DateTime.now().add(Duration(minutes: 30)));
  int color_index = 0;
  late Box<task_hiv> box;
  @override
  void initState() {
    super.initState();
    box = Hive.box<task_hiv>('task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              push(context, home());
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: AppColors.dark,
        centerTitle: true,
        title: Text('Add task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              custom_text(
                cont: titlecon,
                name: 'Title',
                lines: 1,
              ),
              Gap(10),
              custom_text(
                cont: notecon,
                name: "Note",
                lines: 3,
              ),
              Gap(10),
              Text(
                'Date',
                style: getbodyStyle(),
              ),
              TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.bla),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: Date,
                      suffixIcon: IconButton(
                          onPressed: () {
                            ShowDateDialog();
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: AppColors.bla,
                          )))),
              Gap(10),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Start Time',
                    style: getbodyStyle(),
                  )),
                  Expanded(
                      child: Text(
                    'End Time',
                    style: getbodyStyle(),
                  ))
                ],
              ),
              Gap(4),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: start_time,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ShowStartTimeDialog();
                                  },
                                  icon: Icon(
                                    Icons.watch_later,
                                    color: AppColors.greyColor,
                                  ))))),
                  Gap(10),
                  Expanded(
                      child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: end_time,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ShowendTimeDialog();
                                    {}
                                  },
                                  icon: Icon(
                                    Icons.watch_later,
                                    color: AppColors.greyColor,
                                  )))))
                ],
              ),
              Gap(15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color_index = 0;
                      });
                    },
                    child: CircleAvatar(
                        radius: 20,
                        child: color_Item(
                          isChecked: ((color_index == 0) ? true : false),
                          color: const Color.fromARGB(255, 255, 0, 0),
                        )),
                  ),
                  Gap(7),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color_index = 1;
                      });
                    },
                    child: CircleAvatar(
                        radius: 20,
                        child: color_Item(
                            isChecked: ((color_index == 1) ? true : false),
                            color: Color.fromARGB(255, 48, 254, 217))),
                  ),
                  Gap(7),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color_index = 2;
                      });
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.redColor,
                      child: color_Item(
                        isChecked: ((color_index == 2) ? true : false),
                        color: Color.fromARGB(255, 22, 28, 30),
                      ),
                    ),
                  ),
                  Spacer(),
                  Custom_(
                    text: 'Done Task',
                    onTap: () async {
                      String id =
                          titlecon.text + DateTime.now().toIso8601String();
                      if (formkey.currentState!.validate()) {
                        await box
                            .put(
                                id,
                                task_hiv(
                                    id: id,
                                    title: titlecon.text,
                                    note: notecon.text,
                                    date: Date,
                                    starttime: start_time,
                                    endtime: end_time,
                                    color: color_index,
                                    iscomplete: false))
                            .then((value) {
                          pushWithReplacment(context, home());
                        });
                      }
                    },
                    width: 120,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ShowDateDialog() async {
    DateTime? DatePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1907),
      lastDate: DateTime(2090),
    );
    if (DatePicker != null) {
      setState(() {
        Date = DateFormat.yMd().format((DatePicker));
      });
    }
  }

  ShowStartTimeDialog() async {
    TimeOfDay? pickedstarttime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedstarttime != null) {
      setState(() {
        start_time = pickedstarttime.format(context);
        end_time = pickedstarttime.replacing(minute: 30).format(context);
      });
    }
  }

  ShowendTimeDialog() async {
    TimeOfDay? pickedstarttime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedstarttime != null) {
      setState(() {
        end_time = pickedstarttime.format(context);
      });
    }
  }
}
