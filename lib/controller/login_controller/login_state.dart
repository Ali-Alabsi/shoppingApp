part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginChangeToSignUp extends LoginState {}

class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailed extends LoginState {
  final String errorMessage;
  LoginFailed(this.errorMessage);
}

class IsPasswordShowing extends LoginState {}