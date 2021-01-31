import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Profile {
  final String firstName;
  final String lastName;

  Profile(this.firstName, this.lastName);

  Profile copyWith({String firstName, String lastName}) {
    return Profile(
      firstName ?? this.firstName,
      lastName ?? this.lastName,
    );
  }

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName;

  @override
  String toString() {
    return 'Profile{firstName: $firstName, lastName: $lastName}';
  }

  ProfileEntity toEntity() {
    return ProfileEntity(firstName, lastName);
  }

  static Profile fromEntity(ProfileEntity entity) {
    return Profile(
      entity.firstName,
      entity.lastName,
    );
  }
}
