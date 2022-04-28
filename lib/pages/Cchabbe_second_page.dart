import 'package:cchabbe/config/colors.dart';
import 'package:flutter/material.dart';

class CchabbeSecondPage extends StatelessWidget {
  const CchabbeSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CchabbeColor.black,
        centerTitle: true,
        title: Text(
          '채팅',
          style: TextStyle(
            fontSize: 18,
            color: CchabbeColor.bluegrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              //채팅은 기능을 넣을 것이니, 표현만 해보았음
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      tileColor: CchabbeColor.grey1,
                      selectedTileColor: CchabbeColor.grey2,
                      title: Container(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "마음 급한 마동석",
                          style: TextStyle(
                            color: CchabbeColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "차주님 가능한 빨리 와주세요. 급해요.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Container(
                        child: Text('1'),
                      ),
                    ),
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      tileColor: CchabbeColor.grey1,
                      selectedTileColor: CchabbeColor.grey2,
                      title: Container(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "광진구 검은 마수찬",
                          style: TextStyle(
                            color: CchabbeColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "10분 드리겠습니다.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Container(
                        child: Text('2'),
                      ),
                    ),
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      tileColor: CchabbeColor.grey1,
                      selectedTileColor: CchabbeColor.grey2,
                      title: Container(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "신림동 어깨 조덕철",
                          style: TextStyle(
                            color: CchabbeColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "최대한 빨리 갈게요. 조금만 기다려주세요.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Container(
                        child: Text(''),
                      ),
                    ),
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      tileColor: CchabbeColor.grey1,
                      selectedTileColor: CchabbeColor.grey2,
                      title: Container(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "을지로 붉은 두만식",
                          style: TextStyle(
                            color: CchabbeColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "어디쯤 오셨나요?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Container(
                        child: Text(''),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
