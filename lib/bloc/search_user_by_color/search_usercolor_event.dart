abstract class SearchUsercolorEvent {
  SearchUsercolorEvent();
}

class SearchUserByFilter extends SearchUsercolorEvent {
  final String? hairColor;
  SearchUserByFilter({this.hairColor});
}
