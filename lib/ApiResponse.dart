class ApiResponse {
    ApiResponse({
        required this.status,
        required this.message,
        required this.userData,
    });

    String status;
    String message;
    UserData userData;

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["Status"],
        message: json["Message"],
        userData: UserData.fromJson(json["UserData"]),
    );


}

class UserData {
    UserData({
        required this.name,
        required this.encUserId,
    });

    String name;
    String encUserId;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["Name"],
        encUserId: json["EncUserId"],
    );

}