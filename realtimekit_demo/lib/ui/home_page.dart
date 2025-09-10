import 'package:flutter/material.dart';
import 'package:realtimekit_demo/constants/colors.dart';
import 'package:realtimekit_demo/di/di.dart';
import 'package:realtimekit_demo/di/providers.dart';
import 'package:realtimekit_demo/meeting_config.dart';
import 'package:realtimekit_demo/notifiers/states/router_states.dart';
import 'package:realtimekit_demo/ui/widgets/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtimekit_core/realtimekit_core.dart';
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
  void dispose() {
    dyteMobileClient.release();
     super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    listenToAllListeners(ref);
    final routerState = ref.watch(routerNotifier);
    return switch(routerState){
    OnRouterMeetingInitStarted _ || OnRouterMeetingRoomJoinStarted _ =>LoadingScreen(),
    OnRouterMeetingInitCompleted _ => SetupPage(),
    OnRouterMeetingRoomJoinCompleted _ => const RealtimeKitMeetingRoom(),
    OnRouterMeetingInitFailed _ || OnRouterMeetingRoomJoinFailed _ => ExceptionPage(Exception(routerState.toString())),
      RouterStates _ => Scaffold(
        appBar: const RealtimeKitAppBar(),
        body: Center(child: _meetingDetails()),
      ),
    };

  }

  Widget _meetingDetails() {
    return Center(
      child: MaterialButton(
        onPressed: () {
          dyteMobileClient.init(
            RtkMeetingInfo(
              baseDomain: 'realtime.cloudflare.com',
              authToken: MeetingConfig.authToken,
              enableVideo: true
            ),
            onError: (rtkError){
              print(rtkError?.message);
            }
          );
          // print(dyteMobileClient.meta.);
        },
        minWidth: 180,
        height: 45,
        color: RealtimeKitColors.primary,
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
    dyteMobileClient.addMeetingRoomEventListener(
      ref.read(roomEventNotifier.notifier),
    );
    dyteMobileClient.addMeetingRoomEventListener(
      ref.read(routerNotifier.notifier),
    );
    dyteMobileClient.addSelfEventListener(
      ref.read(localUserSettingsProvider.notifier),
    );
    dyteMobileClient.addSelfEventListener(
      ref.read(routerNotifier.notifier),
    );
    dyteMobileClient.addParticipantsEventListener(
      ref.read(participantEventNotifier.notifier),
    );
    dyteMobileClient.addChatEventListener(
      ref.read(chatNotifier.notifier),
    );
    dyteMobileClient.addParticipantsEventListener(
      ref.read(pinUnpinProvider.notifier),
    );
    dyteMobileClient.addDataUpdateEventListener(
      ref.read(screenshareProvider.notifier),
    );
    dyteMobileClient.addRecordingEventListener(
      ref.read(recordingNotifier.notifier),
    );
    dyteMobileClient.addDataUpdateEventListener(
      ref.read(pluginProvider.notifier),
    );
    dyteMobileClient.addWaitlistEventListener(
      ref.read(waitingRoomNotifier.notifier),
    );
    dyteMobileClient.addPollsEventListener(
      ref.read(newPollEventNotifier.notifier),
    );
    dyteMobileClient.addPollsEventListener(
      ref.read(pollsListNotifier.notifier),
    );
  }
}
