// ignore_for_file: unused_import
import 'dart:async';
import 'package:meta/meta.dart';
import 'app_user.dart';

abstract class AuthService {
  Future<AppUser> currentUser();
  Future<AppUser> signIn(String email, String password);
  Future<AppUser> createUser(String email, String password);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
  Stream<AppUser> get onAuthStateChanged;
  void dispose();
}
