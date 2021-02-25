import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Message {

  final String sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });

  Message copyWith({String sender, String time, String text, bool isLiked, bool unread}) {
    return Message(
      sender: sender ?? this.sender,
      time: time ?? this.time,
      text: text ?? this.text,
      isLiked: isLiked ?? this.isLiked,
      unread: unread ?? this.unread,
    );
  }

  @override
  int get hashCode =>
      sender.hashCode ^
      time.hashCode ^
      text.hashCode ^
      isLiked.hashCode ^
      unread.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Message &&
              runtimeType == other.runtimeType &&
              sender == other.sender &&
              time == other.time &&
              text == other.text &&
              isLiked == other.isLiked &&
              unread == other.unread;

  @override
  String toString() {
    return 'Message{ sender: $sender, time: $time, text: $text, isLiked: $isLiked, unread: $unread }';
  }

  MessageEntity toEntity() {
    return MessageEntity(
        sender: sender,
        time: time,
        text: text,
        isLiked: isLiked,
        unread: unread,
    );
  }

  static Message fromEntity(MessageEntity entity) {
    return Message(
      sender: entity.sender,
      time: entity.time,
      text: entity.text,
      isLiked: entity.isLiked,
      unread: entity.unread,
    );
  }
}
