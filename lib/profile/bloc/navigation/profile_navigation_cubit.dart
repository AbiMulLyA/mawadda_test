import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'profile_navigation_state.dart';

enum CurrentProfilePage { profilePage, editProfilePage }

@lazySingleton
class ProfileNavigationCubit extends Cubit<ProfileNavigationState> {
  ProfileNavigationCubit() : super(const ProfileSt());

  void changePage(CurrentProfilePage currenPage) {
    if (currenPage == CurrentProfilePage.editProfilePage) {
      emit(
        const EditProfileSt(),
      );
    } else {
      emit(
        const ProfileSt(),
      );
    }
  }
}
