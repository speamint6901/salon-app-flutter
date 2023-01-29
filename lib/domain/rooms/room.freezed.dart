// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String get roomId => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError; // 最後のメッセージ
  String get lastSenderUid =>
      throw _privateConstructorUsedError; // 最後に送ったユーザーID
  List<String> get joinedUsers =>
      throw _privateConstructorUsedError; // ルームに所属するユーザーリスト1:1
  Map<String, bool> get usersQuery =>
      throw _privateConstructorUsedError; //　ルームが存在するかチェックするフィールド
  dynamic get createdAt => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String roomId,
      String lastMessage,
      String lastSenderUid,
      List<String> joinedUsers,
      Map<String, bool> usersQuery,
      dynamic createdAt,
      dynamic? updatedAt});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? lastMessage = null,
    Object? lastSenderUid = null,
    Object? joinedUsers = null,
    Object? usersQuery = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastSenderUid: null == lastSenderUid
          ? _value.lastSenderUid
          : lastSenderUid // ignore: cast_nullable_to_non_nullable
              as String,
      joinedUsers: null == joinedUsers
          ? _value.joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usersQuery: null == usersQuery
          ? _value.usersQuery
          : usersQuery // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$_RoomCopyWith(_$_Room value, $Res Function(_$_Room) then) =
      __$$_RoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      String lastMessage,
      String lastSenderUid,
      List<String> joinedUsers,
      Map<String, bool> usersQuery,
      dynamic createdAt,
      dynamic? updatedAt});
}

/// @nodoc
class __$$_RoomCopyWithImpl<$Res> extends _$RoomCopyWithImpl<$Res, _$_Room>
    implements _$$_RoomCopyWith<$Res> {
  __$$_RoomCopyWithImpl(_$_Room _value, $Res Function(_$_Room) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? lastMessage = null,
    Object? lastSenderUid = null,
    Object? joinedUsers = null,
    Object? usersQuery = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Room(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastSenderUid: null == lastSenderUid
          ? _value.lastSenderUid
          : lastSenderUid // ignore: cast_nullable_to_non_nullable
              as String,
      joinedUsers: null == joinedUsers
          ? _value._joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usersQuery: null == usersQuery
          ? _value._usersQuery
          : usersQuery // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Room implements _Room {
  const _$_Room(
      {required this.roomId,
      required this.lastMessage,
      required this.lastSenderUid,
      required final List<String> joinedUsers,
      required final Map<String, bool> usersQuery,
      required this.createdAt,
      this.updatedAt})
      : _joinedUsers = joinedUsers,
        _usersQuery = usersQuery;

  factory _$_Room.fromJson(Map<String, dynamic> json) => _$$_RoomFromJson(json);

  @override
  final String roomId;
  @override
  final String lastMessage;
// 最後のメッセージ
  @override
  final String lastSenderUid;
// 最後に送ったユーザーID
  final List<String> _joinedUsers;
// 最後に送ったユーザーID
  @override
  List<String> get joinedUsers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinedUsers);
  }

// ルームに所属するユーザーリスト1:1
  final Map<String, bool> _usersQuery;
// ルームに所属するユーザーリスト1:1
  @override
  Map<String, bool> get usersQuery {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_usersQuery);
  }

//　ルームが存在するかチェックするフィールド
  @override
  final dynamic createdAt;
  @override
  final dynamic? updatedAt;

  @override
  String toString() {
    return 'Room(roomId: $roomId, lastMessage: $lastMessage, lastSenderUid: $lastSenderUid, joinedUsers: $joinedUsers, usersQuery: $usersQuery, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Room &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastSenderUid, lastSenderUid) ||
                other.lastSenderUid == lastSenderUid) &&
            const DeepCollectionEquality()
                .equals(other._joinedUsers, _joinedUsers) &&
            const DeepCollectionEquality()
                .equals(other._usersQuery, _usersQuery) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      lastMessage,
      lastSenderUid,
      const DeepCollectionEquality().hash(_joinedUsers),
      const DeepCollectionEquality().hash(_usersQuery),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomCopyWith<_$_Room> get copyWith =>
      __$$_RoomCopyWithImpl<_$_Room>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {required final String roomId,
      required final String lastMessage,
      required final String lastSenderUid,
      required final List<String> joinedUsers,
      required final Map<String, bool> usersQuery,
      required final dynamic createdAt,
      final dynamic? updatedAt}) = _$_Room;

  factory _Room.fromJson(Map<String, dynamic> json) = _$_Room.fromJson;

  @override
  String get roomId;
  @override
  String get lastMessage;
  @override // 最後のメッセージ
  String get lastSenderUid;
  @override // 最後に送ったユーザーID
  List<String> get joinedUsers;
  @override // ルームに所属するユーザーリスト1:1
  Map<String, bool> get usersQuery;
  @override //　ルームが存在するかチェックするフィールド
  dynamic get createdAt;
  @override
  dynamic? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_RoomCopyWith<_$_Room> get copyWith => throw _privateConstructorUsedError;
}
