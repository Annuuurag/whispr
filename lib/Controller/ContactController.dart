import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:whispr/Model/ChatRoomModel.dart';
import 'package:whispr/Model/UserModel.dart';

class Contactcontroller extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  void onInit() async {
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db
          .collection("users")
          .get()
          .then(
            (value) => {
              userList.value =
                  value.docs.map((e) => UserModel.fromJson(e.data())).toList(),
            },
          );
    } catch (e) {
      // TODO
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> tempChatRoom = [];
    await db
        .collection('chats')
        .orderBy("timestamp", descending: true)
        .get()
        .then((value) {
          tempChatRoom =
              value.docs.map((e) => ChatRoomModel.fromJson(e.data())).toList();
        });
    chatRoomList.value =
        tempChatRoom
            .where((e) => e.id!.contains(auth.currentUser!.uid))
            .toList();
  }

  Future<void> saveContact(UserModel user) async {
    try{
      await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("contacts")
        .doc(user.id)
        .set(user.toJson());
    }catch (e) {
      if(kDebugMode){
        print("Error while saving contact $e");
      }
    }
  }

  Stream<List<UserModel>> getContacts() {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("contacts")
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => UserModel.fromJson(doc.data()))
                  .toList(),
        );
  }
}
