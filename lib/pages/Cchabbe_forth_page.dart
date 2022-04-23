import 'package:cchabbe/config/colors.dart';
import 'package:flutter/material.dart';

class CchabbeForthPage extends StatelessWidget {
  const CchabbeForthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CchabbeColor.blue,
        centerTitle: true,
        title: Text(
          'MY',
          style: TextStyle(
            fontSize: 18,
            color: CchabbeColor.bluegrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: '닉네임',
              hintText: '힘쎈 곽두철',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
