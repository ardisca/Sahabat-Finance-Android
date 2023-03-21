import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widget/Gradient.dart';
import 'package:lottie/lottie.dart';
import 'package:text_form_field_validator/text_form_field_validator.dart';
import 'package:finance/finance.dart';

class simulasiInvest extends StatefulWidget {
  simulasiInvest(this.tittle);
  var tittle;
  @override
  State<simulasiInvest> createState() => _simulasiInvestState();
}

class _simulasiInvestState extends State<simulasiInvest> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController bulananC = TextEditingController();
  TextEditingController waktuC = TextEditingController();
  TextEditingController raturnC = TextEditingController();
  TextEditingController uangAwalC = TextEditingController();

  String hasil = "Hasil 0";
  int PV = 0;
  var FV = 0;
  var n = 0;
  var r = 0;
  int pvs = 0;
  String fvv = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tittle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            header(widget.tittle),
            h2(),
            textf("Uang Awal", uangAwalC, "Juta"),
            textf("Rencana nabung perbulan", bulananC, "Juta"),
            textf("Jangka waktu", waktuC, "Tahun"),
            textf("Return Investasi", raturnC, "/Tahun"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        return setState(() {
                          //pv uang awal
                          // int K = 1 + r;
                          // int l = (n / 12).floor();
                          // for (var i = 0; i < n; i++) {
                          //   K = K * K;
                          // }
                          if (_formKey.currentState!.validate()) {
                            FV = int.parse(bulananC.text); //uang masuk bulanan
                            n = int.parse(waktuC.text); // estimasi dikali 12
                            r = int.parse(raturnC.text); // dibagi 12
                            pvs = int.parse(uangAwalC.text);
                            double rates = r / 100;

                            //FV = PV (1 + r) ^ n
                            //, FV adalah future value,
                            //PV adalah present value,
                            //r adalah nilai inflasi,
                            //dan n adalah waktu.
                            // print("Hasilnya nih");
                            // print(Finance.fv(
                            //     rate: rates / 12,
                            //     nper: n * 12,
                            //     pmt: -FV,
                            //     pv: pvs));
                            // PV = (FV / K).floor();
                            //hasil = "uang masuk bulanan $FV";
                            num kl = Finance.fv(
                                rate: rates / 12,
                                nper: n * 12,
                                pmt: -FV,
                                pv: pvs);
                            fvv = kl.toStringAsFixed(2);
                            double kk = double.parse(fvv) + pvs.toDouble();
                            hasil = "Hasil Investasi ${fvv}";
                            // print("Rate atas $rates");
                            // print("Rate bawah ${rates/12}");
                            // print("nper ${n*12}");
                            // print("nper ${n*12}");
                            //hasil = "uang masuk bulanan $FV";
                          }
                        });
                      },
                      child: Text(
                        "Hitung",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ))),
            ),
            hasiltext(hasil, "Juta"),
            kotakbawah("FV")
          ],
        ),
      ),
    );
  }
}

class kotakbawah extends StatelessWidget {
  kotakbawah(this.rumus);
  var rumus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rumus yang digunakan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  rumus,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )),
    );
  }
}

class hasiltext extends StatelessWidget {
  hasiltext(this.text, this.satuan);
  var text;
  var satuan;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Text(
          "${text} $satuan",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class textf extends StatelessWidget {
  textf(
    this.tittle,
    this.contro,
    this.satuan,
  );

  final String tittle;
  var contro;
  var satuan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              validator: (value) => FormValidator.validate(
                value,
                required: true,
                stringFormat: StringFormat.numbers,
              ),
              keyboardType: TextInputType.number,
              controller: contro,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: tittle,
              ),
            ),
          ),
          Container(width: 55, alignment: Alignment.center, child: Text(satuan))
        ],
      ),
    );
  }
}

class h2 extends StatelessWidget {
  const h2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: Text("Yuk, ceritain mimpimu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
        ],
      ),
    );
  }
}

class header extends StatelessWidget {
  header(this.tittle);
  var tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 175,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LGradient(),
        ),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(tittle,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 170,
                  child: Text(
                    "Mimpi emang kadang terasa impossible, sampe kita merencanakannya dan ubah jadi i’m possible.",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Container(
              height: 400,
              child: Lottie.asset(
                './assets/babigoyang.json',
              ),
            )
          ],
        ),
      ),
    );
  }
}
