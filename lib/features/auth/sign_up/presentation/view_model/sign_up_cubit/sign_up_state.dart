part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpLoaded extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SignUpDone extends SignUpState {}
