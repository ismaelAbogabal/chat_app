import 'package:chat_app/authentication/entities/profile.dart'; 

abstract class AuthenticationRepository {
  /// get initial user when application starts
  Future<Profile> getInitialUser();

  Future<Profile> loginIn({required String email, required String password});

  Future<Profile> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<void> requestRestPassword(String email);

  Future<void> resetPassword(String oldPassword, String newPassword);

  Future<Profile> loginWithGoogle();

  /// send code into phone number
  loginWithPhone({
    required String phoneNumber,
    required void Function(Profile user) onDone,
    required void Function() onTimeOut,
    required void Function(String codeId) onCodeSent,
  });

  Future<Profile> verifyPhoneCode({required String id, required String code});
}
