
import 'package:flutter/material.dart';
import 'package:horoscope_application_1/burc_Item.dart';
import 'package:horoscope_application_1/strings.dart';

class BurcListesi extends StatelessWidget {
  List<Burclar> burcVerileri = veriKaynagiHazila();
  BurcListesi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Burç Listesi"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItems(listelenecekBurclar: burcVerileri[index]);
          },
          itemCount: burcVerileri.length,
        ));
  }
}

List<Burclar> veriKaynagiHazila() {
  List<Burclar> gecici = [];
  for (int i = 0; i < 12; i++) {
    String ad = Strings.BURC_ADLARI[i];
    String tarih = Strings.BURC_TARIHLERI[i];
    String general = Strings.BURC_GENEL_OZELLIKLERI[i];
    // Koc => koc1
    String kucuk = ad.toLowerCase() + "${i + 1}";
    String buyuk = ad.toLowerCase() + "_buyuk${i + 1}";
    Burclar eklenecekBurc = Burclar(ad, tarih, general, "images/$kucuk.png", "images/$buyuk.png");
    gecici.add(eklenecekBurc);
  }
  return gecici;
}

class Burclar {
  final String burcAdi;
  final String burcTarih;
  final String burcGenelOzellik;
  final String burcKucukResim;
  final String burcBuyukResim;

  Burclar(this.burcAdi, this.burcTarih, this.burcGenelOzellik,
      this.burcKucukResim, this.burcBuyukResim);
  @override
  String toString() {
    // TODO: implement toString
    return "Burç adı $burcAdi ";
  }
}
