import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Profile {
  final String firstName;
  final String lastName;
  final String imagesUrl;

  Profile(this.firstName, this.lastName, this.imagesUrl);

  Profile copyWith({String firstName, String lastName, String imagesUrl}) {
    return Profile(
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      imagesUrl ?? this.imagesUrl,
    );
  }

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ imagesUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          imagesUrl == other.imagesUrl;

  @override
  String toString() {
    return 'Profile{firstName: $firstName, lastName: $lastName, imagesUrl: $imagesUrl}';
  }

  ProfileEntity toEntity() {
    return ProfileEntity(firstName, lastName, imagesUrl);
  }

  static Profile fromEntity(ProfileEntity entity) {
    return Profile(
      entity.firstName,
      entity.lastName,
      entity.imagesUrl,
    );
  }
}
