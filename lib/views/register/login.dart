import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qureos/authentication/authentication_cubit.dart';
import 'package:flutter_qureos/components/Heading.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/routes/routes_names.dart';
import 'package:flutter_qureos/utils/AssetConfig.dart';
import 'package:flutter_qureos/views/home/home.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    super.initState();
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    authenticationCubit.fToast.init(context);
    authenticationCubit.emailController.clear();
    authenticationCubit.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Center(child: Text("Dukkantek",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color:
                          kUniversalColor),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 35),
                      child: Heading(
                        text: "Login",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color:
                              Colors.grey.withOpacity(1)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.passwordController,
                        obscureText: state.isObsecure,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ).copyWith(
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                // isObsecure = !isObsecure;
                                if(state.isObsecure) {
                                  authenticationCubit.setIsObscure(isObsecure: false);
                                } else {
                                  authenticationCubit.setIsObscure(isObsecure: true);
                                }
                              });
                            },
                            child: state.isObsecure
                                ? const Icon(
                              Icons.remove_red_eye,
                              size: 20,
                            )
                                : const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 20,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Password is required";
                          } else if (val.length < 8) {
                            return "Password must be 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    state.isloading
                    ? const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                    :
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 35, right: 35),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                                backgroundColor: kUniversalColor,
                                side: const BorderSide(width: 2.0, color: kUniversalColor,
                                )),
                            onPressed: () async {
                              await authenticationCubit.signin().then((value) {
                                if(state.isLoginSuccess) {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()),
                                          (route) => false);
                                } else {
                                  authenticationCubit.showToast(message: "login failed");
                                }
                              });
                            }, child: const Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("New User? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color:
                                  Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(register);
                              },
                              child: const Text("Register Here",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    color:
                                    Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: 120,
                            color: Colors.black,
                          ),
                          const Text("Or login with"),
                          Container(
                            height: 1,
                            width: 120,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () async {
                          await authenticationCubit.handleGoogleSignIn();
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                                  (route) => false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AssetConfig.kGoogleLogo,
                              height: 20,
                            ),
                            const Text("Google"),
                            Container(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
