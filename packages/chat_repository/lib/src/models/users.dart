import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Users {
  final List<String> chatIds;

  Users(this.chatIds);

  Users copyWith({String chatIds}) {
    return Users(
      chatIds ?? this.chatIds,
    );
  }

  @override
  int get hashCode => chatIds.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Users &&
          runtimeType == other.runtimeType &&
          chatIds == other.chatIds;

  @override
  String toString() {
    return 'Profile{chatIds: $chatIds}';
  }

  UsersEntity toEntity() {
    return UsersEntity(chatIds);
  }

  static Users fromEntity(UsersEntity entity) {
    return Users(
      entity.chatIds,
    );
  }
}
