import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/constants/colors.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_core/di/providers.dart';
import 'package:flutter_core/meeting_config.dart';
import 'package:flutter_core/notifiers/states/router_states.dart';
import 'package:flutter_core/ui/widgets/appbar.dart';
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
      body: Center(child: _meetingDetails('Meeting Room Name')),
    );
  }

  Widget _meetingDetails(String meetLink) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          realtimekitClient.init(
            RtkMeetingInfo(
              authToken: MeetingConfig.authToken,
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
      ),
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
    realtimekitClient.addMeetingRoomEventListener(
      ref.read(roomEventNotifier.notifier),
    );
    realtimekitClient.addMeetingRoomEventListener(
      ref.read(routerNotifier.notifier),
    );
    realtimekitClient.addSelfEventListener(
      ref.read(localUserSettingsProvider.notifier),
    );
    realtimekitClient.addSelfEventListener(
      ref.read(routerNotifier.notifier),
    );
    realtimekitClient.addParticipantsEventListener(
      ref.read(participantEventNotifier.notifier),
    );
    realtimekitClient.addChatEventListener(
      ref.read(chatNotifier.notifier),
    );
    realtimekitClient.addDataUpdateEventListener(
      ref.read(screenshareProvider.notifier),
    );
    realtimekitClient.addRecordingEventListener(
      ref.read(recordingNotifier.notifier),
    );
    realtimekitClient.addPluginsEventListener(
      ref.read(pluginProvider.notifier),
    );
    realtimekitClient.addWaitlistEventListener(
      ref.read(waitingRoomNotifier.notifier),
    );
    realtimekitClient.addPollsEventListener(
      ref.read(newPollEventNotifier.notifier),
    );
    realtimekitClient.addPollsEventListener(
      ref.read(pollsListNotifier.notifier),
    );
  }
}
