import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedValue = 'Orange';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DropDown Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 70,
                color: Colors.blue.shade200,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade200,
                    isExpanded: true,
                    value: selectedValue,
                    icon: const Icon(Icons.arrow_drop_down_circle),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>["Orange", "Mango", "Apple", "Grapes"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                          ));
                    }).toList()),
              ),
            ],
          ),
        ));
  }
}
