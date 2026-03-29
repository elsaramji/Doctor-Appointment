sealed class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifyTimerUpdated extends VerifyState {
  final int secondsRemaining;
  final bool canResend;

  VerifyTimerUpdated(this.secondsRemaining, {this.canResend = false});
}

class VerifySuccess extends VerifyState {
  final String token;
  VerifySuccess(this.token);
}

class VerifyFailure extends VerifyState {
  final String message;
  VerifyFailure(this.message);
}
