import 'package:example_bloc/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Center(
          child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            if (state is UnAuthed) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          }, builder: (context, state) {
            if (state is Authed) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome to Home Screen'),
                  const SizedBox(height: 20),
                  Text(state.userModel.fullName),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                      child: const Text('Logout')),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
