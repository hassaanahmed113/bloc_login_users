import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_stream_app/bloc/login_two/login_two_bloc.dart';
import 'package:live_stream_app/bloc/login_two/login_two_event.dart';
import 'package:live_stream_app/bloc/login_two/login_two_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userNameController = TextEditingController();

  final userIdController = TextEditingController();

  bool isHost = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Live Streaming App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/zego_cloud_logo.png'),
            TextField(
              controller: userNameController,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration:
                  const InputDecoration(fillColor: Colors.blue, filled: true),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: userIdController,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration:
                  const InputDecoration(fillColor: Colors.blue, filled: true),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Host",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  width: 3,
                ),
                Checkbox(
                  value: isHost,
                  onChanged: (value) {
                    setState(() {
                      isHost = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<LoginTwoBloc, LoginTwoState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: state is LoginTwoLoading
                        ? null
                        : () {
                            context.read<LoginTwoBloc>().add(
                                LoginTwoUserFeature(
                                    username: userNameController.text,
                                    pw: userIdController.text));
                          },
                    child: state is LoginTwoLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Text("Login"));
              },
              listener: (context, state) {
                if (state is LoginTwoSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.msg ?? ""),
                      duration: const Duration(
                          seconds:
                              1), // Duration for which the SnackBar is shown
                    ),
                  );
                } else if (state is LoginTwoFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.msg ?? ""),
                      duration: const Duration(
                          seconds:
                              1), // Duration for which the SnackBar is shown
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
