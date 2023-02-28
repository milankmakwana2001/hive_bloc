import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive_bloc/core/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/image/image.dart';


class ImageLocalDBRepo{
  late Box<ImageModel> _image;

  Future<void> init () async {
    Hive.registerAdapter(ImageAdapter());
    _image = await Hive.openBox<ImageModel>(AppStrings.imageBox);
  }

  Future<void> storeImage(ImageModel image)async{
    await _image.add(image).then((value){
      debugPrint('Image added to local db');
    });
  }

  Future<List<ImageModel>> getImages()async{
    List<ImageModel> myList = await _image.values.cast<ImageModel>().toList();
    return myList;
  }


}