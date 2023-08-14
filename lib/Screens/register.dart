import 'package:flutter/material.dart';

import '../Services/Auth.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your email' : null,
                  onChanged: (value) {
                    setState(() => email = value);
                    debugPrint(email);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) =>
                      value!.length < 4 ? 'Weak Password' : null,
                  onChanged: (value) {
                    setState(() => password = value);
                    debugPrint(password);

                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      debugPrint("Valid");
                      dynamic result = await _auth.signUp(email, password);
                      //print(email);
                      //print(password);
                      if (result == null) {
                        setState(() {
                         // error = 'kindly enter valid email';
                          error = 'unable to register';

                        });
                      }
                    }
                  },
                  child: const Text('Sign UP')),
            ),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
