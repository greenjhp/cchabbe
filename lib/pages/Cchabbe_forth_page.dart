import 'package:cchabbe/config/colors.dart';

import 'package:cchabbe/src/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CchabbeForthPage extends GetView<ProfileController> {
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

  Widget _profileEdit() {
    return Obx(
      () => controller.isEditMyProfile.value
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: TextButton(
                onPressed: () {
                  controller.toggleEditProfile;
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.edit,
                      color: CchabbeColor.bluegrey,
                    ),
                    Text(
                      '프로필 편집',
                      style: TextStyle(
                        color: CchabbeColor.bluegrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
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
            _profileEdit(),
          ],
        ),
      ),
    );
  }
}
