import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'bar_chats_model.dart';

class modebottomsheet extends StatefulWidget {


  @override
  State<modebottomsheet> createState() => _modebottomsheetState();
}

class _modebottomsheetState extends State<modebottomsheet> {

  final List<BarChartsModel> data = [
    BarChartsModel(
      year: "2014",
      finacial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blue)
    ),
    BarChartsModel(
        year: "2014",
        finacial: 300,
        color: charts.ColorUtil.fromDartColor(Colors.red)

    ),
    BarChartsModel(
        year: "2015",
        finacial: 100,
        color: charts.ColorUtil.fromDartColor(Colors.green)

    ),
    BarChartsModel(
        year: "2016",
        finacial: 450,
        color: charts.ColorUtil.fromDartColor(Colors.purple)

    ),
    BarChartsModel(
        year: "2017",
        finacial: 290,
        color: charts.ColorUtil.fromDartColor(Colors.grey)

    ),
    BarChartsModel(
        year: "2018",
        finacial: 630,
        color: charts.ColorUtil.fromDartColor(Colors.indigo)

    ),
    BarChartsModel(
        year: "2019",
        finacial: 950,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent)
    ),
    BarChartsModel(
        year: "2020",
        finacial: 400,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent)
    ),



  ];


  int currentindex = 0;
  int _value = 6;
  @override
  Widget build(BuildContext context) {

    List<charts.Series<BarChartsModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartsModel series, _) => series.year,
        measureFn: (BarChartsModel series, _) => series.finacial,
        colorFn: (BarChartsModel series, _) => series.color,
      ),
    ];

    return Scaffold(

      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black26,
        selectedIndex: currentindex,
        onItemSelected: (index){
          setState(() {
            currentindex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            activeColor: Colors.blue,
            inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.call),
              title: Text("Call"),
              activeColor: Colors.blue,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text("apps"),
              activeColor: Colors.blue,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text("setting"),
              activeColor: Colors.blue,
              inactiveColor: Colors.black
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView
          (
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [

            Container(
              margin: EdgeInsets.all(10),
              child: Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.volume_up,
                      size: 40,
                    ),
                    new Expanded(
                        child: Slider(
                            value: _value.toDouble(),
                            min: 1.0,
                            max: 20.0,
                            divisions: 10,
                            activeColor: Colors.green,
                            inactiveColor: Colors.orange,
                            label: 'Set volume value',
                            onChanged: (double newValue) {
                              setState(() {
                                _value = newValue.round();
                              });
                            },
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()} dollars';
                            }
                        )
                    ),
                  ]
              )
          ),
            ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: charts.BarChart(
                    series,
                    animate: true,
                  ),
                ),
        ],
            ),
          ),
        ),
      ),
    );
  }
}
