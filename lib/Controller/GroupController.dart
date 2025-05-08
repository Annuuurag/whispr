import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:whispr/Config/CustomMessage.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Model/ChatModel.dart';
import 'package:whispr/Model/GropupModel.dart';
import 'package:whispr/Model/UserModel.dart';
import 'package:whispr/Pages/HomePage/HomePage.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var uuid = Uuid();
  RxBool isloading = false.obs;
  RxString selectedImagePath = "".obs;

  RxList<GroupModel> groupList = <GroupModel>[].obs;
  Profilecontroller profilecontroller = Get.put(Profilecontroller());

  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

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

    groupMembers.add(
      UserModel(
        id: auth.currentUser!.uid,
        name: profilecontroller.currentUser.value.name,
        profileImage: profilecontroller.currentUser.value.profileImage,
        email: profilecontroller.currentUser.value.email,
        role: "admin",
      ),
    );
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

      getGroups();
      successMessage("Group Created");
      //Group Created Tost
      //Get.snackbar("Group Created", "Group Created Successfully");
      Get.offAll(HomePage());
      isloading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGroups() async {
    isloading.value = true;
    List<GroupModel> tempGroup = [];
    await db.collection('groups').get().then((value) {
      tempGroup = value.docs.map((e) => GroupModel.fromJson(e.data())).toList();
    });

    groupList.clear();
    groupList.value =
        tempGroup
            .where(
              (e) => e.members!.any(
                (element) => element.id == auth.currentUser!.uid,
              ),
            )
            .toList();
    isloading.value = false;
  }

  Future<void> sendGroupMessage(
    String message,
    String groupId,
    String imagePath,
  ) async {
    isloading.value = true;
    var chatId = uuid.v6();

    String imageUrl = await profilecontroller.uploadFileToFirebase(
      selectedImagePath.value,
    );
    var newChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl,
      senderId: auth.currentUser!.uid,
      senderName: profilecontroller.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    await db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .doc(chatId)
        .set(newChat.toJson());

    selectedImagePath.value = "";
    isloading.value = false;
  }

  Stream<List<ChatModel>> getGroupMessages(String groupId) {
    return db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => ChatModel.fromJson(doc.data()))
                  .toList(),
        );
  }

  Future<void> addMemberToGroup(String groupId, UserModel user) async {
    isloading.value = true;
    await db.collection("groups").doc(groupId).update({
      "members": FieldValue.arrayUnion([user.toJson()]),
    });
    getGroups();
    isloading.value = false;
  }
}
