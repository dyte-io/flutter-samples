import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uikit/meeting_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                final DyteUIKitInfo uiKitInfo = DyteUIKitInfo(
                  DyteMeetingInfoV2(
                    authToken: MeetingConfig.authToken,
                  ),
                );
                final uiKit = DyteUIKitBuilder.build(uiKitInfo: uiKitInfo);
                return DyteMeetingPage(uiKit);
              }),
            );
            // DyteUIKit.loadUI();
          },
          child: const Text(
            "Load UIKit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DyteMeetingPage extends StatefulWidget {
  const DyteMeetingPage(this.uikit, {super.key});
  final Widget uikit;

  @override
  State<DyteMeetingPage> createState() => _DyteMeetingPageState();
}

class _DyteMeetingPageState extends State<DyteMeetingPage> {
  @override
  Widget build(BuildContext context) {
    return widget.uikit;
  }
}
