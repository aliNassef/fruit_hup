import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  Future<void> logout() async {
    emit(LogOutLoading());
    await _profileRepo.logout();
    emit(LogOutLoaded());
  }
}
