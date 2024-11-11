import 'package:flutter/material.dart';
import 'package:jokerge/models/const.dart';

Color colorByStatus(String status) {
  switch (status) {
    case orderStatusActive:
      return const Color(0xFF16a34a);
    case orderStatusCanceled:
      return const Color(0xFFbe123c);
    case orderStatusCompleted:
      return const Color(0xFF1d4ed8);
    default:
      return Colors.black;
  }
}
