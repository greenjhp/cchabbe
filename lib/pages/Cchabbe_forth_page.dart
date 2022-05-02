import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Profile_edit_page.dart';
import 'package:cchabbe/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../auth_service.dart';

class CchabbeForthPage extends StatelessWidget {
  const CchabbeForthPage({Key? key}) : super(key: key);

  Widget _profileImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        width: 140,
        height: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=170667a&w=0&h=YGycIDbBRAWkZaSvdyUFvotdGfnKhkutJhMOZtIoUKY=",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _profileNickname() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(54, 37, 54, 0),
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
            child: Text(
              '힘쎈 곽두철',
              style: TextStyle(
                color: CchabbeColor.white.withOpacity(0.6),
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
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
            width: 16,
          ),
          Expanded(
            child: Text(
              '123가 4567',
              style: TextStyle(
                color: CchabbeColor.white.withOpacity(0.6),
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataService>(builder: (context, usersService, child) {
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
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEditPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.edit,
                color: CchabbeColor.white,
              ),
            ),
            // TextButton(
            //   child: Text(
            //     "프로필",
            //     style: TextStyle(color: CchabbeColor.white),
            //   ),
            //   onPressed: () {},
            // )
          ],
        ),
        body: Container(
          color: CchabbeColor.black,
          child: Column(
            children: [
              //_profileImage(context), 이미지는 MVP에서 빼는게 좋을 것 같아요..ㅠ
              _profileNickname(),
              SizedBox(
                height: 10,
              ),
              _profileCarnumber(),
              Container(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 40.0),
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => ProfileEditPage(),
              //         ),
              //       );
              //     },
              //     child: Column(
              //       children: [
              //         Icon(
              //           Icons.edit,
              //           color: CchabbeColor.bluegrey,
              //         ),
              //         Text(
              //           '프로필 편집',
              //           style: TextStyle(
              //             color: CchabbeColor.bluegrey,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
