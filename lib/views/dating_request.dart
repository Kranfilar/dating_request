import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:status_alert/status_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            child: VariousButtons(5, 1),
          ),
        ),
      ),
    ),
  );
}

class VariousButtons extends StatefulWidget {
  final int numberOfNoButtons;
  final int numberOfYesButtons;

  const VariousButtons(this.numberOfNoButtons, this.numberOfYesButtons);

  @override
  State<VariousButtons> createState() => _VariousButtonsState();
}

class _VariousButtonsState extends State<VariousButtons> {
  final _nots = <NotData>[];
  final _yes = <NotData>[];

  @override
  void initState() {
    super.initState();
    _makeNots();
    _makeYes();
  }

  void _makeNots() {
    _nots.clear();
    for (int i = 0; i < widget.numberOfNoButtons; i++) {
      _nots.add(NotData());
    }
  }

  void _makeYes() {
    _yes.clear();
    for (int i = 0; i < widget.numberOfYesButtons; i++) {
      _yes.add(NotData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15202D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '¿ Quer namorar comigo ?',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              for (final not in _yes)
                AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: not.alignment,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      child: ElevatedButton(
                        onPressed: () {
                          StatusAlert.show(
                            context,
                            duration: Duration(seconds: 2),
                            title: 'Hmm',
                            subtitle: 'Que Gay Isso aqui!!',
                            configuration: IconConfiguration(icon: Icons.adb),
                            maxWidth: 260,
                          );
                        },
                        child: Text("Sim"),
                      ),
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 24,
                      width: 128,
                    ),
                  ),
                ),
              for (final not in _nots)
                AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: not.alignment,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          _makeNots();
                          _makeYes();
                        }),
                        child: Text("Não"),
                      ),
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: not.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 24,
                      width: 128,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
