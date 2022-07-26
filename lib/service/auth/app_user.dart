import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class AppUser {
  const AppUser(
      {required this.id, this.email, this.photoUrl, this.displayName});

  final String id;
  final String? email;
  final String? photoUrl;
  final String? displayName;
}
