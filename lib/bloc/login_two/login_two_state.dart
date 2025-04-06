import 'package:equatable/equatable.dart';

class LoginTwoState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginTwoLoading extends LoginTwoState {}

class LoginTwoSuccess extends LoginTwoState {
  final String? msg;
  LoginTwoSuccess({this.msg});
}

class LoginTwoFailed extends LoginTwoState {
  final String? msg;
  LoginTwoFailed({this.msg});
}
