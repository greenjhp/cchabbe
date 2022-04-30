// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'group_channel_view.dart';
// import 'package:sendbird_sdk/sendbird_sdk.dart';
// import 'package:cchabbe/sendbird_info.dart';

// class DirectToChannel extends StatefulWidget {
//   const DirectToChannel({Key? key}) : super(key: key);

//   @override
//   DirectToChannelState createState() => DirectToChannelState();
// }

// class DirectToChannelState extends State<DirectToChannel> {
//   // Get Sendbird App Id
//   final _appIdController =
//       TextEditingController(text: SendbirdInfo.sendbird_app_id);

//   // // Random Generate Sendbird UserId
//   // static String _chars =
//   //     'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//   // static Random _rnd = Random();

//   // static String getRandomString() => String.fromCharCodes(Iterable.generate(
//   //     10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

//   // static get tempUserId => 'tempUser_' + getRandomString();

//   final _userIdController = TextEditingController(text: 'requester');

//   // // Generate Sendbird Sendbird Nickname
//   // String currentNickname = generateRancomNickname();
//   final _nicknameController = TextEditingController(text: 'requester_name');

//   //
//   bool _enableSignInButton = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: body(context),
//     );
//   }

//   Widget body(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.only(left: 20, right: 20, top: 100),
//         child: Column(
//           children: [
//             Text(
//               """차주에게 쎄 보일\n닉네임을 정해보세요""",
//               style: TextStyle(fontSize: 20.0),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   currentNickname = generateRancomNickname();
//                 });
//               },
//               icon: Icon(Icons.refresh),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextField(
//               controller: _nicknameController..text = currentNickname,
//               style: TextStyle(fontSize: 20.0),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             FractionallySizedBox(
//               widthFactor: 1,
//               child: _signInButton(context, _enableSignInButton),
//             )
//           ],
//         ));
//   }

//   bool _shouldEnableSignInButton() {
//     // if (_appIdController.text.isEmpty) {
//     //   return false;
//     // }
//     // if (_userIdController.text.isEmpty) {
//     //   return false;
//     // }
//     return true;
//   }

//   Widget _signInButton(BuildContext context, bool enabled) {
//     enabled = _shouldEnableSignInButton();
//     if (enabled == false) {
//       // Disable the sign in button if required data not entered
//       return TextButton(
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
//             foregroundColor:
//                 MaterialStateProperty.all<Color>(Colors.grey[300]!)),
//         onPressed: () {},
//         child: Text(
//           "Sign In",
//           style: TextStyle(fontSize: 20.0),
//         ),
//       );
//     }
//     return TextButton(
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Color(0xff742DDD)),
//           foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
//       onPressed: () {
//         // Login with Sendbird
//         connect(
//           _appIdController.text,
//           _userIdController.text,
//           _nicknameController.text,
//         ).then((user) {
//           createChannel(['glen']).then((channel) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => GroupChannelView(groupChannel: channel),
//               ),
//             );
//           }).catchError((error) {
//             debugPrint(
//                 'create_channel_view: navigationBar: createChannel: ERROR: $error');
//           });
//           // Navigator.pushNamed(context, '/create_channel');
//         }).catchError((error) {
//           debugPrint('login_view: _signInButton: ERROR: $error');
//         });
//       },
//       child: Text(
//         "차주와 채팅 시작",
//         style: TextStyle(fontSize: 20.0),
//       ),
//     );
//   }

//   Future<User> connect(String appId, String userId, String nickname) async {
//     // Init Sendbird SDK and connect with current user id
//     try {
//       final sendbird = SendbirdSdk(appId: appId);
//       final user = await sendbird.connect(userId, nickname: nickname);
//       return user;
//     } catch (e) {
//       debugPrint('login_view: connect: ERROR: $e');
//       throw e;
//     }
//   }
// }

// Future<GroupChannel> createChannel(List<String> userIds) async {
//   try {
//     final params = GroupChannelParams()..userIds = userIds;
//     final channel = await GroupChannel.createChannel(params);
//     return channel;
//   } catch (e) {
//     debugPrint('createChannel: ERROR: $e');
//     throw e;
//   }
// }

// String generateRancomNickname() {
//   // Generate Sendbird Sendbird Nickname
//   List _namePart1 = [
//     '마음급한',
//     '힘쎈',
//     '태권도19단',
//     '험상궂은',
//     '치명적인',
//     '헤비급',
//     '주짓수블랙벨트',
//     '원펀맨',
//     '캡틴',
//     '사커킥'
//   ];
//   List _namePart2 = [
//     '마동석',
//     '곽두팔',
//     '마봉팔',
//     '오태식',
//     '모팔모',
//     '강철날개',
//     '어금니',
//     '송곳니',
//     '금니빨',
//     '만두귀'
//   ];

//   Random _rnd1 = Random();
//   Random _rnd2 = Random();

//   // generate a random index based on the list length
//   // and use it to retrieve the element
//   String rndNickName = _namePart1[_rnd1.nextInt(_namePart1.length)] +
//       ' ' +
//       _namePart2[_rnd2.nextInt(_namePart2.length)];

//   return rndNickName;
// }
