// Debounce and Form Validation by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const SignInWithValidationAndDebounce(),
    );
  }
}

class SignInWithValidationAndDebounce extends StatefulWidget {
  const SignInWithValidationAndDebounce({Key? key}) : super(key: key);

  @override
  State<SignInWithValidationAndDebounce> createState() =>
      _SignInWithValidationAndDebounceState();
}

class _SignInWithValidationAndDebounceState
    extends State<SignInWithValidationAndDebounce> {
  Timer? debounce;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _emailValid = true;
  bool _passwordValid = true;

  @override
  void dispose() {
    debounce?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailValid ? null : 'Please enter a valid email',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                if (debounce?.isActive ?? false) debounce?.cancel();
                debounce = Timer(const Duration(milliseconds: 500), () {
                  setState(() {
                    _emailValid = validateEmail(value) == null;
                  });
                });
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordValid
                    ? null
                    : 'Password must be at least 8 characters long',
              ),
              obscureText: true,
              onChanged: (String value) {
                if (debounce?.isActive ?? false) debounce?.cancel();
                debounce = Timer(const Duration(milliseconds: 500), () {
                  setState(() {
                    _passwordValid = validatePassword(value) == null;
                  });
                });
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(onPressed: () {}, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}
