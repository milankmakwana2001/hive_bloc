
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'image.g.dart';
@HiveType(typeId: 1)
class ImageModel extends HiveObject{

  @HiveField(0)
  late Uint8List image;

  // @HiveField(1)
  // late String name;

}