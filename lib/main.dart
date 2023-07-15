import 'package:club_app/features/welcome/presentation/controllers/auth_entry_point.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seja Bem vindo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme:
              const InputDecorationTheme(border: InputBorder.none)),
      home: const AuthEntryPoint(),
    );
  }
}
