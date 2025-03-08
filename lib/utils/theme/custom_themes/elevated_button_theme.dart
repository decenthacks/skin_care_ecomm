import 'package:flutter/material.dart';


////-- light & dark elevated button theme
class MyelevatedButtonTheme{
  MyelevatedButtonTheme._(); // To avoid creating instance



///---light theme
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.green,
    backgroundColor: Colors.white,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: Colors.green),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);

//---light theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
  elevation: 0,
  foregroundColor: Colors.green,
  backgroundColor: Colors.white,
  disabledForegroundColor: Colors.grey,
  disabledBackgroundColor: Colors.grey,
  side: const BorderSide(color: Colors.green),
  padding: const EdgeInsets.symmetric(vertical: 18),
  textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  );

}