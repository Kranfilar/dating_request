import 'package:dating_req/views/dating_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:status_alert/status_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _percent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15202D),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 240),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "¿ Qual o seu nível de humor hoje ?",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: 256,
                  lineHeight: 16,
                  barRadius: Radius.circular(128),
                  percent: _percent / 100,
                  backgroundColor: Color.fromARGB(75, 158, 158, 158),
                  progressColor: _percent <= 30
                      ? Colors.red
                      : _percent < 80
                          ? Colors.orange
                          : _percent == 100
                              ? Colors.green[800]
                              : Colors.green,
                ),
              ],
            ),
            SizedBox(
              width: 275,
              child: Slider(
                value: _percent,
                onChanged: (double value) {
                  setState(() {
                    _percent = value;
                  });
                },
                min: 0.0,
                max: 100,
                divisions: 100,
                label: '${(_percent).toInt()}%',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print((_percent / 100));
                if (_percent <= 30) {
                  StatusAlert.show(
                    context,
                    duration: Duration(seconds: 2),
                    title: 'Pena!',
                    subtitle: 'Deixa quieto, ou tente novamente mais tarde!',
                    configuration: IconConfiguration(icon: Icons.error_rounded),
                    maxWidth: 260,
                  );
                } else if (_percent < 80) {
                  StatusAlert.show(
                    context,
                    duration: Duration(seconds: 2),
                    title: 'Bom!!',
                    subtitle: 'Mas acho que podemos melhorar!',
                    configuration:
                        IconConfiguration(icon: Icons.warning_rounded),
                    maxWidth: 260,
                  );
                } else if (_percent == 100) {
                  StatusAlert.show(
                    context,
                    duration: Duration(seconds: 1),
                    title: 'Hmm...',
                    subtitle: 'Falsidade é feio viu?',
                    configuration:
                        IconConfiguration(icon: Icons.question_mark_rounded),
                    maxWidth: 260,
                  );
                } else {
                  StatusAlert.show(
                    context,
                    duration: Duration(seconds: 2),
                    title: 'BOA!!',
                    subtitle: 'Chegamos a um resultado melhor',
                    configuration: IconConfiguration(icon: Icons.done),
                    maxWidth: 260,
                  );
                  await Future.delayed(
                      Duration(seconds: 2, milliseconds: 500), () {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VariousButtons(5, 1),
                    ),
                  );
                }
              },
              child: Text("Seguir"),
            ),
          ],
        ),
      ),
    );
  }
}
