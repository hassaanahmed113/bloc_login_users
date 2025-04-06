import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_stream_app/bloc/search_user_by_color/search_usercolor_event.dart';
import 'package:live_stream_app/bloc/search_user_by_color/search_usercolor_state.dart';
import 'package:live_stream_app/home_screen.dart';

import 'bloc/search_user_by_color/search_usercolor_bloc.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Search User",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<SearchUsercolorBloc, SearchUsercolorState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/zego_cloud_logo.png'),
                  TextField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                        fillColor: Colors.blue, filled: true),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: state is SearchUsercolorLoading
                          ? null
                          : () {
                              context.read<SearchUsercolorBloc>().add(
                                  SearchUserByFilter(
                                      hairColor: userNameController.text));
                            },
                      child: state is SearchUsercolorLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text("Search")),
                  state is SearchUsercolorLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is SearchUsercolorSuccess
                          ? (state.users?.isEmpty ?? false)
                              ? const Center(
                                  child: Text('No User Found'),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                  itemCount: state.users?.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          state.users?[index].firstName ?? ""),
                                    );
                                  },
                                ))
                          : const SizedBox.shrink()
                ],
              );
            },
          )),
    );
  }
}
