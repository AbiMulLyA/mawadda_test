part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialSt extends LoginState {
  @override
  String toString() => 'LoginState.InitialSt';

  @override
  List<Object> get props => [];
}

class LoginLoadingSt extends LoginState {
  @override
  String toString() => 'LoginState.LoadingSt';

  @override
  List<Object> get props => [];
}

class LoginSuccessSt extends LoginState {
  @override
  String toString() => 'LoginState.SuccessSt';

  @override
  List<Object> get props => [];
}

class LoginFailedSt extends LoginState {
  @override
  String toString() => 'LoginState.FailedSt';

  @override
  List<Object> get props => [];
}
