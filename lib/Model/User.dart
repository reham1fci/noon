class User {
  String? userId  ;
  String?userName  ;
  String? orgId  ;
  String? userPassword  ;



  User({this.userId, this.userName, this.orgId, this.userPassword,});
  factory User.fromJson (Map<String  ,dynamic> json , String userID , String password ,  String orgID){
    return
      User(userName:json['User_Name'] ,
      orgId:orgID ,
      userPassword: password  ,
      userId:   userID,
    );
  }
  factory User.fromJsonShared (Map<String  ,dynamic> json ){
    return User(
        userName:json['userName'] ,
        orgId:json['orgId'] ,
        userPassword: json['userPassword']  ,
        userId:   json['userId'],


    );
  }
  Map<String, dynamic> toJson( ) {
    return {
      "userId": userId,
      "userName":userName ,
      "orgId": orgId ,
      "userPassword":userPassword ,

    };
  }

  User.login( this.userId, this.userPassword , this.orgId);
  Map toMap() {
    var map = <String, dynamic>{};
    map["Org_id"]  = orgId ;
    map["user_id"] = userId ;
    map["password"]  = userPassword;
    return map;
  }

  @override
  String toString() {
    return 'User{userId: $userId, userName: $userName, orgId: $orgId, userPassword: $userPassword,' ;
  }


}