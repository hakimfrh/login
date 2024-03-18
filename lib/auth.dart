// import 'package:firebase_auth/firebase_auth.dart';

// class AuthServices {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Mendengarkan perubahan status otentikasi
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // Login anonim
//   Future<User?> signInAnonymously() async {
//     try {
//       UserCredential userCredential = await _auth.signInAnonymously();
//       return userCredential.user;
//     } catch (e) {
//       if (e is FirebaseException) {
//         // Handle FirebaseException here
//         print('FirebaseException during anonymous login: ${e.message}');
//         return null; // Return null in case of an error
//       } else {
//         // Handle other exceptions here
//         print('Error during anonymous login: $e');
//         return null; // Return null in case of an error
//       }
//     }
//   }

//   // Logout
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }
