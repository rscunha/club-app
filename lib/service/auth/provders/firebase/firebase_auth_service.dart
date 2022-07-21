// ignore_for_file: unused_import, unused_field

import 'package:b2c_app/service/auth/auth_service.dart';
import 'package:b2c_app/service/auth/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppUser _userFromFirebase(User? user) {
    if (null == user) {
      throw Exception(
          'Invalid Firebase User. Please Contact the Administrator App');
    }

    return AppUser(
        id: user.uid,
        email: user.email,
        displayName: user.displayName,
        photoUrl: user.photoURL);
  }

  @override
  Future<AppUser> currentUser() async {
    return _userFromFirebase(_firebaseAuth.currentUser);
  }

  @override
  void dispose() {}

  @override
  Stream<AppUser> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map(_userFromFirebase);

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<AppUser> signIn(String email, String password) async {
    final UserCredential credentials = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return _userFromFirebase(credentials.user);
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  @override
  Future<AppUser> createUser(String email, String password) async {
    final UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  final authServiceProvider = Provider<AuthService>((ref) {
    return FirebaseAuthService();
  });
}
