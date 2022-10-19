import 'package:flutter/material.dart';

class DropDownCities extends StatelessWidget {
  final List itemsList;
  final Function(String?)? onChanged;
  final String? value;
  const DropDownCities({Key? key,required this.itemsList,required this.onChanged,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(textDirection: TextDirection.ltr, children: [
        Text('City'.toUpperCase(),
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ))
      ]),
      Container(
          height: 30,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            items: itemsList
                .map(
                  (country) => DropdownMenuItem<String>(
                value: country.id.toString(),
                child: Text(country.name.toString()),
              ),
            )
                .toList(),
            onChanged: onChanged,
            value: value,
            elevation: 2,
            isDense: false,
            iconSize: 40.0,
          ))
    ]);
  }
}
