part of 'change_lang_cubit.dart';

@immutable
sealed class ChangeLangState {}

final class ChangeLangInitial extends ChangeLangState {}

final class ChangeLangSuccessToEn extends ChangeLangState {}
final class ChangeLangSuccessToAr extends ChangeLangState {}
