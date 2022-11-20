import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';

import 'package:flutter_application_2/views/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: Color.fromARGB(255, 24, 210, 37),
        unselectedItemColor: Colors.white,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.add, size: 30),
           // icon: CustomIcon(),//day la 1 ham ben widgets no la cai dau con a
            label: 'add',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.message, size: 30),
          //   label: 'Messages',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
      ),
      //body:Center(child: Text('homehome')),
      body: pages[pageIdx],//la hien thi ne moi cai nhap vao thif qua trang constants.dart
    );
  }
}
