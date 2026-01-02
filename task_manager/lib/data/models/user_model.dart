// _id":"69565b5b880cc5d30a308035",
// "email":"tajvir@gmail.com",
// "firstName":"aaa",
// "lastName":"bbb",
// "mobile":"01688502326",
// "createdDate":"2025-10-02T06:21:41.011Z"},
// "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NjczNTM1OTEsImRhdGEiOiJ0YWp2aXJAZ21haWwuY29tIiwiaWF0IjoxNzY3MjY3MTkxfQ.v_1mr0wv2uEXDHlcNpYFUjfth9y5XY9EXanZjTp8dWs"}

// Create a user model class to store the data from api response and convert it Json to dart model
class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;

  // Constructor for UserModel class
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
  });

  /**
   * 1. API থেকে JSON আসে Map<String, dynamic> format এ
   * 2. Map<String, dynamic> jsonData -> API থেকে আসা decoded JSON
   * 3. factory ব্যবহার করি কারণ:
   *    JSON → Object convert করতে
   *    constructor এর মতো কাজ করে কিন্তু extra logic allow করে
   */

  // // JSON থেকে UserModel object বানানোর জন্য factory constructor
  factory UserModel.fromJson(Map<String, dynamic> jsonData) { // JSON ডেটা দিলে আমি UserModel বানিয়ে দিব

    // JSON থেকে data নিয়ে নতুন UserModel object বানানো হচ্ছে. memory তে user object create হচ্ছে
    return UserModel(
      id: jsonData['_id'],   // JSON এর _id key থেকে value নিচ্ছে. সেটা UserModel এর id field এ ঢুকছে
      email: jsonData['email'],     // // email parse
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      mobile: jsonData['mobile'],
    );
  }


  /**
   * 1. function return করছে একটা Map
   *    API body বানাতে
   *    SharedPreferences save করতে
   *    decoded json -> jsonEncode() করতে
   */

  // UserModel object কে আবার JSON বানানোর method
  Map<String, dynamic> toJson() {

    // Dart Map create করা শুরু
    return {
      "_id": id,   // model id → backend _id
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };
  }
}