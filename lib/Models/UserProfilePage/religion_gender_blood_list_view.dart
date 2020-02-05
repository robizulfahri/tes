import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/religion_gender_blood_list_data.dart';
import 'package:neotelemetri_or11/appTheme.dart';
import 'package:neotelemetri_or11/main.dart';

class ReligionGenderBloodListView extends StatefulWidget {
  @override
  _ReligionGenderBloodListViewState createState() =>
      _ReligionGenderBloodListViewState();
}

class _ReligionGenderBloodListViewState
    extends State<ReligionGenderBloodListView> with TickerProviderStateMixin {
  List<ReligionGenderBloodListData> religionGenderBloodListData =
      ReligionGenderBloodListData.tabIconsList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
        itemCount: religionGenderBloodListData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final int count = religionGenderBloodListData.length > 10
              ? 10
              : religionGenderBloodListData.length;

          return ReligionGenderBloodView(
            religionGenderBloodListData: religionGenderBloodListData[index],
          );
        },
      ),
    );
  }
}

class ReligionGenderBloodView extends StatelessWidget {
  const ReligionGenderBloodView({
    Key key,
    this.religionGenderBloodListData,
  }) : super(key: key);

  final ReligionGenderBloodListData religionGenderBloodListData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: HexColor(religionGenderBloodListData.endColor)
                          .withOpacity(0.6),
                      offset: const Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
                gradient: LinearGradient(
                  colors: <HexColor>[
                    HexColor(religionGenderBloodListData.startColor),
                    HexColor(religionGenderBloodListData.endColor),
                  ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      religionGenderBloodListData.titleTxt,
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
            left: 0,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 8,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(religionGenderBloodListData.imagePath),
            ),
          )
        ],
      ),
    );
  }
}
