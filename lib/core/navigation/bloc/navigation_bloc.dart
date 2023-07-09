// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../util/navigation_util.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationUtil navigationUtil;
  NavigationBloc(
    this.navigationUtil,
  ) : super(const AuthSt()) {
    on<AppStartedEv>((event, emit) async {
      debugPrint('APP STARTED');
      final bool isOnHomeRoute = await navigationUtil.isOnHomeRoute();
      final bool isOnAuthRoute = await navigationUtil.isOnAuthRoute();

      if (isOnAuthRoute || state == const AuthSt()) {
        emit(
          const AuthSt(),
        );
      }

      if (isOnHomeRoute) {
        emit(
          const HomeSt(),
        );
      }
    });

    on<AuthEv>((event, emit) {
      navigationUtil.setNavigationToAuth();
      emit(
        const AuthSt(),
      );
    });

    on<HomeEv>((event, emit) {
      navigationUtil.setNavigationToHome();
      emit(
        const HomeSt(),
      );
    });
  }
}
