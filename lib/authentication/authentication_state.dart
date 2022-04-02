
part of 'authentication_cubit.dart';
class AuthenticationState {
  bool isLoginSuccess;
  bool isloading;
  bool isObsecure;

  AuthenticationState({
    required this.isLoginSuccess,
    required this.isloading,
    required this.isObsecure});

  AuthenticationState copyWith({
    bool? isLoginSuccess,
    bool? isloading,
    bool? isObsecure
}) {
    return AuthenticationState(isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
        isloading:  isloading ?? this.isloading,
        isObsecure: isObsecure ?? this.isObsecure);
  }
}