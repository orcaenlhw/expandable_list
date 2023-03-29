
import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:expandable_list/listview_activity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // home: ListViewActivity(title: 'EmailPageList'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable Demo"),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            _settingCard()
          ],
        ),
      ),
    );
  }
}



  Widget _settingCard() {
    return Container(
        padding:
            const EdgeInsets.only(left: 25, bottom: 10, top: 10, right: 25),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: Text(
                'Setting',
                // style: AppStyles.getTextStyle(
                //   fontSize: AppConstants.fontSize22,
                //   fontWeight: FontWeight.w800,
                // ),
              ),
            ),
          ),
          Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: SizedBox(
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  _buildItemRow('Personal Information', 'profile'),
                  _buildDivider(),
                  _buildItemRow('English', 'recent'),
                  _buildDivider(),
                  _expandable()
                ]),
              )),
        ]));
  }

  Widget _expandable() {

    buildCollapsed3() {
      return Container();
    }

    buildExpanded3() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildItemRow('Privacy Policy', 'profile'),
            _buildDivider(),
            _buildItemRow('Help and Support', 'recent'),
            _buildDivider(),
            _buildItemRow('About Atkhayar Zaynar', 'profile'),
            _buildDivider(),
          ],
      );
    }

    return ExpandableNotifier(
      child: ScrollOnExpand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: buildCollapsed3(),
                expanded: buildExpanded3(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true)!;
                      return TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(controller.expanded ? "Show less" : "Show more",),
                            Icon(controller.expanded ? Icons.expand_less : Icons.expand_more), 
                          ],
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        // ),
      ),
    // )
    );
  }

  Widget _buildItemRow(String text, String flag) {
    return InkWell(
        onTap: () {
          switch (flag) {
            case 'about':
              // Navigator.pushNamed(context, About.id);
              break;
            case 'recent':
              // Navigator.pushNamed(context, RecentViewed.id, arguments: RouteConfig(data: {'userID': userID}));
              break;
            case 'profile':
              // Navigator.pushNamed(context, ViewProfile.id).then((_) {_loadName();});
              break;
            case 'help':
              // Navigator.pushNamed(context, AddCategoryScreen.id,arguments: RouteConfig(data: {'name': 'Testing'}));
              break;
            case 'language':
              // showAlertDialog();
              break;
          }
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
              // child: Image.asset(
              //   imgPath,
              //   width: 24.0,
              //   height: 24.0,
              // ),
            ),
            Expanded(
              child: Text(
                text,
                // style: AppStyles.getTextStyle(
                //   fontSize: AppConstants.fontSize18,
                //   fontWeight: FontWeight.w400,
                // ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Icon(
                Icons.chevron_right,
              ),
            ),
          ],
        ));
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Divider(
          // color: Color(0xFFBDBDBD),
          ),
    );
  }

