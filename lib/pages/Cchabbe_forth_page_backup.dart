import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Cchabbe_profile_page.dart';
import 'package:flutter/material.dart';

class CchabbeForthPage extends StatelessWidget {
  const CchabbeForthPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Stack(
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
                      right: 150,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 32,
                            color: CchabbeColor.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CchabbeProfilePage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(54, 37, 54, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 62,
                    child: Text('닉네임'),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffDDEAF3),
                        hintText: '힘쎈 곽두철',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(54, 19, 54, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 62,
                    child: Text('차량번호'), //닉네임하고 줄 맞추기 필요
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffDDEAF3),
                        hintText: '456가 7890',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
