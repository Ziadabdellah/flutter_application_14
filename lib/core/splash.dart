import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/utils/style.dart';
import 'package:flutter_application_14/home/home_view.dart';
import 'package:flutter_application_14/upload_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class splash_view extends StatefulWidget {
  const splash_view({super.key});

  @override
  State<splash_view> createState() => _splash_viewState();
}

class _splash_viewState extends State<splash_view> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (c) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/LottieLogo1.json'),
            Text(
              'Taskati',
              style: getTitleStyle(),
            ),
            Gap(10),
            Text(
              'Write down your tasks',
              style: getbodyStyle(),
            )
          ],
        ),
      ),
    );
  }
}
