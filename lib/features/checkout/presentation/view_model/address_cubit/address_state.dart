part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class ChangeSwitchValue extends AddressState {}
