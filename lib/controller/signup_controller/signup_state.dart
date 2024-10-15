part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {}

class SignupFailed extends SignupState {
  final String errorMessage;
  SignupFailed(this.errorMessage);
}

class IsPasswordShowing extends SignupState {}