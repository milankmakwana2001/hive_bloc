import 'package:hive/hive.dart';
import 'package:hive_bloc/core/app_strings.dart';
import 'package:hive_bloc/models/user.dart';

class UserLocalDBRepo {
  late Box<User> _user;

//This fun is for initialize box.
  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _user = await Hive.openBox<User>(AppStrings.userBox);
  }
}
