class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoaded extends ForgetPassState {}

final class ForgetPassFailure extends ForgetPassState {
  final String errMessage;

  ForgetPassFailure({required this.errMessage});
}

final class ForgetPassLoadingl extends ForgetPassState {}
