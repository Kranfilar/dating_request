import 'dart:math';
import 'package:dating_req/views/dating_request.dart';
import 'package:dating_req/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotData {
  static final _rng = Random();

  final double size;
  final Color color;
  final Alignment alignment;

  NotData()
      : size = _rng.nextDouble() * 10 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

class YesData {
  static final _rng = Random();

  final double size;
  final Color color;
  final Alignment alignment;

  YesData()
      : size = _rng.nextDouble() * 40 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xFF15202D),
          child: const SizedBox.expand(
            child: HomePage(),
          ),
        ),
      ),
    ),
  );
}
