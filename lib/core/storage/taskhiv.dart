import 'package:hive/hive.dart';
part 'taskhiv.g.dart';
@HiveType(typeId: 1)
class task_hiv {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String starttime;
  @HiveField(5)
  final String endtime;
  @HiveField(6)
  final int color;
  @HiveField(7)
  final bool iscomplete;

  task_hiv(
      {required this.id,
      required this.title,
      required this.note,
      required this.date,
      required this.starttime,
      required this.endtime,
      required this.color,
      required this.iscomplete});
}
