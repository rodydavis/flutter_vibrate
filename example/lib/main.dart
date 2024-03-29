import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  final Iterable<Duration> pattern = [
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 300),

    const Duration(milliseconds: 100),
    const Duration(milliseconds: 50),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 50),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 300),

    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 300),

    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 100),
  ];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? debugPrint('This device can vibrate')
          : debugPrint('This device cannot vibrate');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Haptic Feedback Example')),
        body: Center(
          child: ListView(children: [
            ListTile(
              title: const Text('Vibrate'),
              leading: const Icon(Icons.vibration, color: Colors.teal),
              onTap: () {
                if (_canVibrate) Vibrate.vibrate;
              },
            ),
            ListTile(
              title: const Text('Vibrate with Pauses'),
              leading: const Icon(Icons.vibration, color: Colors.brown),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.vibrateWithPauses(pauses);
                }
              },
            ),
            ListTile(
              title: const Text('Vibrate with Pattern'),
              leading: const Icon(Icons.vibration, color: Colors.green),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.vibrateWithPattern(pattern);
                }
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text('Impact'),
              leading: const Icon(Icons.tap_and_play, color: Colors.orange),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.impact);
                }
              },
            ),
            ListTile(
              title: const Text('Selection'),
              leading: const Icon(Icons.select_all, color: Colors.blue),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.selection);
                }
              },
            ),
            ListTile(
              title: const Text('Success'),
              leading: const Icon(Icons.check, color: Colors.green),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.success);
                }
              },
            ),
            ListTile(
              title: const Text('Warning'),
              leading: const Icon(Icons.warning, color: Colors.red),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.warning);
                }
              },
            ),
            ListTile(
              title: const Text('Error'),
              leading: const Icon(Icons.error, color: Colors.red),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.error);
                }
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text('Heavy'),
              leading:
                  const Icon(Icons.notification_important, color: Colors.red),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.heavy);
                }
              },
            ),
            ListTile(
              title: const Text('Medium'),
              leading:
                  const Icon(Icons.notification_important, color: Colors.green),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.medium);
                }
              },
            ),
            ListTile(
              title: const Text('Light'),
              leading:
                  Icon(Icons.notification_important, color: Colors.yellow[700]),
              onTap: () {
                if (_canVibrate) {
                  Vibrate.feedback(FeedbackType.light);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
