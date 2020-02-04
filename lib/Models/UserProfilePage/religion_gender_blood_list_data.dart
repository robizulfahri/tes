class ReligionGenderBloodListData {
  ReligionGenderBloodListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;

  static List<ReligionGenderBloodListData> tabIconsList =
      <ReligionGenderBloodListData>[
    ReligionGenderBloodListData(
      imagePath: 'assets/images/agama_islam.png',
      titleTxt: 'Religion           ',
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    ReligionGenderBloodListData(
      imagePath: 'assets/images/jk_male.png',
      titleTxt: 'Gender             ',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    ReligionGenderBloodListData(
      imagePath: 'assets/images/gd_b.png',
      titleTxt: 'Blood Type         ',
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
  ];
}
