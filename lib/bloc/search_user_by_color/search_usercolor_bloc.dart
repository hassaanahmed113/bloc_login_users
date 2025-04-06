import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_stream_app/bloc/search_user_by_color/search_usercolor_event.dart';
import 'package:live_stream_app/bloc/search_user_by_color/search_usercolor_state.dart';
import 'package:http/http.dart' as http;
import 'package:live_stream_app/model/search_user_model.dart';

class SearchUsercolorBloc
    extends Bloc<SearchUsercolorEvent, SearchUsercolorState> {
  SearchUsercolorBloc() : super(SearchUsercolorState()) {
    on<SearchUserByFilter>(_searchUserByFilter);
  }
  Future<void> _searchUserByFilter(
      SearchUserByFilter event, Emitter<SearchUsercolorState> emit) async {
    try {
      log(event.hairColor.toString());

      emit(SearchUsercolorLoading());
      var response = await http.get(
        Uri.parse(
            'https://dummyjson.com/users/filter?key=hair.color&value=${event.hairColor}'),
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      var data = json.decode(response.body);

      if (response.statusCode == 200) {
        if (data['users'] != null && data['users'] is List) {
          List<User> userData =
              List<User>.from(data['users'].map((e) => User.fromJson(e)));
          emit(SearchUsercolorSuccess(users: userData));
        }
      } else {
        emit(SearchUsercolorFailed(msg: data['message']));
      }
    } catch (e) {
      emit(SearchUsercolorFailed(msg: e.toString()));
    }
  }
}
