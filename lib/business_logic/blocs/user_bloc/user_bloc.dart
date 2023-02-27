import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_bloc/business_logic/repository/user_local_db_repo.dart';
import 'package:hive_bloc/models/user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserLocalDBRepo userLocalDBRepo;

  UserBloc({required this.userLocalDBRepo}) : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DBInitEvent>((event, emit) async {
      await userLocalDBRepo.init();
      emit(UserInitial());
    });
  }
}
