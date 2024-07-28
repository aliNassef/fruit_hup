import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/cache/cache_helper.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/app_images.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 37,
          backgroundImage: getIt
                      .get<CacheHelper>()
                      .getData(key: AppConstants.userImage) ==
                  null
              ? AssetImage(AppImages.demoProfilr)
              : NetworkImage(
                  getIt.get<CacheHelper>().getData(key: AppConstants.userImage),
                ),
        ),
        PositionedDirectional(
          bottom: -16,
          start: 21.5,
          child: InkWell(
            onTap: () async {
              uploadImageToFirebase();
            },
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xffF9F9F9),
              child: SvgPicture.asset(
                AppImages.camera_icon,
              ),
            ),
          ),
        )
      ],
    );
  }

  String? downloadURL;
  Future<void> uploadImageToFirebase() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      try {
        // Create a reference to the location you want to upload to in Firebase Storage
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('uploads/${file.path.split('/').last}');

        // Upload the file to Firebase Storage
        await storageRef.putFile(file);

        // Get the download URL
        final url = await storageRef.getDownloadURL();
        setState(() {
          if (getIt.get<CacheHelper>().getData(key: AppConstants.userImage) ==
              null) {
            getIt
                .get<CacheHelper>()
                .saveData(key: AppConstants.userImage, value: url);
          } else {
            getIt
                .get<CacheHelper>()
                .put(key: AppConstants.userImage, value: url);
          }
          downloadURL = url;
        });

        print('File uploaded successfully. Download URL: $downloadURL');
      } catch (e) {
        print('Error occurred while uploading the file: $e');
      }
    } else {
      print('No image selected.');
    }
  }
}
