import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whispr/Model/UserModel.dart';

class Dbcontroller extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> usersList = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  void onInit() async {
    super.onInit();
    await getUserList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      await db
          .collection("users")
          .get()
          .then(
            (value) => {
              usersList.value =
                  value.docs.map((e) => UserModel.fromJson(e.data())).toList(),
            },
          );
    } catch (e) {
      // TODO
      print(e);
    }
    isLoading.value = false;
  }
}
