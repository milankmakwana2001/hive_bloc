part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class DBInitEvent extends UserEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddUserEvent extends UserEvent{
  final User user;
  AddUserEvent({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];

}


