import 'dart:convert';
import 'dart:developer';

import 'package:api_sample/models/user_model.dart';
import 'package:api_sample/services/user_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(const UserState()) {
    on<GetUsersEvent>(_onGetUsersEvent);
  }

  Future<void> _onGetUsersEvent(
    GetUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      
      final UserServices userServices = UserServices();
      emit(
        state.copyWith(
          status: UserStatus.loading,
          userList: [],
        ),
      );
      final response = await userServices.getProperties();
      log(jsonEncode(response.data.toString()));

      emit(
        state.copyWith(
          status: UserStatus.loaded,
          userList: response.data,
        ),
      );
      return;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      emit(
        state.copyWith(
          status: UserStatus.failed,
          userList: [],
        ),
      );
    }
  }
}
