class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;
  String? role;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phoneNumber,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status,
    this.role,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    about = json['About'];
    createdAt = json['CreatedAt'];
    lastOnlineStatus = json['LastOnlineStatus'];
    status = json['Status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['phoneNumber'] = this.phoneNumber;
    data['About'] = this.about;
    data['CreatedAt'] = this.createdAt;
    data['LastOnlineStatus'] = this.lastOnlineStatus;
    data['Status'] = this.status;
    data['role'] = this.role;
    return data;
  }
}
