// ignore_for_file: unused_import

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

class UserSecureStore {
  //UserSecureStore(this.flutterSecureStorage);

  //final FlutterSecureStorage flutterSecureStorage;

  static const String storageKey = "emailAddress";

  Future<void> save(String email) async {
    //await flutterSecureStorage.write(key: storageKey, value: email);
  }

  Future<void> clear() async {
    //await flutterSecureStorage.delete(key: storageKey);
  }

  Future<String?> get() async {
    return null;
    // await flutterSecureStorage.read(key: storageKey);
  }
}
