import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class tess extends StatefulWidget {
  const tess({super.key});

  @override
  State<tess> createState() => _tessState();
}

class _tessState extends State<tess> {
  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Email"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passC,
            autocorrect: false,
            obscureText: isHidden,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(
                    onPressed: () {
                      if (isHidden == true) {
                        isHidden = false;
                      } else {
                        isHidden = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(Icons.remove_red_eye)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Password"),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    "Selamat datang pengguna email ${emailC.text} dan password ${passC.text}");
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              )),
        ],
      ),
    );
  }
}
