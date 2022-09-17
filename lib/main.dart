import 'package:chat_app/common/screens/splash_screen.dart';
import 'package:chat_app/common/utils/app_router.dart';
import 'package:chat_app/common/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat course',
      theme: theme,
      navigatorKey: AppRouter.instance.key,
      home: const SplashScreen(),
    );
  }
}