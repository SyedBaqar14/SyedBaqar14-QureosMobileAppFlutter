import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qureos/authentication/authentication_cubit.dart';
import 'package:flutter_qureos/components/category_list.dart';
import 'package:flutter_qureos/components/helights_list.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/paint/CurveClipper.dart';

class Home extends StatelessWidget {
  const Home() : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    color: kUniversalColor,
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 40),
                          child: Center(
                            child: Text("E-Bin",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36, color: Colors.white)),
                          ),
                        ),
                         SizedBox(height: 10,),
                        Row(
                          children:  [
                            SizedBox(width: 10),
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                              NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=300'),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("Jhon",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: profileTextSize, color: profileTextColor),),
                                SizedBox(width: 15),
                                Text("johan@gmail.com",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: profileTextSize, color: profileTextColor)),
                                SizedBox(width: 15),
                                Text("San Francisco, Italy, CA",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: profileTextSize, color: profileTextColor)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CategoryList()),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Helights",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: helightsTextSize, color: helightsColor)),
                ),
                SizedBox(height: 0,),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: HelightsList()),
              ],
            )
        ),
      );
    });
  }
}
