
part of 'authentication_cubit.dart';
class AuthenticationState {
  bool isLoginSuccess;
  bool isloading;
  bool isObsecure;
  String emailAddress;

  AuthenticationState({
    required this.emailAddress,
    required this.isLoginSuccess,
    required this.isloading,
    required this.isObsecure});

  AuthenticationState copyWith({
    String? emailAddress,
    bool? isLoginSuccess,
    bool? isloading,
    bool? isObsecure
}) {
    return AuthenticationState(
        emailAddress: emailAddress ?? this.emailAddress,
        isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
        isloading:  isloading ?? this.isloading,
        isObsecure: isObsecure ?? this.isObsecure);
  }
}
