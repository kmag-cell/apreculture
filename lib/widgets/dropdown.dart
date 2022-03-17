import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownWidget extends StatelessWidget {
  final String? text;

  List<String> listOfValue = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  String? _selectedValue;
  final Function save;
  final Function validator;

  DropdownWidget(
      {Key? key, this.text, required this.save, required this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      value: _selectedValue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      isExpanded: true,
      hint: Text(
        text!,
        style: const TextStyle(fontSize: 14),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 50,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      items: listOfValue
          .map((val) => DropdownMenuItem<String>(
                value: val,
                child: Text(
                  val,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value as String?;
        });
      },
      // onSaved: (value) {
      //   setState(() {
      //     _selectedValue = value as String?;
      //   });
      // },
      // validator: (value) {

      //         },
    );
  }

  // int nextNumber({required int min, required int max}) =>
  //     Random().nextInt(max - min);

  void setState(Null Function() param0) {}
}
