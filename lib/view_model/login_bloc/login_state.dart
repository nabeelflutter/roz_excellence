part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginScreenLoadingState extends LoginState{

}

class LoginScreenLoadedState extends LoginState{
  final User? user;
  LoginScreenLoadedState(this.user);
}

class LoginScreenErrorState extends LoginState{
  String error;
  LoginScreenErrorState({required this.error});
}