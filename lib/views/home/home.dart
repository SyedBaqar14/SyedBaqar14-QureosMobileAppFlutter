import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qureos/authentication/authentication_cubit.dart';

class Home extends StatelessWidget {

  const Home() : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Dukkantek"),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            color: Colors.black.withOpacity(0.8),
            child: Center(child: Text(state.emailAddress == "" ? "Google signIn needs firebase linking and production SHA1 certificate" : "Hello ${state.emailAddress}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500,
                color: Colors.white),
            overflow: TextOverflow.ellipsis,)),
          ),
        );
      }
    );
  }
}
