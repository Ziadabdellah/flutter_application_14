import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/storage/local.dart';
import 'package:flutter_application_14/core/utils/style.dart';
import 'package:flutter_application_14/upload_view.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? Imagepath;

  @override
  void initState() {
    super.initState();
    Applocal.get(Applocal.Name_Key).then((value) {
      setState(() {
        name = value;
      });
    });
    Applocal.get(Applocal.Image_Key).then((value) {
      setState(() {
        imagepath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$name', style: getTitleStyle()),
            Text(
              'Welcome To Taskati',
              style: getTitleStyle(),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: (imagepath != null)
              ? FileImage(File(imagepath!)) as ImageProvider
              : AssetImage(
                  'assets/end.jpg',
                ),
        ),
      ],
    );
  }
}
