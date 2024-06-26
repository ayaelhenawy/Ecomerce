import 'package:flutter/material.dart';
import 'package:my_project/core2/lang/cubit/parent_cubit.dart';
import 'package:my_project/src/JSON/users.dart';
import 'package:my_project/src/Login.dart';
import 'package:my_project/src/SQLite/database_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _name, _password;

  final db = DatabaseHelper();

  signUp() async {
    var res = await db
        .createUser(Users(email: _email, usrName: _name, password: _password));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      // Display an error message if the username already exists
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          ParentCubit.instance.local['username_exists'] ??
              'Username already exists',
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ParentCubit.instance.local['sign_up'] ?? 'Sign Up',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(255, 252, 229, 229),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            const SizedBox(height: 5),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ParentCubit.instance.local['please_enter_email'] ??
                      'Please enter an email';
                } else if (!value.contains('@gmail.com')) {
                  return ParentCubit
                          .instance.local['please_enter_valid_gmail'] ??
                      'Please enter a valid Gmail address';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: ParentCubit.instance.local['email'] ?? 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              onSaved: (value) => _email = value!,
            ),
            const SizedBox(height: 40),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ParentCubit.instance.local['please_enter_user_name'] ??
                      'Please enter a User Name';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText:
                    ParentCubit.instance.local['user_name_hint'] ?? 'User Name',
                prefixIcon: Icon(Icons.person),
              ),
              onSaved: (value) => _name = value!,
            ),
            const SizedBox(height: 40),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ParentCubit.instance.local['enter_password'] ??
                      'Please enter a password';
                } else if (value.length < 8) {
                  return ParentCubit.instance.local['password_length_error'] ??
                      'Password must be at least 8 characters';
                }

                return null;
              },
              decoration: InputDecoration(
                hintText:
                    ParentCubit.instance.local['password_hint'] ?? 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              onSaved: (value) => _password = value!,
              obscureText: true,
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 150,
                height: 60, // Set the width of the button
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 252, 229, 229),
                    ), // Set button background color
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      signUp();
                    }
                  },
                  child: Text(
                    ParentCubit.instance.local['sign_up'] ?? 'Sign Up',
                    style: TextStyle(
                      color: Color.fromARGB(255, 87, 87, 87),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                ParentCubit.instance.local['already_have_account'] ??
                    'Already have an account?',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 150,
                height: 60, // Set the width of the button
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 252, 229, 229),
                    ), // Set button background color
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: Text(
                    ParentCubit.instance.local['login'] ?? 'Log in',
                    style: TextStyle(
                      color: Color.fromARGB(255, 87, 87, 87),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
