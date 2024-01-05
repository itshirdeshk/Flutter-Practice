import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notify Listener"),
      ),
      body: Center(
          child: Column(
            children: [
              ValueListenableBuilder(valueListenable: toggle, builder: (context, value, child) {
                return TextFormField(
                      obscureText: toggle.value,
                      decoration: InputDecoration(
                          suffix: InkWell(
                              onTap: () {
                                toggle.value = !toggle.value;
                              },
                              child: toggle.value
                                  ? Icon(Icons.visibility_off_rounded)
                                  : Icon(Icons.visibility)),
                          hintText: "Password"),
                    );
              }),
              Center(
                child: ValueListenableBuilder(
                    valueListenable: _counter,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Container(
                            child: Text(_counter.value.toString()),
                          )
                        ],
                      );
                    }),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
