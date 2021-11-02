import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 2)
class Data {
  @HiveField(0)
  String? userid;

  @HiveField(1)
  String? roleid;

  @HiveField(2)
  String? firstname;

  @HiveField(3)
  String? lastname;

  @HiveField(4)
  String? emailid;

  @HiveField(5)
  String? phone;

  @HiveField(6)
  String? username;

  @HiveField(7)
  String? expirydate;

  @HiveField(8)
  String? isEcomUser;

  Data(
      {this.userid,
        this.roleid,
        this.firstname,
        this.lastname,
        this.emailid,
        this.phone,
        this.username,
        this.expirydate,
        this.isEcomUser});

  Data.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    roleid = json['roleid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    emailid = json['emailid'];
    phone = json['Phone'];
    username = json['username'];
    expirydate = json['expirydate'];
    isEcomUser = json['isEcomUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['roleid'] = this.roleid;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['emailid'] = this.emailid;
    data['Phone'] = this.phone;
    data['username'] = this.username;
    data['expirydate'] = this.expirydate;
    data['isEcomUser'] = this.isEcomUser;
    return data;
  }
}
