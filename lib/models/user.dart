import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int id;

  @HiveField(2)
  late double age;

  @HiveField(3)
  late String degree;

  // User({
  //   required this.name,
  //   required this.id,
  //   required this.age,
  //   required this.degree,
  // });
}
