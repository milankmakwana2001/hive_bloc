import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_bloc/business_logic/repository/user_local_db_repo.dart';
import 'package:hive_bloc/models/user/user.dart';

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

    on<AddUserEvent>((event, emit) async {
      try {
        emit(Loading());
        await userLocalDBRepo.createUser(event.user);
        emit(Success());
      } catch (e) {
        debugPrint(
          '${e.toString()} from AddUserEvent',
        );
        emit(Error());
      }
    });

    on<GetUsers>((event, emit) async {
      try {
        emit(Loading());
        dynamic list = await userLocalDBRepo.getUser();
        emit(
          GetSuccess(
            list,
          ),
        );
      } catch (e) {
        debugPrint(
          '${e.toString()} from GetUserEvent',
        );
        emit(Error());
      }
    });
  }
}
