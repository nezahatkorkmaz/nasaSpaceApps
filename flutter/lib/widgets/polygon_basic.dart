import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Polygon polygonBasic(
    {required title, required points, color = Colors.greenAccent, ontap}) {
  return Polygon(
    onTap: ontap,
    consumeTapEvents: true,
    polygonId: PolygonId(title),
    points: points,
    strokeWidth: 1,
    strokeColor: Colors.black.withOpacity(0.4),
    fillColor: color.withOpacity(0.5),
  );
}
