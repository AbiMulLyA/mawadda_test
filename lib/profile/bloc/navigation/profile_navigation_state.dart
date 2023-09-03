part of 'profile_navigation_cubit.dart';

abstract class ProfileNavigationState extends Equatable {
  const ProfileNavigationState();

  @override
  List<Object> get props => [];
}

class ProfileSt extends ProfileNavigationState {
  const ProfileSt();

  @override
  String toString() => 'ProfileNavigationState.ProfileSt';

  @override
  List<Object> get props => [];
}

class EditProfileSt extends ProfileNavigationState {
  const EditProfileSt();

  @override
  String toString() => 'ProfileNavigationState.EditProfileSt';

  @override
  List<Object> get props => [];
}
