import 'package:belajar/model/user.dart';

class User_Builder {
  List<user> userData = [
    user(
      username: 'danu',
      Password: '12345',
      name: 'Danu wardana',
    ),
    user(
      username: 'Silky',
      Password: '12345',
      name: 'Silky',
    )
  ];

  bool cekLogin(String? user, String? pass) {
    return this
        .userData
        .where(
            (element) => element.username == user && element.Password == pass)
        .isNotEmpty;
  }

  String getName(List<user> userList, String? userselect) {
    final userSelected =
        userList.firstWhere((user) => user.username == userselect);
    return userSelected.name;
  }
}
