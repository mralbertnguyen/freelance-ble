class SignInInfoType {
  String phoneNumber;
  String lastOTP;
  String verificationID;
  String uuid;

  SignInInfoType.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    lastOTP = json['last_otp'];
    verificationID = json['verification_id'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "last_otp": lastOTP,
        "verification_id": verificationID,
        "uuid": uuid,
      };
}