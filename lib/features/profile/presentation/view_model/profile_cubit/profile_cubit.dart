import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;
  TextEditingController newName = TextEditingController();
  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController reNewPass = TextEditingController();
  bool secureCurrentPass = true;
  bool secureNewPass = true;
  bool secureReNewPass = true;
  Future<void> logout() async {
    emit(LogOutLoading());
    await _profileRepo.logout();
    emit(LogOutLoaded());
  }

  Future<void> changeUserName({required String name}) async {
    await _profileRepo.changeUserName(name);
    emit(NameChanged());
  }

  Future<void> changeUserpass({required String newpass}) async {
    await _profileRepo.changeUserPass(newpass);
    emit(PassChanged());
  }

  changeSecurePass({required int index}) {
    if (index == 0) {
      secureCurrentPass = !secureCurrentPass;
    }
    if (index == 1) {
      secureNewPass = !secureNewPass;
    }
    if (index == 2) {
      secureReNewPass = !secureReNewPass;
    }
    emit(getSecureText());
  }
}
