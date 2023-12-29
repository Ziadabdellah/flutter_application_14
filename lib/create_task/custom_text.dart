import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/utils/app_colors.dart';
import 'package:flutter_application_14/core/utils/style.dart';
import 'package:gap/gap.dart';

class custom_text extends StatefulWidget {
  const custom_text({super.key, required this.cont, required this.name, required this.lines});

  final TextEditingController cont;
  final String name;
  final int lines;
  @override
  State<custom_text> createState() => _custom_textState();
}

class _custom_textState extends State<custom_text> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: getbodyStyle(),
        ),
        Gap(4),
        TextFormField(
          maxLines:widget.lines,
          controller: widget.cont,
          validator: (value) {
            if (value!.isEmpty) ;
            {
              return '${widget.name}task title*';
            }

            // ignore: dead_code
            return null;
          },
          decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15) 
                , borderSide:BorderSide(color: AppColors.greyColor)),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                   , borderSide:BorderSide(color: AppColors.redColor)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                   , borderSide:BorderSide(color: AppColors.greyColor)),
              focusedErrorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                   , borderSide:BorderSide(color: AppColors.redColor)),
              hintText: 'Write ${widget.name} task'),
        ),
      ],
    );
  }
}
