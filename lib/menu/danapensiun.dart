import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widget/Gradient.dart';
import 'package:lottie/lottie.dart';
import 'package:text_form_field_validator/text_form_field_validator.dart';
import 'package:finance/finance.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:io';

class danapensiun extends StatefulWidget {
  danapensiun(this.tittle);
  var tittle;

  @override
  State<danapensiun> createState() => _danapensiunState();
}

class _danapensiunState extends State<danapensiun> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController umurAwal = TextEditingController();
  TextEditingController pBulanan = TextEditingController();
  TextEditingController umurAkhir = TextEditingController();
  TextEditingController returnInvest = TextEditingController();
  TextEditingController tabungan = TextEditingController();

  var jrkPensiun;
  var inflasi;
  double? pengeluaranthnanPensiun;
  var danaPensiunButuh;
  var rencInvestasiBln;
  var rencInvestasiThn;
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
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              header(widget.tittle),
              h2("Yuk, Rencanain Pensiunnya"),
              textf("Pengeluaran Bulanan", pBulanan, "Juta"),
              textf("Umur Sekarang", umurAwal, "Tahun"),
              textf("Umur Pensiun", umurAkhir, "Tahun"),
              textf("Target Return Investasi", returnInvest, "%"),
              textf("Dana Tabungan", tabungan, "Juta"),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              jrkPensiun = int.parse(umurAkhir.text) -
                                  int.parse(umurAwal.text);
                              inflasi = 0.04;

                              double pertahunSblmP =
                                  double.parse(pBulanan.text) * 12;

                              //var c = Power((1 + inflasi), jrkPensiun); //
                              //pangkat((1 + inflasi), jrkPensiun);
                              double angka = (1 + inflasi).toDouble();
                              int pangkat = jrkPensiun;
                              // double angka = 2;
                              // int pangkat = 3;
                              double sum = angka;
                              try {
                                for (var i = 1; i < pangkat; i++) {
                                  //print(i);
                                  sum = sum * angka;
                                  //print("Hasil $sum");
                                }
                              } catch (e) {
                                print(e);
                              }

                              double c = sum;
                              //print(c);
                              pengeluaranthnanPensiun = pertahunSblmP * c;

                              String inString =
                                  pengeluaranthnanPensiun.toString();
                              double inisial = double.parse(inString);
                              String s = inisial.toStringAsFixed(3);
                              pengeluaranthnanPensiun = double.parse(s);

                              double rt = double.parse(returnInvest.text) / 100;
                              //print(pengeluaranthnanPensiun);
                              danaPensiunButuh =
                                  (pengeluaranthnanPensiun! / inflasi).floor();
                              String dpb = danaPensiunButuh.toStringAsFixed(3);
                              danaPensiunButuh = double.parse(dpb);
                              rencInvestasiThn = Finance.pmt(
                                  rate: rt,
                                  nper: jrkPensiun,
                                  pv: double.parse(tabungan.text),
                                  fv: -danaPensiunButuh); //pmv
                              String RTT = rencInvestasiThn.toStringAsFixed(3);
                              rencInvestasiThn = double.parse(RTT);

                              rencInvestasiBln = rencInvestasiThn / 12;
                              String RTB = rencInvestasiBln.toStringAsFixed(2);
                              rencInvestasiBln = double.parse(RTB);
                            }
                          });
                        },
                        child: Text("Hitung"))),
              ),
              hasiltext("Jarak Pensiun", "${jrkPensiun ?? "0"} Tahun"),
              hasiltext("Inflasi", "4% (Mengacu 4% rule)"),
              hasiltext("Pengeluaran Tahunan (Pensiun)",
                  "Rp. ${pengeluaranthnanPensiun ?? "0"} Juta"),
              hasiltext("Dana Pensiun yang Dibutuhkan",
                  "Rp. ${danaPensiunButuh ?? "0"} Juta"),
              hasiltext("Rencana Investasi Tiap Tahun",
                  "Rp. ${rencInvestasiThn ?? "0"} Juta"),
              hasiltext("Rencana Investasi Tiap Bulan",
                  "Rp. ${rencInvestasiBln ?? "0"} Juta"),
              kotakbawah("PMT")
            ],
          )),
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
                      fontSize: 20,
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
  textf(this.tittle, this.contro, this.satuan);
  var tittle;
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
  h2(this.title);
  var title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
        ],
      ),
    );
  }
}

class header extends StatelessWidget {
  header(
    this.tittle,
  );

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
