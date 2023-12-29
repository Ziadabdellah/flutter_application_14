

import 'package:flutter/material.dart';

class color_Item extends StatelessWidget {
  const color_Item({super.key, required this.isChecked, required this.color});

  final bool isChecked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
      child: (isChecked)
          ? Icon(
              Icons.check,
              color: Colors.white,
            )
          : SizedBox(),
    );
    
  }
}
