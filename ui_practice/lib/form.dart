import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    String firstName = '';
    String lastName = '';
    String email = '';
    String password = '';
    final _formKey = GlobalKey<FormState>();

    // ----------------FUNCTIONS-----------

    submitForm() {
      print(firstName);
      print(lastName);
      print(email);
      print(password);
    }

    trySubmit() {
      final isvalid = _formKey.currentState!.validate();
      if (isvalid) {
        _formKey.currentState!.save();
        submitForm();
      } else {
        print("Error");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Widget"),
      ),
      body: Center(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter First Name"),
                  key: const ValueKey('firstName'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "First Name should not be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    firstName = value.toString();
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter Last Name"),
                  key: const ValueKey('lastName'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Last Name should not be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lastName = value.toString();
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter your Email"),
                  key: const ValueKey('email'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Email should not be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: "Enter your Password"),
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value.toString().length <= 5) {
                      return "Minimum length of password should be 6";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    firstName = value.toString();
                  },
                ),
                TextButton(
                    onPressed: () {
                      trySubmit();
                    },
                    child: Text("Submit"))
              ],
            )),
          )),
    );
  }
}
