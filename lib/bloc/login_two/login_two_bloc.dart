import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:live_stream_app/bloc/login_two/login_two_event.dart';
import 'package:live_stream_app/bloc/login_two/login_two_state.dart';
import 'package:http/http.dart' as http;

class LoginTwoBloc extends Bloc<LoginTwoEvent, LoginTwoState> {
  LoginTwoBloc() : super(LoginTwoState()) {
    on<LoginTwoUserFeature>(loginTwoUserFeature);
  }

  Future<void> loginTwoUserFeature(
      LoginTwoUserFeature event, Emitter<LoginTwoState> emit) async {
    try {
      emit(LoginTwoLoading());
      var response =
          await http.post(Uri.parse('https://dummyjson.com/user/login'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode({
                'username': event.username,
                'password': event.pw,
                'expiresInMins': 30, // optional, defaults to 60
              }));
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        emit(LoginTwoSuccess(msg: 'User login successfully'));
      } else {
        var data = json.decode(response.body);
        emit(LoginTwoFailed(msg: data['message']));
      }
    } catch (e) {
      emit(LoginTwoFailed(msg: e.toString()));
    }
  }
}
