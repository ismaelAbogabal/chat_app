import 'package:chat_app/authentication/screens/login_screen.dart';
import 'package:chat_app/common/utils/app_router.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  /// initialize application module then navigate to home
  Future<void> _init() async {
    await Future.delayed(Duration(seconds: 1));

    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    appRouter.pushReplacement(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return const Material(child: LoadingWidget());
  }
}
