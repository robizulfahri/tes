class LogoDivisiData {
  LogoDivisiData({
    this.imagePath = '',
    this.titleTxt = '',
  });

  String imagePath;
  String titleTxt;

  static List<LogoDivisiData> tabIconsList = <LogoDivisiData>[
    LogoDivisiData(
        imagePath: 'assets/images/logo_divisi_prog.png',
        titleTxt: 'Programming'),
    LogoDivisiData(
        imagePath: 'assets/images/logo_divisi_mmd.png',
        titleTxt: 'Multimedia\ndan Desain'),
    LogoDivisiData(
        imagePath: 'assets/images/logo_divisi_skj.png',
        titleTxt: 'Sistem Komputer\ndan Jaringan'),
  ];
}
