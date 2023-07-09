part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEv extends NavigationEvent {
  const AppStartedEv();

  @override
  String toString() => 'NavigationEvent.AppStartedEv';

  @override
  List<Object> get props => [];
}

class AuthEv extends NavigationEvent {
  const AuthEv();

  @override
  String toString() => 'NavigationEvent.AuthEv';

  @override
  List<Object> get props => [];
}

class HomeEv extends NavigationEvent {
  const HomeEv();

  @override
  String toString() => 'NavigationEvent.HomeEv';

  @override
  List<Object> get props => [];
}
