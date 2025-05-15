import 'package:bodyandbeauty/bindings/general_binding.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bodyandbeauty/utils/theme/theme.dart';
import 'package:get/get.dart';

/// --- Use this class to setup themes , intial bindings , any animations and much more

class App extends StatelessWidget{
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),

      //show loader and circular progress indicator meanwhile authentication repository is deciding to show relevant screen

      home: const Scaffold(backgroundColor: MyColors.primary, body: Center(child: CircularProgressIndicator(color: MyColors.white,),),),
    );
  }
}