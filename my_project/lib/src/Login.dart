import 'package:flutter/material.dart';
import 'package:my_project/ThemeToggleIcon.dart';
import 'package:my_project/src/ForgetPassword.dart';
import 'package:my_project/src/JSON/users.dart';
import 'package:my_project/src/SQLite/database_helper.dart';
import 'package:my_project/src/Sign%20Up.dart';
import 'package:my_project/src/dashbord/view/page/dashboard_page.dart';
// Import the ThemeToggleIcon

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;

  void _validateFields() {
    setState(() {
      _emailErrorText =
          _emailController.text.isEmpty ? ' enter your email' : null;

      _passwordErrorText = _passwordController.text.isEmpty
          ? 'Please enter your password'
          : _passwordController.text.length < 8
              ? 'Password must be at least 8 characters'
              : null;
    });

    if (_emailErrorText == null && _passwordErrorText == null) {
      login();
    }
  }

  final db = DatabaseHelper();

  login() async {
    Users? usrDetails = await db.getUser(_emailController.text);
    var res = await db.authenticate(Users(
        usrName: _emailController.text, password: _passwordController.text));
    if (res == true) {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  bool isLoginTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 252, 229, 229),
        actions: [
          ThemeToggleIcon(), // Add the ThemeToggleIcon here
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60),
              const Text(
                'Welcome to my app!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 131, 130, 130),
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'User Name',
                  errorText: _emailErrorText,
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 252, 229, 229), width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: _passwordErrorText,
                  prefixIcon: const Icon(Icons.password_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 252, 201, 201), width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              MaterialButton(
                  elevation: 5.0,
                  color: Color.fromARGB(255, 252, 229, 229),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: _validateFields,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 124, 124, 124), // Set text color to white
                      fontSize: 20, // Set font size
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              if (isLoginTrue)
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Incorrect Email Or Password',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ForgetPassword();
                  }));
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 250, 189, 189),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUp();
                  }));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 250, 189, 189),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
