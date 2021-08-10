class Data {
  final int LoginId;
  final int Password;

  Data({required this.LoginId, required this.Password});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      LoginId: json['LoginId'],
      Password: json['Password'],
    );
  }
}
