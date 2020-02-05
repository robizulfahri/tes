import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/appTheme.dart';
import 'package:neotelemetri_or11/main.dart';

class Tab2View extends StatefulWidget {
  @override
  State createState() => new Tab2ViewState();
}

class Tab2ViewState extends State<Tab2View>
    with TickerProviderStateMixin<Tab2View> {
  final double infoHeight = 164.0;
  AnimationController animationController;
  Animation<double> animation, delayedAnimation1;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  double opacity4 = 0.0;
  double opacity5 = 0.0;
  double opacity6 = 0.0;
  double opacity7 = 0.0;
  double opacity8 = 0.0;
  double opacity9 = 0.0;
  double opacity10 = 0.0;
  double opacity11 = 0.0;
  double opacity12 = 0.0;
  double opacity13 = 0.0;
  double opacity14 = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity4 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity5 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity6 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity7 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity8 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity9 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity10 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity11 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity12 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity13 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity14 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        280.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          color: AppTheme.nearlyWhite),
      padding: new EdgeInsets.only(bottom: 10.0, top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          constraints: BoxConstraints(
              minHeight: infoHeight,
              maxHeight: tempHeight > infoHeight ? tempHeight : infoHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedOpacity(
                      opacity: opacity2,
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        width: 200,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32, left: 8, right: 8, bottom: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        // color: Colors.amber,
                                        color: HexColor('#5D2A80')
                                            .withOpacity(0.6),
                                        offset: const Offset(1.1, 4.0),
                                        blurRadius: 8.0),
                                  ],
                                  gradient: LinearGradient(
                                    colors: <HexColor>[
                                      HexColor('#EB9AD7'),
                                      HexColor('#5D2A80'),
                                    ],
                                    // colors: [
                                    //   Colors.amberAccent,
                                    //   Colors.blueAccent
                                    // ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(54.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 54, left: 16, right: 16, bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Multimedia Interaktif',
                                        // divisiListData.titleTxt,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 0.2,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 8,
                              child: Container(
                                width: 94,
                                height: 94,
                                decoration: BoxDecoration(
                                  color: AppTheme.nearlyWhite.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 20,
                              child: SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.asset(
                                    'assets/images/logo_divisi_mmd.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedOpacity(
                        opacity: opacity1,
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '1810911033',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontSize: 15,
                                letterSpacing: 0.5,
                                color: AppTheme.darkText,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Hubungan Internasional',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontSize: 15,
                                letterSpacing: 0.15,
                                color: Color(0xff8051A0),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Matematika dan Ilmu Pengetahuan Alam',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontSize: 15,
                                letterSpacing: 0.15,
                                color: AppTheme.darkText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 18, bottom: 5),
                  child: Text(
                    'Hobi',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 23,
                      letterSpacing: 0.5,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity5,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 1, bottom: 8),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Travelling, futsal, bulutangkis, programing, menonton, domino.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 14,
                          letterSpacing: 0.27,
                          color: AppTheme.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity6,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 18, bottom: 5),
                  child: Text(
                    'Cita-Cita',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 23,
                      letterSpacing: 0.5,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity7,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 1, bottom: 8),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Pengusaha sukses, menjadi orang yg berguna.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 14,
                          letterSpacing: 0.27,
                          color: AppTheme.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity8,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 18, bottom: 5),
                  child: Text(
                    'Keahlian',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 23,
                      letterSpacing: 0.5,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity9,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 1, bottom: 8),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Ngoding.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 14,
                          letterSpacing: 0.27,
                          color: AppTheme.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity10,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 18, bottom: 5),
                  child: Text(
                    'Prestasi',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 23,
                      letterSpacing: 0.5,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity11,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 1, bottom: 8),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Juara 1 OSN tingkat kabupaten bidang Asronomi\nJuara 1 OSN tingkat sekolah bidang Astronomi\nSemifinalis Lomba Fisika (LF) Physics Festival Se-Indonesia\nSemifinalis Lomba Fisika  (LOFI) Se-Sumatera',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 14,
                          letterSpacing: 0.27,
                          color: AppTheme.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity12,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 18, bottom: 5),
                  child: Text(
                    'Riwayat Penyakit',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 23,
                      letterSpacing: 0.5,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity13,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 26, right: 26, top: 1, bottom: 8),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Infeksi saluran pencernaan.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 14,
                          letterSpacing: 0.27,
                          color: AppTheme.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBoxUI(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color(0xffEB9AD7), Color(0xffBF63A8)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.dark_grey.withOpacity(0.3),
                offset: const Offset(0.0, -5.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontSize: 14,
                    letterSpacing: 0.27,
                    color: AppTheme.nearlyWhite),
              ),
              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSansBoldItalic',
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.nearlyBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
