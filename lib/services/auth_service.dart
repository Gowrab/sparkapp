import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _fireStoreData = FirebaseFirestore.instance
      .collection('User');

  Future loginWithEmail(
      {required String email, required String password}) async {
    try{
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }

  }

  Future forgetPassword(
      {required String email}) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(
          email: email);
      return "Verification E-mail has been sent";
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }


  }

  Future signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      String? dob,
      String? gender}) async {
    try {
      final response = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        _fireStoreData.doc(value.user!.uid).set({
          "email": value.user!.email,
          'name': name,
          'dob': dob,
          'gender': gender,
        });
      });

      return response;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}




