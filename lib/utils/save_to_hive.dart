import 'package:hive/hive.dart';
class HiveKeys {
  HiveKeys._();

  static const String userBox = 'myBox';
  static const String userDetails = 'userDetails';

}
class HiveData{
  final Box _userBox;

  HiveData(this._userBox);

  void setUserDetails(state){
    _userBox.put(HiveKeys.userDetails, state.user);
  }
  //TODO: make this OBJECT to particular class for saving data
  Object get  getUserDetails => _userBox.get(HiveKeys.userDetails);


}