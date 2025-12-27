import 'package:flutter/material.dart';
import 'package:flutter_uikit/meeting_config.dart';
import 'package:realtimekit_ui/realtimekit_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
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
              MaterialPageRoute(
                builder: (context) {
                  final uiKitInfo = RealtimeKitUIInfo(
                    RtkMeetingInfo(authToken: MeetingConfig.authToken),
                  );
                  final uiKit = RealtimeKitUIBuilder.build(
                    uiKitInfo: uiKitInfo,
                  );
                  return RtkMeetingPage(uiKit);
                },
              ),
            );
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

class RtkMeetingPage extends StatefulWidget {
  const RtkMeetingPage(this.uikit, {super.key});
  final Widget uikit;

  @override
  State<RtkMeetingPage> createState() => _RtkMeetingPageState();
}

class _RtkMeetingPageState extends State<RtkMeetingPage> {
  @override
  Widget build(BuildContext context) {
    return widget.uikit;
  }
}
