import 'package:flutter/material.dart';
import 'package:agaahi/shared/inputdecor.dart';
import 'package:agaahi/shared/loading.dart';
import 'package:agaahi/shared/styledbody.dart';
import 'package:agaahi/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  const Register({super.key, required this.toggleview});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var pass = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 9, 1, 74),
            appBar: AppBar(
                backgroundColor: Colors.yellow,
                elevation: 0,
                title: const StyledBodyText('Register for Agaahi', 18),
                actions: <Widget>[
                  TextButton.icon(
                    label: const StyledBodyText('Sign in here', 13),
                    onPressed: () async {
                      widget.toggleview();
                    },
                    style: TextButton.styleFrom(
                      // backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.black,
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.all(Radius.elliptical(5, 3))),
                    ),
                    icon: const Icon(Icons.person,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  )
                ]),
            resizeToAvoidBottomInset:
                true, // This prevents overflow when the keyboard appears
            body: SingleChildScrollView(
              // Wrap with SingleChildScrollView
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/open.png',
                        height: 430,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // TextFormField(
                            //   validator: (val) =>
                            //       val!.isEmpty ? 'Enter an email' : null,
                            //   onChanged: (val) {
                            //     setState(() => email = val);
                            //   },
                            //   decoration:
                            //       textinputdecor.copyWith(hintText: 'Email'),
                            // ),
                            TextFormField(
                              validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              decoration: textinputdecor.copyWith(
                                hintText: 'Email',
                                fillColor: Colors.white, // Set background color to white
                                filled: true, // Enable filling the background
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade300), // Border color
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade500), // Focus border color
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            
                            // TextFormField(
                            //     obscureText: true,
                            //     validator: (val) =>
                            //         val!.isEmpty ? 'Enter a password' : null,
                            //     onChanged: (val) {
                            //       setState(() => pass = val);
                            //     },
                            //     decoration: textinputdecor.copyWith(
                            //         hintText: 'Password')),

                            TextFormField(
                              obscureText: true,
                              validator: (val) => val!.isEmpty ? 'Enter a password' : null,
                              onChanged: (val) {
                                setState(() => pass = val);
                              },
                              decoration: textinputdecor.copyWith(
                                hintText: 'Password',
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade500),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.register_wenp(email, pass);
                                  print('valid');
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error =
                                          'Please provide valid email & password';
                                    });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 30.0),
                                child: Text('Login',
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              error,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
  }
}
