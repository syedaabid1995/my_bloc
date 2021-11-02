import 'package:hive/hive.dart';

import 'data.dart';

part 'login_response.g.dart';

@HiveType(typeId: 1)
class LoginRegisterResponse {
  @HiveField(0)
  bool? success;

  @HiveField(1)
  List<Data>? data;

  @HiveField(2)
  bool? isSettingsDone;

  @HiveField(3)
  String? message;

  @HiveField(4)
  bool? shouldRememberUser=false;


  LoginRegisterResponse({this.success, this.data, this.isSettingsDone});

  LoginRegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    isSettingsDone = json['isSettingsDone'];
    message = json['message'];
  }
  LoginRegisterResponse.withError(String error) {
    message = error;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isSettingsDone'] = this.isSettingsDone;
    return data;
  }
}

