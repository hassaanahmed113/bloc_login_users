abstract class LoginTwoEvent {
  LoginTwoEvent();
}

class LoginTwoUserFeature extends LoginTwoEvent {
  final String? username;
  final String? pw;
  LoginTwoUserFeature({this.username, this.pw});
}
