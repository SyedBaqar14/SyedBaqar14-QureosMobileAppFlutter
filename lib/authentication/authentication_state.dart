
part of 'authentication_cubit.dart';
class AuthenticationState {
  bool isLoginSuccess;
  bool isloading;
  bool isObsecure;
  String emailAddress;
  GoogleSignInAccount? googleSignInAccount;

  AuthenticationState({
    required this.emailAddress,
    required this.isLoginSuccess,
    required this.isloading,
    required this.isObsecure,
    required this.googleSignInAccount});

  AuthenticationState copyWith({
    String? emailAddress,
    bool? isLoginSuccess,
    bool? isloading,
    bool? isObsecure,
    GoogleSignInAccount? googleSignInAccount
}) {
    return AuthenticationState(
        emailAddress: emailAddress ?? this.emailAddress,
        isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
        isloading:  isloading ?? this.isloading,
        isObsecure: isObsecure ?? this.isObsecure,
        googleSignInAccount: googleSignInAccount ?? this.googleSignInAccount);
  }
}