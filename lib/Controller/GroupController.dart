import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Model/GropupModel.dart';
import 'package:whispr/Model/UserModel.dart';
import 'package:whispr/Pages/HomePage/HomePage.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var uuid = Uuid();
  RxBool isloading = false.obs;
  Profilecontroller profilecontroller = Get.put(Profilecontroller());
  void selectMember(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    isloading.value = true;
    String groupId = uuid.v6();

    try {
      String imageUrl = await profilecontroller.uploadFileToFirebase(imagePath);

      await db.collection("groups").doc(groupId).set({
        "id": groupId,
        "name": groupName,
        "profileUrl": imageUrl,
        "members": groupMembers.map((e) => e.toJson()).toList(),
        "createdAt": DateTime.now().toString(),
        "createdBy": auth.currentUser!.uid,
        "timeStamp": DateTime.now().toString(),
      });

      //Group Created Tost
      Get.snackbar("Group Created", "Group Created Successfully");
      Get.offAll(HomePage());
      isloading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
