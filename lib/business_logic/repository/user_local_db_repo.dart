import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:hive_bloc/core/app_strings.dart';
import 'package:hive_bloc/models/user/user.dart';

class UserLocalDBRepo {
  late Box<User> _user;

//This fun is for initialize box.
  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _user = await Hive.openBox<User>(AppStrings.userBox);
  }


  //This fun will add user to local db.
  //Write Operation
  Future createUser(User user)async{
     await _user.add(user).then((value) {
       log('User added');
     });
  }


  //This fun will get list of users from local db.
  //Read Operation
  Future<dynamic> getUser()async{
   final users = await _user.values.toList();
   log('from repo : ${users}');
   return users;
  }
}
