import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './Gradient.dart';
import '../menu/simulasiInvest.dart';

class menuHidup extends StatelessWidget {
  menuHidup(this.tittleFirst, this.tittleLast, this.laman, this.icon);
  var tittleFirst;
  var tittleLast;
  var laman;
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
            gradient: LGradient(),
          ),
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => laman,
                  )),
              child: icon),
        ),
        SizedBox(
          height: 10,
        ),
        Text(tittleFirst),
        Text(tittleLast),
      ],
    );
  }
}
