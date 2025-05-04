import 'package:whispr/Model/ChatModel.dart';
import 'package:whispr/Model/UserModel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? message;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimeStamp;
  String? timestamp;

  ChatRoomModel({
    this.id,
    this.sender,
    this.receiver,
    this.message,
    this.unReadMessNo,
    this.lastMessage,
    this.lastMessageTimeStamp,
    this.timestamp,
  });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["sender"] is Map) {
      sender = json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if (json["receiver"] is Map) {
      receiver =
          json["receiver"] == null ? null : UserModel.fromJson(json["receiver"]);
    }
    if (json["message"] is List) {
      message = json["message"] ?? [];
    }
    if (json["unReadMessNo"] is int) {
      unReadMessNo = json["unReadMessNo"];
    }
    if (json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if (json["lastMessageTimeStamp"] is String) {
      lastMessageTimeStamp = json["lastMessageTimeStamp"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (sender != null) {
      _data["sender"] = sender?.toJson();
    }
    if (receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    if (message != null) {
      _data["message"] = message;
    }
    _data["unReadMessNo"] = unReadMessNo;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTimeStamp"] = lastMessageTimeStamp;
    _data["timestamp"] = timestamp;
    return _data;
  }
}


