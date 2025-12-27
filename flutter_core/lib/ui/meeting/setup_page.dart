import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter/material.dart';

import '../widgets/dyte_call_bottom_bar.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Loading completed, setup page"),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.green,
              child: const Text("Join Room"),
              onPressed: () {
                realtimekitClient.joinRoom();
              },
            )
          ],
        ),
      ),
    );
  }
}

class DyteMeetingRoom extends StatelessWidget {
  const DyteMeetingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: DyteCallBottomBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Meeting Room"),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: SizedBox(
                height: 250,
                width: 250,
                child: VideoView(isSelfParticipant: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExceptionPage extends StatelessWidget {
  const ExceptionPage(this.exception, {super.key});
  final Exception exception;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(exception.toString()),
    ));
  }
}
