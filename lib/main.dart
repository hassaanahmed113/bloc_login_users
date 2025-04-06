import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_stream_app/bloc/login_two/login_two_bloc.dart';
import 'package:live_stream_app/bloc/search_user_by_color/search_usercolor_bloc.dart';
import 'package:live_stream_app/home_screen.dart';
import 'package:live_stream_app/search_user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginTwoBloc()),
        BlocProvider(create: (_) => SearchUsercolorBloc()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
