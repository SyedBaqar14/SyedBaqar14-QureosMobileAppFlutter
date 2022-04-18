import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/views/home/home.dart';
import 'package:flutter_qureos/views/profile/profile.dart';
import 'package:flutter_qureos/views/scan_qr/scan_qr_code.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    const ScanQRCode(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        color: kUniversalColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 35,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                  Icons.qr_code_2,
                  color: Colors.white,
                  size: 35,
                )
                    : const Icon(
                  Icons.qr_code_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text("Scan QR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35,
                )
                    : const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
            ],
          ),
        ],
      ),
    );
  }
}