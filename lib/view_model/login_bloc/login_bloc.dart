import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../repository/auth_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? loginResult = '';
  AuthModel authModel= AuthModel();
  LoginBloc() : super(LoginInitial()) {
    on<LoginClickEvent>((event, emit) async {
      emit(LoginScreenLoadingState());
      try{
        User? user = await authModel.loginWithEmailAndPassword(email: event.email, password: event.password);
        emit(LoginScreenLoadedState(user));
      }
      on FirebaseAuthException catch (e)
      {
        emit(LoginScreenErrorState(error: loginResult.toString()));
      }
      catch(error){
        emit(LoginScreenErrorState(error: loginResult.toString()));
      }
    });
  }
}
