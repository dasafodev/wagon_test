import 'package:flutter/material.dart';

enum ServiceState {
  active(color: Colors.greenAccent),
  inactive(color: Colors.redAccent),
  finished(color: Colors.blueAccent);

  final Color color;

  const ServiceState({required this.color});
}
