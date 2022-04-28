import 'package:cchabbe/config/colors.dart';
import 'package:flutter/material.dart';

class CchabbeThirdPage extends StatelessWidget {
  const CchabbeThirdPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MY',
          style: TextStyle(
            fontSize: 18,
            color: CchabbeColor.bluegrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: CchabbeColor.black,
      ),
    );
  }
}
