import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_application_1/burc_Detay.dart';
import 'package:horoscope_application_1/burc_listesi.dart';

class BurcItems extends StatelessWidget {
  final Burclar listelenecekBurclar;
  const BurcItems({required this.listelenecekBurclar, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/burcDetay" , arguments: listelenecekBurclar);
          },
          leading: Image.asset(
            listelenecekBurclar.burcKucukResim,
            fit: BoxFit.cover,
          ),
          title: Text(
            listelenecekBurclar.burcAdi,
            style: myTextStyle.headline5,
          ),
          subtitle: Text(
            listelenecekBurclar.burcTarih,
            style: myTextStyle.subtitle1,
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
