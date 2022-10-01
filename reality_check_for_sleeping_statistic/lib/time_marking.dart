import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io';

MarkerPointer dateTime_to_Marker(DateTime now, double majorMarkerlength) {
  double angle = now.hour.toDouble();
  angle = angle + (now.minute / 60).toDouble();
  double depth = now.second / 60;


  MarkerPointer marker = MarkerPointer(
    value: angle,
    markerHeight: 8,
    markerWidth: 8,
    offsetUnit: GaugeSizeUnit.factor,
    markerOffset: depth * majorMarkerlength,
    markerType: MarkerType.circle,
    color: const Color.fromARGB(255, 79, 233, 143),
  );

  return marker;
}
