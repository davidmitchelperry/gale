import 'package:meta/meta.dart';
import 'package:chat_repository/chat_repository.dart';

@immutable
class MessageHistory {
  final List<Message> messages;
  final String partnerId;

  MessageHistory({
    this.messages,
    this.partnerId,
  });

  MessageHistory copyWith({List<Message> messages, partnerId}) {
    return MessageHistory(
      messages: messages ?? this.messages,
      partnerId: partnerId ?? this.partnerId,
    );
  }

  @override
  int get hashCode => messages.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          messages == messages;

  @override
  String toString() {
    return 'MessageHistory{ messages: $messages }';
  }

  MessageHistoryEntity toEntity() {
    List<MessageEntity> entities = [];
    for (final msg in messages) {
      entities.add(msg.toEntity());
    }
    return MessageHistoryEntity(
      messages: entities,
    );
  }

  static MessageHistory fromEntity(MessageHistoryEntity entity) {
    List<Message> msgs = [];
    for (final m in entity.messages) {
      msgs.add(Message.fromEntity(m));
    }
    return MessageHistory(
      messages: msgs,
    );
  }
}
