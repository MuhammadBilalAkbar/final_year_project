class UserModel {
  final String userId;
  final String fcmToken;
  final String address;
  final String description;
  final String title;
  final bool status ;

  UserModel({
    required this.userId,
    required this.fcmToken,
    required this.address,
    required this.description,
    required this.title,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'fcmToken': fcmToken,
        'address': address,
        'description': description,
        'title': title,
       // 'status': status,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      fcmToken: json['fcmToken'],
      address: json['address'],
      description: json['description'],
      title: json['title'],
      status: json['status'],
    );
  }
}
