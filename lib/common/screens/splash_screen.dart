import 'package:chat_app/authentication/controller/auth_controller.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/loading_widget.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  /// initialize application module then navigate to home
  Future<void> _init(WidgetRef ref) async {
    await Future.delayed(Duration(seconds: 1));

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    ref.read(authControllerRef).init();
  }

  @override
  Widget build(BuildContext context, ref) {
    _init(ref);

    return const Material(child: LoadingWidget());
  }
}
