import 'package:amplify_core/amplify_core.dart'; // ✅ Amplify Core
import 'package:uuid/uuid.dart'; // ✅ Generates Unique IDs
import 'formatter.dart';

/// **AWS Amplify User Model**
class UserModel extends Model {
  static var classType = UserModelType(); // ✅ Fixed Model Type

  /// **User Fields**
  @override
  final String id; // ✅ Required Unique ID

  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// **Constructor**
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// **Get Full Name**
  String get fullName => '$firstName $lastName';

  /// **Format Phone Number**
  String get formattedPhoneNo => MyFormatter.formatPhoneNumber(phoneNumber);

  /// **Generate AWS Cognito-Compatible Username**
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    return "aws_${firstName}$lastName"; // ✅ Prefixed with "aws_"
  }

  /// **Create an Empty UserModel**
  static UserModel empty() => UserModel(
    id: const Uuid().v4(), // ✅ Generates Unique ID
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  /// **Convert Model to JSON for AWS GraphQL & DataStore**
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// **Factory method to create a UserModel from AWS GraphQL & DataStore**
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? const Uuid().v4(), // ✅ Fallback for missing ID
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      username: json['Username'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      profilePicture: json['ProfilePicture'] ?? '',
    );
  }

  /// **Factory method to create a UserModel from AWS Cognito Attributes**
  factory UserModel.fromCognitoAttributes(Map<String, String> attributes) {
    return UserModel(
      id: attributes['sub'] ?? const Uuid().v4(), // ✅ Cognito `sub` as ID
      firstName: attributes['given_name'] ?? '',
      lastName: attributes['family_name'] ?? '',
      username: attributes['preferred_username'] ?? '',
      email: attributes['email'] ?? '',
      phoneNumber: attributes['phone_number'] ?? '',
      profilePicture: attributes['picture'] ?? '',
    );
  }

  /// **Copy With Method for Safe Updates**
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  /// **Model Properties for AWS DataStore**
  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    username,
    email,
    phoneNumber,
    profilePicture,
  ];

  @override
  String getId() {
    return id;
  }

  /// **AWS DataStore Fields**
  static const QueryField ID = QueryField(fieldName: 'id');
  static const QueryField FIRSTNAME = QueryField(fieldName: 'FirstName');
  static const QueryField LASTNAME = QueryField(fieldName: 'LastName');
  static const QueryField USERNAME = QueryField(fieldName: 'Username');
}

/// **Required Model Type for AWS Amplify DataStore**
class UserModelType extends ModelType<UserModel> {
  @override
  UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel.fromJson(jsonData);
  }
}




















// import 'package:amplify_flutter/amplify_flutter.dart'; // ✅ AWS Import
// import 'formatter.dart';
//
// class UserModel {
//   /// **User Fields**
//   final String id;
//   String firstName;
//   String lastName;
//   final String username;
//   final String email;
//   String phoneNumber;
//   String profilePicture;
//
//   /// **Constructor**
//   UserModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.username,
//     required this.email,
//     required this.phoneNumber,
//     required this.profilePicture,
//   });
//
//   /// **Get Full Name**
//   String get fullName => '$firstName $lastName';
//
//   /// **Format Phone Number**
//   String get formattedPhoneNo => MyFormatter.formatPhoneNumber(phoneNumber);
//
//   /// **Split Full Name into First and Last Name**
//   static List<String> nameParts(String fullName) {
//     return fullName.split(" ");
//   }
//
//   /// **Generate AWS Cognito-Compatible Username**
//   static String generateUsername(String fullName) {
//     List<String> nameParts = fullName.split(" ");
//     String firstName = nameParts[0].toLowerCase();
//     String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
//     return "aws_${firstName}$lastName"; // ✅ Prefixed with "aws_"
//   }
//
//   /// **Create an Empty UserModel**
//   static UserModel empty() => UserModel(
//     id: UUID.getUUID(), // ✅ AWS Unique ID
//     firstName: '',
//     lastName: '',
//     username: '',
//     email: '',
//     phoneNumber: '',
//     profilePicture: '',
//   );
//
//   /// **Convert Model to JSON for AWS DynamoDB**
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'FirstName': firstName,
//       'LastName': lastName,
//       'Username': username,
//       'Email': email,
//       'PhoneNumber': phoneNumber,
//       'ProfilePicture': profilePicture,
//     };
//   }
//
//   /// **Factory method to create a UserModel from AWS DynamoDB response**
//   factory UserModel.fromMap(Map<String, dynamic> data) {
//     return UserModel(
//       id: data['id'] ?? UUID.getUUID(), // ✅ Fallback for missing ID
//       firstName: data['FirstName'] ?? '',
//       lastName: data['LastName'] ?? '',
//       username: data['Username'] ?? '',
//       email: data['Email'] ?? '',
//       phoneNumber: data['PhoneNumber'] ?? '',
//       profilePicture: data['ProfilePicture'] ?? '',
//     );
//   }
//
//   /// **Factory method to create a UserModel from AWS Cognito Attributes**
//   factory UserModel.fromCognitoAttributes(Map<String, String> attributes) {
//     return UserModel(
//       id: attributes['sub'] ?? UUID.getUUID(), // ✅ Cognito `sub` as ID
//       firstName: attributes['given_name'] ?? '',
//       lastName: attributes['family_name'] ?? '',
//       username: attributes['preferred_username'] ?? '',
//       email: attributes['email'] ?? '',
//       phoneNumber: attributes['phone_number'] ?? '',
//       profilePicture: attributes['picture'] ?? '',
//     );
//   }
// }
