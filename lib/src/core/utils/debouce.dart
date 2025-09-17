// IMPLEMENTACION DEL DEBOUNCE, UTIL PARA EVITAR MULTIPLES
//LLAMADAS RAPIDAS EN EL BUSCADO

import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  Debounce({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
