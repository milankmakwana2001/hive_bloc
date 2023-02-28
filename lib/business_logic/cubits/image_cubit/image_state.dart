part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();
}

class ImageInitial extends ImageState {
  @override
  List<Object> get props => [];
}


class Loading extends ImageState {
  @override
  List<Object> get props => [];
}

class Success extends ImageState {
  @override
  List<Object> get props => [];
}

class Error extends ImageState {
  @override
  List<Object> get props => [];
}

class GetImages extends ImageState {
  List<dynamic> myList;
  GetImages(this.myList);
  @override
  List<Object> get props => [myList];
}