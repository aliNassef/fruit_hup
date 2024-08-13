part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LogOutLoaded extends ProfileState {}

final class LogOutLoading extends ProfileState {}

final class PassChanged extends ProfileState {}

final class NameChanged extends ProfileState {}

final class getSecureText extends ProfileState {}
