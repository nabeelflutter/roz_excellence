part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginClickEvent extends LoginEvent{
  String email;
  String password;
  LoginClickEvent({required this.email,required this.password});
}