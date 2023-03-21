import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class menuMati extends StatelessWidget {
  menuMati(this.tittle, this.icon);
  var tittle;
  var icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              icon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(tittle)
      ],
    );
  }
}
