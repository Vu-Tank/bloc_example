import 'package:example_bloc/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          } else if (state is Authed) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const FlutterLogo(),
                  const Text('Welcome to Login Screen'),
                  TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      labelText: 'User Name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0)),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (state is Authing)
                            ? null
                            : () {
                                context.read<AuthBloc>().add(AuthLogin(
                                    userNameController.text.trim(),
                                    passwordController.text.trim()));
                              },
                        child: (state is Authing)
                            ? const CircularProgressIndicator()
                            : const Text('Login')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
