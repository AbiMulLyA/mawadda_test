part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class AuthSt extends NavigationState {
  const AuthSt();

  @override
  String toString() => 'NavigationState.AuthSt';

  @override
  List<Object> get props => [];
}

class HomeSt extends NavigationState {
  const HomeSt();

  @override
  String toString() => 'NavigationState.HomeSt';

  @override
  List<Object> get props => [];
}
