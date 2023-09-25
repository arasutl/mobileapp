import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../widgets/CustomWidget.dart';
import '../controllers/gridviewhomecontroller.dart';
import 'package:flutter/material.dart';

class GridViewHome extends StatefulWidget {
  @override //
  _GridViewHomeState createState() => _GridViewHomeState();
}

class _GridViewHomeState extends State<GridViewHome> {
  final controller = Get.put(GridViewHomeController());
  var i = 0.obs;

  @override
  void initState() {
    super.initState();
    //controller.
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .7;
    // TODO: implement build
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        //width: mediaQuery.size.width,

        /// not need
        child: Column(
      children: [
        Expanded(
            flex: 70,
            child: controller.filedsnew.keys.length > 0
                ? GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.filedsnew.keys.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 4,
                        childAspectRatio: 2.4),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.filedsnew.keys.elementAt(index),
                              style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14),
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              controller.filedsnew.values.elementAt(index),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 4,
                        childAspectRatio: 2.4),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        //padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        //margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                //margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: ListTile(
                              //leading: CustomWidget.circular(height: 64, width: 64),
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomWidget.rectangular(
                                  height: 8,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                ),
                              ),
                              subtitle: CustomWidget.rectangular(height: 8),
                            ))
                          ],
                        ),
                      );
                    },
                  )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            flex: 5,
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                width: double.infinity,
                //padding: EdgeInsets.fromLTRB(30, 0, 30, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Reminders',
                                  maxLines: 2,
                                )))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            color: Colors.grey.shade100,
                            padding: EdgeInsets.all(1),
                            child: Align(
                                alignment: Alignment.center,
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                  child: Text(
                                      new Random().nextInt(7).toString() +
                                          ' Days Ago'),
                                  maxLines: 2,
                                )))),
                  ],
                ))),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            flex: 7,
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Center(
                    child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buttonGenerate(
                        'Initate ',
                        Colors.green,
                        Icon(
                          MdiIcons.arrowRight,
                          color: Colors.green,
                        )),
                    buttonGenerate(
                        'Submit',
                        Colors.deepOrangeAccent,
                        Icon(
                          MdiIcons.gestureTap,
                          color: Colors.deepOrangeAccent,
                        )),
                    buttonGenerate(
                        'Forward',
                        Colors.orange,
                        Icon(
                          MdiIcons.share,
                          color: Colors.orange,
                        )),
                    buttonGenerate(
                        'Complete',
                        Colors.purple,
                        Icon(
                          MdiIcons.check,
                          color: Colors.purple,
                        )),
                    buttonGenerate(
                        'Close',
                        Colors.red,
                        Icon(
                          MdiIcons.close,
                          color: Colors.red,
                        )),
                  ],
                ))))
      ],
    ));
  }

  buttonGenerate(String sname, Color clr, Icon icn) {
    return Container(
        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: clr),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                side: BorderSide(width: 2, color: clr)),
          ),
          onPressed: () => {},
          icon: icn,
          label: Text(
            sname,
            style: TextStyle(color: clr),
          ),
        ));
  }
}
