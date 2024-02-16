import 'package:flutter/material.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class Dropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;
const Dropdown({super.key,
required this.onChanged
});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
List<String> profession=['Engineering','Buissiness','Vendor','Salesman'];
 String? _selecteditem;

//  String get selectprofession =>_selecteditem;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1,color: Colors.grey)),
      width: 200,
      height: 50,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            hint: const Text('Profession'),
                value:_selecteditem,
                elevation: 4,
                dropdownColor: Colors.grey[100],
                style: acmestyle,
                items: profession.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value));
              }).toList(),
               onChanged:(value) {
                print('this is dropdown inside $value');
                 setState(() {
                   _selecteditem=value!;
                 });
               },),
        ),
      ),
    );
  }
}