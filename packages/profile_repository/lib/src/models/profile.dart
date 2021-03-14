import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Profile {
  final String firstName;
  final String lastName;
  final String profilePicUrl;
  final List<String> imageUrls;

  Profile(this.firstName, this.lastName, this.profilePicUrl, this.imageUrls);

  Profile copyWith({
    String firstName,
    String lastName,
    String profilePicUrl,
    List<String> imageUrl,
  }) {
    return Profile(firstName ?? this.firstName, lastName ?? this.lastName,
        profilePicUrl ?? this.profilePicUrl, imageUrls ?? this.imageUrls);
  }

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      profilePicUrl.hashCode ^
      imageUrls.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          profilePicUrl == other.profilePicUrl &&
          imageUrls == other.imageUrls;

  @override
  String toString() {
    return 'Profile{firstName: $firstName, lastName: $lastName, profilePicUrl: $profilePicUrl, imageUrls: $imageUrls }';
  }

  ProfileEntity toEntity() {
    return ProfileEntity(firstName, lastName, profilePicUrl);
  }

  static Profile fromEntity(ProfileEntity entity) {
    return Profile(
      entity.firstName,
      entity.lastName,
      entity.profilePicUrl,
      [],
    );
  }
}
