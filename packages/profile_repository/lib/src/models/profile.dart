import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Profile {
  final String firstName;
  final String lastName;
  final String profilePicUrl;

  Profile(this.firstName, this.lastName, this.profilePicUrl);

  Profile copyWith({String firstName, String lastName, String profilePicUrl}) {
    return Profile(
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      profilePicUrl ?? this.profilePicUrl,
    );
  }

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ profilePicUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          profilePicUrl == other.profilePicUrl;

  @override
  String toString() {
    return 'Profile{firstName: $firstName, lastName: $lastName, profilePicUrl: $profilePicUrl}';
  }

  ProfileEntity toEntity() {
    return ProfileEntity(firstName, lastName, profilePicUrl);
  }

  static Profile fromEntity(ProfileEntity entity) {
    return Profile(
      entity.firstName,
      entity.lastName,
      entity.profilePicUrl,
    );
  }
}
