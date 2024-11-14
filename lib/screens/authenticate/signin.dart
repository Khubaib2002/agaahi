import 'package:flutter/material.dart';
import 'package:agaahi/shared/inputdecor.dart';
import 'package:agaahi/shared/loading.dart';
import 'package:agaahi/shared/styledbody.dart';
import 'package:agaahi/services/auth.dart';

class Signin extends StatefulWidget {
  final toggleview;
  const Signin({super.key, required this.toggleview});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  var email = '';
  var pass = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 9, 1, 74),
            appBar: AppBar(
                backgroundColor: Colors.yellow,
                elevation: 0,
                title: const StyledBodyText('Sign In', 18),
                actions: <Widget>[
                  TextButton.icon(
                    label: const StyledBodyText("Register", 13),
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
                    const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/open.png', height: 430),
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
                            //     validator: (val) =>
                            //         val!.isEmpty ? 'Enter a password' : null,
                            //     obscureText: true,
                            //     onChanged: (val) {
                            //       setState(() => pass = val);
                            //     },
                            //     decoration: textinputdecor.copyWith(
                            //         hintText: 'Password')),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            TextFormField(
                              validator: (val) => val!.isEmpty ? 'Enter a password' : null,
                              obscureText: true,
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
                                      await _auth.signin_wenp(email, pass);
                                  print('valid');
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error =
                                          'Could not sign in with given credentials';
                                    });
                                  }
                                }
                                // dynamic result = await _auth.signInAnon();
                                // if (result == null) {
                                //   print('error signing in');
                                // } else {
                                //   print('signed in');
                                //   print(result.uid);
                                // }
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


// (child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Username',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.person),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.lock),
//                         ),
//                       ),
//                     ],
//                   ),
// )