import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widget/Gradient.dart';
import 'package:lottie/lottie.dart';
import 'package:text_form_field_validator/text_form_field_validator.dart';
import 'package:finance/finance.dart';

class dandarurat extends StatefulWidget {
  dandarurat(this.tittle);
  String tittle;

  @override
  State<dandarurat> createState() => _dandaruratState();
}

class _dandaruratState extends State<dandarurat> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pengeluaranBulanan = TextEditingController();
  TextEditingController jumlahIstri = TextEditingController();
  TextEditingController jumlahAnak = TextEditingController();
  TextEditingController tanggungan = TextEditingController();

  int hasil = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            header(tittle: widget.tittle),
            h2(),
            textf("Pengeluaran Bulanan", pengeluaranBulanan, "Juta"),
            textf("Jumlah Pasangan", jumlahIstri, "Orang"),
            textf("Jumlah Anak", jumlahAnak, "Orang"),
            textf("Tanggungan lain", tanggungan, "Orang"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      return setState(() {
                        if (_formKey.currentState!.validate()) {
                          int B = int.parse(pengeluaranBulanan.text);
                          int A = int.parse(jumlahAnak.text);
                          int I = int.parse(jumlahIstri.text);
                          int T = int.parse(tanggungan.text);

                          if (A < 0 && I < 0 && T < 0) {
                          } else {
                            int total = A + I + T + 1;
                            int totalB = total * B * 3;
                            hasil = totalB;
                          }
                        }
                      });
                    },
                    child: Text(
                      "Hitung",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            hasiltext("Dana Darurat yang Dibutuhkan", "Rp. ${hasil} Juta"),
            kotakbawah()
          ],
        ),
      ),
    );
  }
}

class kotakbawah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          alignment: Alignment.center,
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
                  "Jumlah Keluarga dan Tanggungan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "dikali 3 bulan",
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
  hasiltext(this.text, this.hasil);
  var text;
  var hasil;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Text(
          "${text} : ${hasil}",
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
            child: Text("Yuk, rencanakan mimpimu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
        ],
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    super.key,
    required this.tittle,
  });

  final String tittle;

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
