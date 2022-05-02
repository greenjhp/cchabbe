import 'package:cchabbe/auth_service.dart';
import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Cchabbe_forth_page.dart';
import 'package:cchabbe/users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProfileEditPage extends StatelessWidget {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController car_numberController = TextEditingController();

  Widget _profileNickname() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(54, 31, 54, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 62,
            child: Text(
              '닉네임',
              style: TextStyle(
                color: CchabbeColor.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 34,
          ),
          Expanded(
            child: TextField(
              controller: nicknameController,
              decoration: InputDecoration(
                hintText: '힘쎈 곽두철',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: CchabbeColor.white.withOpacity(0.6),
                ),
              ),
              style: TextStyle(
                color: CchabbeColor.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileCarnumber() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(54, 19, 54, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 80,
            child: Text(
              '차량번호',
              style: TextStyle(
                color: CchabbeColor.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              controller: car_numberController,
              decoration: InputDecoration(
                hintText: '차량 번호를 입력해주세요',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: CchabbeColor.white.withOpacity(0.6),
                ),
              ),
              style: TextStyle(
                color: CchabbeColor.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersService>(builder: (context, usersService, child) {
      final authService = context.read<AuthService>();
      User user = authService.currentUser()!;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: CchabbeColor.black,
          centerTitle: true,
          title: Text(
            '차고',
            style: TextStyle(
              fontSize: 18,
              color: CchabbeColor.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nicknameController.text.isNotEmpty) {
                  usersService.create(nicknameController.text,
                      car_numberController.text, user.uid);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CchabbeForthPage(),
                  ),
                );
              },
              child: Text(
                '완료',
                style: TextStyle(color: CchabbeColor.white),
              ),
            )
          ],
        ),
        body: Container(
          color: CchabbeColor.black,
          child: Column(
            children: [
              //_profileImage(context), 이미지는 MVP에서 빼는게 좋을 것 같아요..ㅠ
              _profileNickname(),
              _profileCarnumber(),
            ],
          ),
        ),
      );
    });
  }
}
