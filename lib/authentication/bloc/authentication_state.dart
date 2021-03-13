part of 'authentication_bloc.dart';

// DMP - TODO: Change these individual states to different classes. I think
//             this is better b/c it allows states to have their own
//             methods, fields, etc. Also, AuthenticationState should be a
//             abstract class that these individual states implement

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = AuthInfo.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(AuthInfo user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final AuthInfo user;

  @override
  List<Object> get props => [status, user];
}
