import 'package:chat_app/authentication/entities/profile.dart';
import 'package:chat_app/authentication/repository/auth_repository.dart';
import 'package:chat_app/authentication/screens/login_screen.dart';
import 'package:chat_app/common/screens/home_screen.dart';
import 'package:chat_app/common/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerRef = ChangeNotifierProvider((ref) => AuthController());

class AuthController extends ChangeNotifier {
  final repository = AuthRepo.instance;
  Profile? _profile;

  Future<void> init() async {
    final profile = await repository.getInitialUser();

    if (profile != null) {
      _profile = profile;
      goToHomeScreen();
    } else {
      AppRouter.instance.pushReplacement(LoginScreen());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await repository.signIn(email, password);

      _profile = user;
      goToHomeScreen();
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<void> singUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await repository.signUp(
        email: email,
        password: password,
        name: name,
      );

      _profile = user;
      goToHomeScreen();
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }

  goToHomeScreen() {
    appRouter.replaceAllWith(widget: const HomeScreen());
  }
}
