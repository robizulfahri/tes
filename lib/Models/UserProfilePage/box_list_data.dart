class BoxListData {
  BoxListData({
    this.titleTxt = '',
    this.detailTxt = '',
    this.startColor = '',
    this.endColor = '',
  });

  String titleTxt;
  String detailTxt;
  String startColor;
  String endColor;

  static List<BoxListData> tabIconsList = <BoxListData>[
    BoxListData(
      titleTxt: 'Daerah Asal',
      detailTxt: 'Padang',
      endColor: '#5D2A80',
      startColor: '#EB9AD7',
      // startColor: '#FA7D82',
      // endColor: '#FFB295',
    ),
    BoxListData(
      titleTxt: 'Sekolah Asal',
      detailTxt: 'SMA Negeri 1 Padang',
      startColor: '#EB9AD7',
      endColor: '#5D2A80',
      // startColor: '#738AE6',
      // endColor: '#5C5EDD',
    ),
    BoxListData(
      titleTxt: 'TTL',
      detailTxt: 'Bogor, 18 November 2000',
      // startColor: '#FE95B6',
      // endColor: '#FF5287',
      startColor: '#EB9AD7',
      endColor: '#5D2A80',
    ),
  ];
}
