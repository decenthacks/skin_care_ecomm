import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:bodyandbeauty/data/repositories/user/user_repository.dart';
import 'package:bodyandbeauty/utils/Popup/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/user/user_model.dart';
import '../../../utils/Loader/loader.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/network_conectivity/network_manager.dart';
import '../../authentication/screens/login/login.dart';
import '../../authentication/screens/re_auth/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();


  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();

  }

  /// Fetch User Record

    Future<void> fetchUserRecord() async {
     try {
       profileLoading.value = true;
       final user = await userRepository.fetchUserDetails();
       this.user(user);
     } catch (e) {
     user(UserModel.empty());
     } finally{
       profileLoading.value = false;
     }
    }
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx user and then check if user data is already stored. If not store new data
      await fetchUserRecord();

    if(user.value.id.isEmpty) {
      if (userCredentials != null && userCredentials.user != null) {
        final displayName = userCredentials.user!.displayName ?? '';
        final nameParts = UserModel.nameParts(displayName);
        final username = UserModel.generateUsername(displayName);
        final firstName = nameParts.isNotEmpty ? nameParts[0] : '';
        final lastName = nameParts.length > 1
            ? nameParts.sublist(1).join(' ')
            : '';


        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: firstName,
          lastName: lastName,
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
        AuthenticationRepository.instance.screenRedirect();
      } else {
        MyLoader.warningSnackBar(
          title: 'Login Failed',
          message: 'No user credentials found.',
        );
      }
    }
    } catch (e) {
      MyLoader.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    } finally {
      MyFullScreenLoader.stopLoading();
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
            child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
            child: Text('Delete')),
      ),
      // ElevatedButton
        cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ), // OutlinedButton
    );
  }


  /// Delete User Account
  void deleteUserAccount() async {
    try {
     // MyFullScreenLoader.openLoadingDialog('Processing', MyImages.docerAnimation);
      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
       // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          MyFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          MyFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      MyFullScreenLoader.stopLoading();MyLoader.warningSnackBar (title: 'Oh Snap!', message: e.toString());
    }
  }



  /// RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
     // MyFullScreenLoader.openLoadingDialog('Processing', MyImages.docerAnimation);
//Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
    MyFullScreenLoader.stopLoading();
    return;
    }
    if (!reAuthFormKey.currentState!.validate()) {
    MyFullScreenLoader.stopLoading();
    return;
    }
    await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
    await AuthenticationRepository.instance.deleteAccount();
    MyFullScreenLoader.stopLoading();
    Get.offAll(() => const LoginScreen());
    } catch (e) {
    MyFullScreenLoader.stopLoading();
    MyLoader.warningSnackBar (title: "Oh Snap!!", message: e.toString());
    }
  }


  /// Upload  Profile Image
  uploadUserProfilePicture() async{
 try {
   final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512,maxWidth: 512);
   if(image != null) {
     final imageUrl = await userRepository.uploadImage('User/Image/Profile', image);

     // update user Image Record
     Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
     await userRepository.updateSingleField(json);

     user.value.profilePicture = imageUrl;
     MyLoader.successSnackBar(title: 'congratulations', message: 'Your Profile Image has been Update!');
   }
 }catch (e) {
     MyLoader.errorSnackBar(title: 'Ohsnap', message: 'Something went wrong $e');
 }
 }

 }

