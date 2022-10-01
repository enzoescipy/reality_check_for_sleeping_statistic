//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
//import 'dart:io';
//import 'package:intl/intl.dart';

//import 'time_marking.dart' as timeMarking;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  double pointerVal = 0; 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              axisLineStyle: AxisLineStyle(
                  thickness: 0.2, thicknessUnit: GaugeSizeUnit.factor),
              showTicks: false,
              showLabels: true,
              pointers: <GaugePointer>[
                RangePointer(
                    value: pointerVal,
                    onValueChanged: onPointerValueChanged,
                    enableDragging: true,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Row(
                      children: <Widget>[
                        Text(
                          '$_annotationValue',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00A8B5)),
                        ),
                        Text(
                          ' %',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00A8B5)),
                        )
                      ],
                    ),
                    positionFactor: 0.13,
                    angle: 0)
              ])
        ]),
      ),
    );
  }

  void onPointerValueChanged(double value) {
    setState(() {
      final int _value = value.toInt();
      _annotationValue = '$_value';
    });
  }

  String _annotationValue = '60';
}

/*

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List timeStamps = [];
  List sleepDuraPairs = [];

  // for debug, put MarkerPointers in this list before execution.
  List<MarkerPointer> timeMarkers = <MarkerPointer>[
    MarkerPointer(
      value: 5,
      markerHeight: 16,
      markerWidth: 10,
      offsetUnit: GaugeSizeUnit.factor,
      markerOffset: 0.1,
      markerType: MarkerType.triangle,
      elevation: 4,
      enableDragging: true,
      enableAnimation: true,
      color: Color.fromARGB(255, 83, 144, 223),
    ), 

    MarkerPointer(
      value: 7,
      markerHeight: 8,
      markerWidth: 8,
      offsetUnit: GaugeSizeUnit.factor,
      markerOffset: 0.1,
      markerType: MarkerType.circle,
      color: Color.fromARGB(255, 83, 223, 155),
    )
  ];

  String annotation_str = "--";

  void _timeStamping() async {
    DateTime now = DateTime.now();
    timeStamps.add(now);
    setState(() {
      MarkerPointer point = timeMarking.dateTime_to_Marker(now, 0.2);
      timeMarkers.add(point);
      annotation_str = DateFormat('MM/dd hh:mm:ss').format(now);
    });

    for (int i = 0; i < timeMarkers.length; i++) {
      print(timeMarkers[i].value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 24,
            startAngle: 270,
            endAngle: 270,
            showLastLabel: true,
            showFirstLabel: false,
            showAxisLine: false,
            axisLabelStyle: const GaugeTextStyle(fontSize: 20),
            majorTickStyle: const MajorTickStyle(
              lengthUnit: GaugeSizeUnit.factor,
              length: 0.2,
              color: Colors.grey,
            ),
            minorTickStyle: const MinorTickStyle(
              lengthUnit: GaugeSizeUnit.factor,
              length: 0.1,
              color: Color.fromARGB(141, 158, 158, 158),
            ),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text(annotation_str,
                      style: const TextStyle(fontSize: 20)))
            ],
            pointers: timeMarkers,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _timeStamping,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/