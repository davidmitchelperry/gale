import 'package:meta/meta.dart';

class InstaMedia {
  String id, type, url, username, timestamp;
  bool selected;

  InstaMedia(Map<String, dynamic> m) {
    id = m['id'];
    type = m['media_type'];
    url = m['media_url'];
    username = m['username'];
    timestamp = m['timestamp'].toString();
    selected = false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "keyID": id,
      "keyType": type,
      "keyURL": url,
      "keyUsername": username,
      "keyTimestamp": DateTime.now(),
    };
  }
}
