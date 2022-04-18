import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qureos/authentication/authentication_cubit.dart';
import 'package:flutter_qureos/components/Heading.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/routes/routes_names.dart';

class Register extends StatefulWidget {
  static const routeName = "views.register";

  const Register() : super();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late final AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    super.initState();
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    authenticationCubit.fToast.init(context);
    authenticationCubit.registerControllerName.clear();
    authenticationCubit.registerControllerPassword.clear();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(login);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 30,
                          color: kUniversalColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 35),
                      child: Heading(
                        text: "Register",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerPassword,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Address 1",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Address 2",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Address 3",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Postalcode",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "City",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "State",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: TextFormField(
                        controller: authenticationCubit.registerControllerName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 35, right: 35),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                fixedSize: Size.fromWidth(
                                    MediaQuery.of(context).size.width),
                                backgroundColor: kUniversalColor,
                                side: const BorderSide(
                                  width: 2.0,
                                  color: kUniversalColor,
                                )),
                            onPressed: () {
                              authenticationCubit.register();
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                      child: RichText(
                        text: const TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "By clicking register you are agree to our ",
                                style: TextStyle(
                                  color: Colors.black,
                                fontWeight: FontWeight.bold)),
                            TextSpan(text: "Privacy Policy ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kUniversalColor,)),
                            TextSpan(text: "& ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: "Terms & Conditions. ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kUniversalColor,)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
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
