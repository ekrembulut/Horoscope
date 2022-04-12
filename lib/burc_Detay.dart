
import 'package:flutter/material.dart';
import 'package:horoscope_application_1/burc_listesi.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetaylari extends StatefulWidget {
  final Burclar yollanacakBurc;
  const BurcDetaylari({required this.yollanacakBurc, Key? key})
      : super(key: key);

  @override
  State<BurcDetaylari> createState() {
    return _BurcDetaylariState();
  }
}

class _BurcDetaylariState extends State<BurcDetaylari> {
  Color appBarColors = Colors.blue;
  Color bodyColors = Colors.amber;
  Color textColor = Colors.white;
  late PaletteGenerator _generator;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBarRenginiBul();
    WidgetsBinding.instance!
    .addPostFrameCallback((_) => appBarRenginiBul());
    // Bu yapı sayesinde widgetların üst üste binme karmaşasına karşı geliyor . Önce iskelet oluşturuluyor sonrasında ise init state fonksiyonu çalıştırılıyor...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bodyColors,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                expandedHeight: 250,
                backgroundColor: appBarColors,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    widget.yollanacakBurc.burcBuyukResim,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    widget.yollanacakBurc.burcAdi + " Burcunun Özellikleri",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.yollanacakBurc.burcGenelOzellik,
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage(widget.yollanacakBurc.burcBuyukResim));
    setState(() {
      appBarColors = _generator.dominantColor!.color;
      bodyColors = _generator.vibrantColor!.color;
    });
    print(appBarColors);
  }
}
