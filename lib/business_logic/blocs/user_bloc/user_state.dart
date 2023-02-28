part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class Loading extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Success extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetSuccess extends UserState{
  dynamic userList;
  GetSuccess(this.userList);
  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}


class Error extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
