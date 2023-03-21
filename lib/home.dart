import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './widget/Gradient.dart';
import './widget/menuMati.dart';
import './widget/menuHidup.dart';
import './menu/simulasiInvest.dart';
import 'package:lottie/lottie.dart';
import 'menu/danadarurat.dart';
import 'menu/danapensiun.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
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
                            Text("HI, Aku",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white)),
                            Text("Sahabat Finance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 170,
                              child: Text(
                                "Di sini kamu dapat merencanakan masa depan kamu",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                maxLines: 3,
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
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        height: 75,
                        child: Text('''Pingin
Mewujudkan Apa?''',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        menuHidup(
                            "Simulasi",
                            "Investasi",
                            simulasiInvest("Simulasi Investasi"),
                            ImageIcon(AssetImage('./assets/kinvest.png'),
                                size: double.infinity)),
                        menuHidup(
                            "Dana",
                            "Darurat",
                            dandarurat("Dana Darurat"),
                            ImageIcon(AssetImage('./assets/ddarurat.png'),
                                size: double.infinity)),
                        menuHidup(
                            "Dana",
                            "Pensiun",
                            danapensiun("Dana Pensiun"),
                            ImageIcon(AssetImage('./assets/pension.png'),
                                size: double.infinity)),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        height: 50,
                        child: Text("Segera Hadir",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        menuMati("KPR", './assets/kpr.png'),
                        menuMati("Kendaraan", './assets/car.png'),
                        menuMati("Pendidikan", './assets/study.png'),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        menuMati("Saham", './assets/stock.png'),
                        menuMati("Crypto", './assets/crypto.png'),
                        menuMati("Liburan", './assets/holidays.png'),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
