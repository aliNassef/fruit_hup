import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController departmentNumberController = TextEditingController();
  bool switchValue = true;
  void changeSwitchVal(bool value) {
    switchValue = value;
    emit(ChangeSwitchValue());
  }
}
