import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/storage/local.dart';
import 'package:flutter_application_14/core/widgets/custom_button.dart';
import 'package:flutter_application_14/home/home_view.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

String? imagepath;
String name = '';

class upload_view extends StatefulWidget {
  const upload_view({super.key});

  @override
  State<upload_view> createState() => _upload_viewState();
}

class _upload_viewState extends State<upload_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  actions: [
    TextButton(
      onPressed: () {
        if (imagepath != null && name.isNotEmpty) {
          Applocal.CacheData(Applocal.Image_Key, imagepath!);
          Applocal.CacheData(Applocal.Name_Key, name);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => home(),
            ),
          );
        } else if (imagepath == null && name.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 25, 8),
              duration: Duration(seconds: 2),
              content: Text('Please enter your photo'),
            ),
          );
          return;
        } else if (imagepath == null && name.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 25, 8),
              duration: Duration(seconds: 2),
              content: Text('Please enter your photo and your name'),
            ),
          );
          return;
        }

        // Default message if none of the conditions is met
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromARGB(255, 255, 25, 8),
            duration: Duration(seconds: 2),
            content: Text('Please enter your name'),
          ),
        );
      },
      child: Text('Done'),
    ),
  ],
),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: (imagepath != null)
                    ? FileImage(File(imagepath!)) as ImageProvider
                    : AssetImage(
                        'assets/end.jpg',
                      ),
              ),
              Gap(15),
              Custom_botton(
                  text: 'Take a picture from the camera',
                  onTap: () {
                    _uploadFromCamera();
                  },
                  width: 360),
              Gap(10),
              Custom_botton(
                text: 'Use photos from the gallery',
                onTap: () {
                  _uploadFromgallery();
                },
                width: 360,
              ),
              Gap(20),
              Divider(
                height: 5,
              ),
              Gap(20),
              TextFormField(
                onChanged: (value) => {
                  setState(() {
                    name = value;
                  }),
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 17, 0))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 21, 4))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _uploadFromCamera() async {
    {
      // Pick image from the camera
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        // User canceled image picking
        setState(() {
          imagepath = pickedImage.path;
        });
      }
    }
  }

  _uploadFromgallery() async {
    {
      // Pick image from the camera
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        // User canceled image picking
        setState(() {
          imagepath = pickedImage.path;
        });
      }
    }
  }
}




// appBar: AppBar(
//         actions: [
//           TextButton(
//               onPressed: () {
//                 if (imagepath != null && name.isNotEmpty) {
//                   Applocal.CacheData(Applocal.Image_Key, imagepath!);
//                   Applocal.CacheData(Applocal.Name_Key, name);
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                         builder: (BuildContext context) => home()),
//                   );
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       backgroundColor: const Color.fromARGB(255, 255, 25, 8),
//                       duration: Duration(seconds: 2),
//                       content: Text('Please enter your name')));
//                 } else if (imagepath == null && name.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       backgroundColor: const Color.fromARGB(255, 255, 25, 8),
//                       duration: Duration(seconds: 2),
//                       content: Text('Please enter your photo')));
//                 } else if (imagepath == null && name.isNotEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       backgroundColor: const Color.fromARGB(255, 255, 25, 8),
//                       duration: Duration(seconds: 2),
//                       content: Text(
//                           'Please enter your photo and Please enter your name')));
//                 }
//               },
//               child: Text('Done'))
//         ],
//       ),