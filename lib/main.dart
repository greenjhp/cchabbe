import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Cchabbe_first_page.dart';
import 'package:cchabbe/pages/Cchabbe_forth_page.dart';
import 'package:cchabbe/pages/Cchabbe_second_page.dart';
import 'package:cchabbe/pages/Cchabbe_third_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cchabbe',
      home: LoginPage(),
    );
  }
}

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();
        return Scaffold(
          backgroundColor: CchabbeColor.black,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 121),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    //추후 로고 이미지로 대체
                    child: Text(
                      '차빼',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        '개인정보 노출 없이 안전하게 주차하자',
                        style: TextStyle(
                          color: CchabbeColor.bluegrey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),

                  /// 이메일
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: numberController,
                    decoration: InputDecoration(hintText: "이메일"),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "비밀번호"),
                  ),

                  /// 로그인 버튼
                  ElevatedButton(
                    child: Text("로그인", style: TextStyle(fontSize: 21)),
                    onPressed: () {
                      // 로그인
                      authService.signIn(
                        email: numberController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          // 로그인 성공
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("로그인 성공"),
                          ));

                          // HomePage로 이동
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        },
                        onError: (err) {
                          // 에러 발생
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                  ),

                  /// 회원가입 버튼
                  ElevatedButton(
                    child: Text("회원가입", style: TextStyle(fontSize: 21)),
                    onPressed: () {
                      // 회원가입
                      authService.signUp(
                        email: numberController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          // 회원가입 성공
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("회원가입 성공"),
                          ));
                        },
                        onError: (err) {
                          // 에러 발생
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
        },
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
