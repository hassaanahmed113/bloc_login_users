import 'package:equatable/equatable.dart';

import '../../model/search_user_model.dart';

class SearchUsercolorState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchUsercolorLoading extends SearchUsercolorState {}

class SearchUsercolorSuccess extends SearchUsercolorState {
  final List<User>? users;
  SearchUsercolorSuccess({this.users});
}

class SearchUsercolorFailed extends SearchUsercolorState {
  final String? msg;
  SearchUsercolorFailed({this.msg});
}
