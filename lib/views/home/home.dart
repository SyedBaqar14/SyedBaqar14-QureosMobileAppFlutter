import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dukkantek"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.black.withOpacity(0.8),
        child: Center(child: Text("Welcome",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500,
            color: Colors.white),)),
      ),
    );
  }
}
