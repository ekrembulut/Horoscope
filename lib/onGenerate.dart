import 'dart:js';

import 'package:flutter/material.dart';
import 'package:horoscope_application_1/burc_Detay.dart';
import 'package:horoscope_application_1/burc_listesi.dart';

class OnGenerator {
  static Route<dynamic>? horoscopeRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => BurcListesi());
      case "/burcDetay" :
        var BurcDetayim = settings.arguments as Burclar;
         return MaterialPageRoute(builder: (context)=> BurcDetaylari(yollanacakBurc: BurcDetayim));
      default:
    }
  }
}
