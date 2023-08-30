part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginFetchEv extends LoginEvent {
  const LoginFetchEv({
    required this.password,
    required this.email,
  });

  final String password;
  final String email;

  @override
  String toString() =>
      'LoginEvent.LoginFetchEv { password: $password, email: $email}';

  @override
  List<Object> get props => [
        password,
        email,
      ];
}
