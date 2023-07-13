import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> signup(String email, String name, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user?.uid)
        .set({
      'name': name,
      'email': email,
    });

    return true;
  } catch (e) {
    print('Error during signup: $e');
  }
  return false;
}

Future<bool> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } catch (e) {
    print('Error during login: $e');
  }
  return false;
}
