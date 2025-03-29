import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'password')
  final String? password;

  const UserModel({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,
    this.username,
    this.password,
  });

  UserModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
    String? username,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        name,
        avatar,
        username,
        password,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
