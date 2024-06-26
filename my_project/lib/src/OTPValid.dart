import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/src/Login.dart';

class OTPValid extends StatefulWidget {
  const OTPValid({Key? key}) : super(key: key);

  @override
  State<OTPValid> createState() => _OTPValidState();
}

class _OTPValidState extends State<OTPValid> {
  String verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Code'),
        backgroundColor: Color.fromARGB(255, 255, 244, 246),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 244, 246),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your OTP code number',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationCode = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter Verification Code',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: verificationCode.length < 4
                    ? null
                    : () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
                child: const Text('Verify'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 255, 244, 246),
                  minimumSize: const Size(120, 50),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Didn\'t receive any code?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 121, 121),
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
