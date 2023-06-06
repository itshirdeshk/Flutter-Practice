import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ui_practice/functions/authFunctions.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      key: const ValueKey("username"),
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return "The length of username should be greater than 3";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter your Username"),
                    )
                  : Container(),
              TextFormField(
                key: const ValueKey("email"),
                decoration: const InputDecoration(hintText: "Enter your Email"),
                validator: (value) {
                  if (!(value.toString().contains("@"))) {
                    return "Invalid Email";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key: const ValueKey("password"),
                decoration:
                    const InputDecoration(hintText: "Enter your Password"),
                validator: (value) {
                  if (value.toString().length < 5) {
                    return "The length of password should be greater than 6";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          signup(email, password);
                        }
                      },
                      child: isLogin ? const Text("Login") : Text("SignUP"))),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? const Text("Don't have an account? Signup")
                      : const Text("Already Signed Up? Login...")),
            ],
          ),
        ),
      ),
    );
  }
}
