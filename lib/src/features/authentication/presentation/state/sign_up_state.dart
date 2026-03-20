class SignUpState {
  final String email;
  final String userName;
  final String password;
  final String rePassword;

  final String? errorName;
  final String? errorEmail;
  final String? errorPassword;
  final String? errorRePassword;

  SignUpState(
      {this.userName = '',
      this.email = '',
      this.password = '',
      this.rePassword = '',
      this.errorName,
      this.errorEmail,
      this.errorPassword,
      this.errorRePassword});

  SignUpState copyWith(
      {String? userName,
      String? email,
      String? password,
      String? rePassword,
      String? errorName,
      String? errorEmail,
      String? errorPassword,
      String? errorRePassword}) {
    return SignUpState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword,
        errorName: errorName,
        errorEmail: errorEmail,
        errorPassword: errorPassword,
        errorRePassword: errorRePassword);
  }
}
