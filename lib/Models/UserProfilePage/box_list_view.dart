import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/box_list_data.dart';
import 'package:neotelemetri_or11/appTheme.dart';
import 'package:neotelemetri_or11/main.dart';

class BoxListView extends StatefulWidget {
  @override
  _BoxListViewState createState() => _BoxListViewState();
}

class _BoxListViewState extends State<BoxListView>
    with TickerProviderStateMixin {
  List<BoxListData> boxListData = BoxListData.tabIconsList;

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
      height: 190,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
        itemCount: boxListData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final int count = boxListData.length > 10 ? 10 : boxListData.length;

          return BoxView(
            boxListData: boxListData[index],
          );
        },
      ),
    );
  }
}

class BoxView extends StatelessWidget {
  const BoxView({
    Key key,
    this.boxListData,
  }) : super(key: key);

  final BoxListData boxListData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: HexColor(boxListData.endColor).withOpacity(0.6),
                      offset: const Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
                gradient: LinearGradient(
                  colors: <HexColor>[
                    HexColor(boxListData.startColor),
                    HexColor(boxListData.endColor),
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
                      boxListData.titleTxt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: AppTheme.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          boxListData.detailTxt,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: 0.2,
                            color: AppTheme.white,
                          ),
                        ),
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
        ],
      ),
    );
  }
}
