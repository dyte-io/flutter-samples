import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/constants/colors.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_core/di/providers.dart';
import 'package:flutter_core/models/meeting_details.dart';
import 'package:flutter_core/models/participant_details.dart';
import 'package:flutter_core/notifiers/states/router_states.dart';
import 'package:flutter_core/secrets.dart';
import 'package:flutter_core/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meeting/loading_screen.dart';
import 'meeting/setup_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final nameController = TextEditingController();

  final descriptionController = TextEditingController();

  final roomNameController = TextEditingController();

  MeetingDetails? meetingDetails;
  ParticipantTokens? participantTokens;

  @override
  void initState() {
    if (mounted) {
      attachAllListeners(ref);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listenToAllListeners(ref);
    ref.listen(routerNotifier, (previous, next) {
      switch (next.runtimeType) {
        case OnRouterMeetingInitStarted:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoadingScreen()));
          break;
        case OnRouterMeetingInitCompleted:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SetupPage()));
          break;
        case OnRouterMeetingInitFailed:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ExceptionPage((next as OnRouterMeetingInitFailed).error),
            ),
          );
          break;
        case OnRouterMeetingRoomJoinStarted:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoadingScreen(),
            ),
          );
          break;
        case OnRouterMeetingRoomJoinCompleted:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DyteMeetingRoom(),
            ),
          );
          break;

        case OnRouterMeetingRoomJoinFailed:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ExceptionPage((next as OnRouterMeetingRoomJoinFailed).error),
            ),
          );
          break;
        case OnRouterMeetingRoomLeaveCompleted:
          Navigator.of(context, rootNavigator: true)
              .popUntil((route) => route.isFirst);
          break;

        default:
          break;
      }
    });
    return Scaffold(
      appBar: const DyteAppBar(),
      body: Center(child: _meetingDetails(meetingRoomName)),
    );
  }

  Widget _meetingDetails(String meetLink) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Clipboard.setData(
                ClipboardData(text: 'https://app.dyte.io/$meetLink'));
          },
          child: Text('https://app.dyte.io/$meetLink'),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          onPressed: () {
            dyteMobileClient.init(
              DyteMeetingInfoV2(
                authToken: v2AuthToken,
              ),
            );
          },
          minWidth: 180,
          height: 45,
          color: DyteColors.primary,
          child: const Text(
            "Join Meeting",
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  void listenToAllListeners(WidgetRef ref) {
    ref.listen(roomEventNotifier, (previous, next) {});
    ref.listen(localUserSettingsProvider, (previous, next) {});
    ref.listen(participantEventNotifier, (previous, next) {});
    ref.listen(chatNotifier, (previous, next) {});
    ref.listen(screenshareProvider, (previous, next) {});
    ref.listen(recordingNotifier, (previous, next) {});
    ref.listen(pluginProvider, (previous, next) {});
    ref.listen(waitingRoomNotifier, (previous, next) {});
    ref.listen(newPollEventNotifier, (previous, next) {});
    ref.listen(pollsListNotifier, (previous, next) {});
  }

  void attachAllListeners(WidgetRef ref) {
    dyteMobileClient.addMeetingRoomEventsListener(
      ref.read(roomEventNotifier.notifier),
    );
    dyteMobileClient.addMeetingRoomEventsListener(
      ref.read(routerNotifier.notifier),
    );
    dyteMobileClient.addSelfEventsListener(
      ref.read(localUserSettingsProvider.notifier),
    );
    dyteMobileClient.addSelfEventsListener(
      ref.read(routerNotifier.notifier),
    );
    dyteMobileClient.addParticipantEventsListener(
      ref.read(participantEventNotifier.notifier),
    );
    dyteMobileClient.addChatEventsListener(
      ref.read(chatNotifier.notifier),
    );
    dyteMobileClient.addParticipantEventsListener(
      ref.read(pinUnpinProvider.notifier),
    );
    dyteMobileClient.addDataEventsListener(
      ref.read(screenshareProvider.notifier),
    );
    dyteMobileClient.addRecordingListener(
      ref.read(recordingNotifier.notifier),
    );
    dyteMobileClient.addDataEventsListener(
      ref.read(pluginProvider.notifier),
    );
    dyteMobileClient.addWaitingRoomListener(
      ref.read(waitingRoomNotifier.notifier),
    );
    dyteMobileClient.addPollEventsListener(
      ref.read(newPollEventNotifier.notifier),
    );
    dyteMobileClient.addPollEventsListener(
      ref.read(pollsListNotifier.notifier),
    );
  }
}
