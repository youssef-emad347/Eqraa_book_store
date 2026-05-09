import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eqraa_book_store/feature/authentication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // login
  Future<void> login(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // sginup
  Future<void> signUp(UsersModel user, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    // store in firestore
    try {
      print("Attempting to store user data in Firestore for UID: ${credential.user!.uid}");
      await firestore.collection('users').doc(credential.user!.uid).set(
        user.toJson(),
      ).timeout(const Duration(seconds: 10)); // Timeout after 10s
      print("Firestore Success!");
    } catch (e) {
      print("Firestore Error: $e");
      throw Exception("Auth succeeded but Firestore failed: $e");
    }
  }
}
