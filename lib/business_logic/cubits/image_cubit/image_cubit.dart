import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_bloc/models/image/image.dart';
import 'package:image_picker/image_picker.dart';

import '../../repository/image_local_db_repo.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageLocalDBRepo imageLocalDBRepo;

  ImageCubit({required this.imageLocalDBRepo}) : super(ImageInitial());

  Future<void> DBInit( ) async {
    await imageLocalDBRepo.init();
  }

  Future<void> imagePicker() async {
    try{
      emit(Loading());
      ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      Uint8List imageBytes = await image.readAsBytes();
      print(imageBytes.toString());
       imageLocalDBRepo.storeImage(ImageModel()..image=imageBytes);
      emit(Success());
    }catch(e){
      debugPrint('${e.toString()} in image Picker in imagecubit');
      emit(Error());
    }

  }

  Future<void> getLocalImages()async{
    try{
      emit(Loading());
      List<ImageModel> myList = await imageLocalDBRepo.getImages();

      emit(GetImages(myList));

    }catch(e){
      debugPrint('Error in getLocalImages in imagecubit');
      emit(Error());
    }

  }
}
