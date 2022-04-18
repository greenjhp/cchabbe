import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Cchabbe_first_page.dart';
import 'package:cchabbe/pages/Cchabbe_forth_page.dart';
import 'package:cchabbe/pages/Cchabbe_second_page.dart';
import 'package:cchabbe/pages/Cchabbe_third_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Homepage(),
    );
  }
}

//0번째 페이지(모든 페이지 모아두는 곳)
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          CchabbeFirstPage(),
          CchabbeSecondPage(),
          CchabbeThirdPage(),
          CchabbeForthPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        }, //git branch na2등록을 위한 변경입니다
        currentIndex: currentIndex,
        iconSize: 24,
        unselectedItemColor: CchabbeColor.grey2,
        selectedItemColor: CchabbeColor.bluegrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "채팅"),
          BottomNavigationBarItem(icon: Icon(Icons.new_releases), label: "알림"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "MY"),
        ],
      ),
    );
  }
}
