import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconoir_flutter/user_circle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/profile_controller.dart';
import 'package:mengo_delivery/models/user_model.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../network/api_call_status.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(onTap: () {
            Get.back();
          }),
          title: const Text("Edit Profile"),
        ),
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            return OverlayLoaderWithAppIcon(
              isLoading: controller.apiCallStatus == ApiCallStatus.loading,
              overlayBackgroundColor: Colors.black,
              circularProgressColor: primaryColor,
              appIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/icons/logo.png')),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // -- IMAGE with ICON
                      InkWell(
                        onTap: () {
                          _showImageSource(context, controller);
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            controller.userModel.profile ??
                                                "")),
                                    border: Border.all(color: primaryColor)),

                                // child: _imageFile == null
                                //     ? const Placeholder(
                                //         // fallbackHeight: 200,
                                //         // fallbackWidth: double.infinity,
                                //         child: Icon(
                                //           Icons.image,
                                //           size: 150,
                                //         ),
                                //       )
                                //     : Image.file(
                                //         _imageFile!,
                                //         height: 200,
                                //         width: double.infinity,
                                //         fit: BoxFit.cover,
                                //       ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: primaryColor),
                                child: const Icon(LineIcons.camera,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),

                      // -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: controller.userModel.name,
                              onChanged: (value) {
                                controller.setUserName(value);
                              },
                              decoration: const InputDecoration(
                                  label: Text("Full Name"),
                                  prefixIcon: Icon(LineIcons.user)),
                            ),

                            const CustomVerticalSpacer(height: 10),

                            // const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: controller.userModel.phone,
                              onChanged: (value) {
                                controller.setPhone(value);
                              },
                              decoration: const InputDecoration(
                                  label: Text("Phone"),
                                  prefixIcon: Icon(LineIcons.phone)),
                            ),
                            const CustomVerticalSpacer(height: 10),

                            // TextFormField(
                            //   obscureText: true,
                            //   decoration: InputDecoration(
                            //     label: const Text("Password"),
                            //     prefixIcon: const Icon(Icons.fingerprint),
                            //     suffixIcon: IconButton(
                            //         icon: const Icon(LineIcons.eye_slash),
                            //         onPressed: () {}),
                            //   ),
                            // ),
                            const CustomVerticalSpacer(height: 30),

                            // -- Form Submit Button
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // print(_imageFile!.path);
                                  controller.updateProfile(
                                    context,
                                    UserModel(
                                      name: controller.userModel.name,
                                      phone: controller.userModel.phone,
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: Text("Save",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp)),
                              ),
                            ),
                            // const SizedBox(height: tFormHeight),

                            // -- Created Date and Delete Button
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  Future<void> _getImage(
      ImageSource source, ProfileController controller) async {
    XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        controller.updateProfileImage(context, File(pickedFile.path));
      });
    } else {
      print('No image selected.');
    }
  }

  void _showImageSource(BuildContext context, ProfileController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  _getImage(ImageSource.gallery, controller);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a Picture'),
                onTap: () {
                  _getImage(ImageSource.camera, controller);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
