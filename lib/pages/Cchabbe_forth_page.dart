import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Cchabbe_profile_page.dart';
import 'package:flutter/material.dart';

class CchabbeForthPage extends StatelessWidget {
  const CchabbeForthPage({Key? key}) : super(key: key);

  Widget _profileImage(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CchabbeColor.ovals,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 108,
                    height: 108,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.photo,
                    size: 108,
                    color: CchabbeColor.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 140,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: CchabbeColor.black,
                      border: Border.all(
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      child: Text(
                        '편집',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: CchabbeColor.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CchabbeProfilePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
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
                color: CchabbeColor.black,
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
                color: CchabbeColor.bluegrey,
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
                color: CchabbeColor.black,
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
              '456가 7890',
              style: TextStyle(
                color: CchabbeColor.bluegrey,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CchabbeColor.black,
        centerTitle: true,
        title: Text(
          '차고',
          style: TextStyle(
            fontSize: 18,
            color: CchabbeColor.bluegrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            _profileImage(context),
            _profileNickname(),
            _profileCarnumber(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CchabbeProfilePage()),
                );
              },
              child: Text('프로필 수정하기'),
            )
          ],
        ),
      ),
    );
  }
}
