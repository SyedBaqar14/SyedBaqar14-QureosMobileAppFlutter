
import 'package:flutter_qureos/provider/LoginProvider.dart';
import 'package:flutter_qureos/provider/RegisterProvider.dart';

class AuthenticationRepository {

  Future<bool> signin({required email, required password}) async {

    final result = await LoginProvider().getLogin(email: email,
        password: password);

    return result;
  }

  Future<bool> register({required email, required password}) async {

    final result = await RegisterProvider().getRegister(email: email,
        password: password);

    return result;
  }

}