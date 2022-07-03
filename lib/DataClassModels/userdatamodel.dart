import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.socialmediads,
    required this.imagePath,
    required this.token,
  });

  int statusCode;
  String message;
  List<Datum> data;
  List<Socialmediad> socialmediads;
  String imagePath;
  String token;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    statusCode: json["statusCode"],
    message: json["Message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    socialmediads: List<Socialmediad>.from(json["socialmediads"].map((x) => Socialmediad.fromJson(x))),
    imagePath: json["imagePath"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "Message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "socialmediads": List<dynamic>.from(socialmediads.map((x) => x.toJson())),
    "imagePath": imagePath,
    "token": token,
  };
}

class Datum {
  Datum({
    required this.customerId,
    required this.email,
    required this.contactNo,
    required this.firstName,
    required this.lastName,
    required this.imagePath,
    required this.loyaltyProfileId,
    required this.totalPointsEarned,
    required this.totalPointsRedeemed,
    required this.totalPointsAvailable,
    required this.totalPointsExpiring,
    required this.dob,
    required this.userType,
    required this.city,
  });

  int customerId;
  String email;
  String contactNo;
  String firstName;
  String lastName;
  String imagePath;
  String loyaltyProfileId;
  double totalPointsEarned;
  double totalPointsRedeemed;
  double totalPointsAvailable;
  double totalPointsExpiring;
  DateTime dob;
  String userType;
  String city;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    customerId: json["customer_id"],
    email: json["email"],
    contactNo: json["contact_no"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    imagePath: json["image_path"],
    loyaltyProfileId: json["loyalty_profileID"],
    totalPointsEarned: json["total_points_earned"],
    totalPointsRedeemed: json["total_points_redeemed"],
    totalPointsAvailable: json["total_points_available"],
    totalPointsExpiring: json["total_points_expiring"],
    dob: DateTime.parse(json["dob"]),
    userType: json["UserType"],
    city: json["City"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "email": email,
    "contact_no": contactNo,
    "first_name": firstName,
    "last_name": lastName,
    "image_path": imagePath,
    "loyalty_profileID": loyaltyProfileId,
    "total_points_earned": totalPointsEarned,
    "total_points_redeemed": totalPointsRedeemed,
    "total_points_available": totalPointsAvailable,
    "total_points_expiring": totalPointsExpiring,
    "dob": dob.toIso8601String(),
    "UserType": userType,
    "City": city,
  };
}

class Socialmediad {
  Socialmediad({
    required this.socialmediaID,
    required this.mediatype,
    required this.medialink,
  });

  int socialmediaID;
  String mediatype;
  String medialink;

  factory Socialmediad.fromJson(Map<String, dynamic> json) => Socialmediad(
    socialmediaID: json["socialmedia_iD"],
    mediatype: json["mediatype"],
    medialink: json["medialink"],
  );

  Map<String, dynamic> toJson() => {
    "socialmedia_iD": socialmediaID,
    "mediatype": mediatype,
    "medialink": medialink,
  };
}