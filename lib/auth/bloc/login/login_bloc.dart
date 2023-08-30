// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import 'package:mawadda_app/auth/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(
    this.authRepository,
  ) : super(LoginInitial()) {
    on<LoginFetchEv>((event, emit) async {
      final login = await authRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );
    });
  }
}