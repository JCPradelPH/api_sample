part of 'user_bloc.dart';

enum UserStatus {
  loading,
  loaded,
  success,
  failed,
}

final class UserState extends Equatable {
  final UserStatus status;
  final List<UserModel>? userList;

  const UserState({
    this.status = UserStatus.loading,
    this.userList = const [],
  });

  UserState copyWith({
    UserStatus? status,
    List<UserModel>? userList,
  }) {
    return UserState(
      status: status ?? this.status,
      userList: userList ?? this.userList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        userList,
      ];
}
