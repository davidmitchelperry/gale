import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class OpenChats {
  final String chatId;

  OpenChats(this.chatId);

  OpenChats copyWith({String chatId}) {
    return OpenChats(
      chatId ?? this.chatId,
    );
  }

  @override
  int get hashCode => chatId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpenChats &&
          runtimeType == other.runtimeType &&
          chatId == other.chatId;

  @override
  String toString() {
    return 'Profile{chatId: $chatId}';
  }

  OpenChatsEntity toEntity() {
    return OpenChatsEntity(chatId);
  }

  static OpenChats fromEntity(OpenChatsEntity entity) {
    return OpenChats(
      entity.chatId,
    );
  }
}
