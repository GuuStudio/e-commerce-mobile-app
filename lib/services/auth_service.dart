import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthService {
  final _auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e ) {
      exceptionHandler(e.code);
    }
    catch (e) {
      log('Sign Up is fail, have a error ');
    }
    return null;
  }

  Future<User?> signInUserWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      log('Sign in is fail, have a error ');
    }
    return null;
  }
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Sign in is fail, have a error ');
    }
  }

  Future<UserCredential?> signInWithEmail() async {
    try {
      final googleSignIn = await GoogleSignIn().signIn();
      final googleAuth = await googleSignIn?.authentication;

      final googleCre = GoogleAuthProvider.credential(idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken,);
      return _auth.signInWithCredential(googleCre);
    }catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> sendPasswordResetLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    }catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendEmailVertifyLink() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }catch (e) {
      log(e.toString());
    }
  }

  exceptionHandler(String code ) {
    switch(code) {
      case "invalid-credential":
        log("Your login credentials are invalid");
      case "weak-password":
        log('Your password must least 8 characters');
      case 'email-already-in-use':
        log('User already exist');
      default:
        log('Something wrong');
    }
  }
}

//keytool -list -v -keystore ".android\debug.keystore" -alias androiddebugkey -storepass android -keypass android