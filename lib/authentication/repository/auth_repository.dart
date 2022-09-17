import 'package:chat_app/authentication/entities/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  static final AuthRepo instance = _FirebaseImplementation();

  Future<Profile?> getInitialUser();

  Future<Profile> signIn(String email, String password);

  Future<Profile> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<Profile> loginWithGoogle();

  phoneLogin({
    required String phone,
    required void Function(Profile user) onDone,
    required void Function(String id) onCodeSent,
    required void Function() onCodeTimeOut,
  });

  Future<Profile> phoneCodeLogin(String codeId, String code);

  Future<void> logout();
}

class _FirebaseImplementation implements AuthRepo {
  @override
  Future<Profile?> getInitialUser() {
    // TODO: implement getInitialUser
    throw UnimplementedError();
  }

  @override
  Future<Profile> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Profile> phoneCodeLogin(String codeId, String code) {
    // TODO: implement phoneCodeLogin
    throw UnimplementedError();
  }

  @override
  phoneLogin({
    required String phone,
    required void Function(Profile user) onDone,
    required void Function(String id) onCodeSent,
    required void Function() onCodeTimeOut,
  }) {
    // TODO: implement phoneLogin
    throw UnimplementedError();
  }

  @override
  Future<Profile> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Profile> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user.user!.updateDisplayName(name);

    return Profile.fromFirebaseUser(user.user!);
  }
}
