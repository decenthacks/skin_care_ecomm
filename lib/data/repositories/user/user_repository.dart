import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';
import 'package:bodyandbeauty/data/repositories/user/user_model.dart'; // ✅ Import UserModel

/// Repository class for user-related operations using AWS Amplify.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// **Function to save user data to AWS DynamoDB via Amplify DataStore**
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await Amplify.DataStore.save(user); // ✅ Save UserModel to AWS DataStore
    } on DataStoreException catch (e) {
      print("❌ AWS DataStore Error: ${e.message}");
      throw Exception("AWS DataStore Error: ${e.message}");
    } on AmplifyException catch (e) {
      print("❌ AWS Amplify Exception: ${e.message}");
      throw Exception("Amplify Exception: ${e.message}");
    } catch (e) {
      print("❌ Unexpected Error: $e");
      throw Exception("Something went wrong. Please try again.");
    }
  }

  /// **Function to fetch user data from AWS**
  Future<UserModel?> getUserRecord(String userId) async {
    try {
      List<UserModel> users = await Amplify.DataStore.query(
        UserModel.classType, // ✅ Correct classType usage
        where: UserModel.ID.eq(userId), // ✅ Correct way to query by ID
      );
      return users.isNotEmpty ? users.first : null;
    } on DataStoreException catch (e) {
      print("❌ AWS DataStore Query Error: ${e.message}");
      throw Exception("AWS DataStore Query Error: ${e.message}");
    } catch (e) {
      print("❌ Unexpected Error: $e");
      throw Exception("Something went wrong. Please try again.");
    }
  }
}
