import 'dart:io';
import 'dart:ui';

import 'package:cchabbe/config/colors.dart';
import 'package:cchabbe/pages/Cchabbe_forth_page.dart';
import 'package:cchabbe/pages/Cchabbe_second_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_service.dart';
import '../data_service.dart';
import '../main.dart';

import 'group_channel_view.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:cchabbe/sendbird_info.dart';

class CchabbeFirstPage extends StatefulWidget {
  const CchabbeFirstPage({key}) : super(key: key);

  @override
  State<CchabbeFirstPage> createState() => _CchabbeFirstPageState();
}

class _CchabbeFirstPageState extends State<CchabbeFirstPage> {
// 홈화면
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthService, DataService>(
        builder: (context, authService, dataService, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: CchabbeColor.black,
          ),
        ),
        body: Container(
          color: CchabbeColor.white,
          child: ListView(
            children: [
              Container(
                color: CchabbeColor.black,
                height: 188,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //사용자 닉네임 받아오기
                          FutureBuilder<QuerySnapshot>(
                              future: dataService.readMyUsersInfo(
                                  authService.currentUser()!.uid),
                              builder: (context, snapshot) {
                                final documents = snapshot.data?.docs ?? [];
                                if (documents.isEmpty) {
                                  return Text('닉네임을 설정해주세요');
                                }
                                final doc = documents[0];
                                String nickname = doc.get('nickname');
                                return Text(
                                  nickname,
                                  style: TextStyle(
                                    color: CchabbeColor.bluegrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                          SizedBox(height: 16),
                          //차량버튼 입력 후에는 입력한 차량번호로 보여주기
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CchabbeForthPage(),
                                ),
                              );
                            }, //클릭하면 마이페이지로 보내기
                            child: Text(
                              'car number \n차량 번호를 입력해주세요.',
                              style: TextStyle(color: CchabbeColor.bluegrey),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CchabbeColor.white,
                          //유저 프로필 설정?? QR코드 입력?
                        ),
                        height: 78,
                        width: 78,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: CchabbeColor.ovals,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 12.0, left: 24.0, bottom: 4.0),
                            child: Text(
                              "알림",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Spacer(),
                          //메시지 도착한 시간 표기.. 어떻게 하지!
                          Container(
                            padding: EdgeInsets.only(top: 6.0, right: 16.0),
                            child: Text(
                              '오후 6:54',
                              style: TextStyle(
                                color: CchabbeColor.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //누군가에게 채팅이 오면, 그 사람의 닉네임을 넣어서, 알림 받아오기
                      ListTile(
                        leading: Icon(Icons.notification_important, size: 35),
                        title: Container(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "차 빼주세요 두철님!",
                            style: TextStyle(
                              color: CchabbeColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "마음 급한 마동석 님이 미쳐 날뛰고 있습니다!",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          ),
                          onPressed: () async {
                            var u = (await dataService.readMyUsersInfo(
                                    authService.currentUser()!.uid))
                                .docs[0]
                                .get('nickname');

                            // Login with Sendbird
                            connect(
                              SendbirdInfo.sendbird_app_id,
                              authService.currentUser()!.uid,
                              u,
                            ).then((user) {
                              createChannel(['requester']).then((channel) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GroupChannelView(groupChannel: channel),
                                  ),
                                );
                              }).catchError((error) {
                                debugPrint(
                                    'create_channel_view: navigationBar: createChannel: ERROR: $error');
                              });
                              // Navigator.pushNamed(context, '/create_channel');
                            }).catchError((error) {
                              debugPrint(
                                  'login_view: _signInButton: ERROR: $error');
                            });
                          },
                          // onPressed: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => DirectToChannel(),
                          //     ),
                          //   );
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffDDEAF3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 12.0, left: 24.0, bottom: 4.0),
                            child: Text(
                              "출차시간",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.car_rental,
                          size: 35,
                        ),
                        title: Container(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "출차시간을 설정해주세요.",
                            style: TextStyle(
                              color: CchabbeColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "설정해두면 귀찮은 연락이 안올지도 몰라요!",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CchabbeForthPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      TextButton(
                          child: Text("로그아웃"),
                          onPressed: () {
                            context.read<AuthService>().signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ], //children
          ),
        ),
      );
    });
  }

  Future<User> connect(String appId, String userId, String nickname) async {
    // Init Sendbird SDK and connect with current user id
    try {
      final sendbird = SendbirdSdk(appId: appId);
      final user = await sendbird.connect(userId, nickname: nickname);
      return user;
    } catch (e) {
      debugPrint('login_view: connect: ERROR: $e');
      throw e;
    }
  }

  Future<GroupChannel> createChannel(List<String> userIds) async {
    try {
      final params = GroupChannelParams()..userIds = userIds;
      final channel = await GroupChannel.createChannel(params);
      return channel;
    } catch (e) {
      debugPrint('createChannel: ERROR: $e');
      throw e;
    }
  }
}
