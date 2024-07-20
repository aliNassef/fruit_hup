part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LogOutLoaded extends ProfileState {}

final class LogOutLoading extends ProfileState {}
