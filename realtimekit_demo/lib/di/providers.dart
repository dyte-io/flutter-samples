import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/models/states/participant_event_states.dart';
import 'package:realtimekit_demo/models/states/room_event_states.dart';
import 'package:realtimekit_demo/notifiers/chat_notifier.dart';
import 'package:realtimekit_demo/notifiers/local_user_notifier.dart';
import 'package:realtimekit_demo/notifiers/participant_state_notifier.dart';
import 'package:realtimekit_demo/notifiers/pin_unpin_notifier.dart';
import 'package:realtimekit_demo/notifiers/plugin_state_notifier.dart';
import 'package:realtimekit_demo/notifiers/poll_notifier.dart';
import 'package:realtimekit_demo/notifiers/recording_notifier.dart';
import 'package:realtimekit_demo/notifiers/room_state_notifier.dart';
import 'package:realtimekit_demo/notifiers/router_notifier.dart';
import 'package:realtimekit_demo/notifiers/screenshare_notifier.dart';
import 'package:realtimekit_demo/notifiers/states/chat_states.dart';
import 'package:realtimekit_demo/notifiers/states/local_user_states.dart';
import 'package:realtimekit_demo/notifiers/states/poll_states.dart';
import 'package:realtimekit_demo/notifiers/states/router_states.dart';
import 'package:realtimekit_demo/notifiers/states/waitlisted_participant_states.dart';
import 'package:realtimekit_demo/notifiers/waitlisted_participant_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di.dart';

final localUserSettingsProvider =
    NotifierProvider<LocalUserNotifer, LocalUserState>(
  () {
    return LocalUserNotifer(localUserSettingsRepository);
  },
  name: 'localUserSettingsProvider',
);

final roomEventNotifier = NotifierProvider<RoomStateNotifier, RoomEventStates>(
  () => RoomStateNotifier(),
  name: 'roomEventNotifier',
);

final participantEventNotifier =
    NotifierProvider<ParticipantNotifier, ParticipantEventStates>(
  () => ParticipantNotifier(),
  name: 'participantEventNotifier',
);

final pinUnpinProvider =
    NotifierProvider<PinNotifier, RtkRemoteParticipant?>(PinNotifier.new);

final screenshareProvider =
    NotifierProvider<ScreenshareNotifier, List<RtkMeetingParticipant>>(
        ScreenshareNotifier.new);

final pluginProvider =
    NotifierProvider<PluginNotifer, List<RtkPlugin>>(PluginNotifer.new);
final chatNotifier =
    StateNotifierProvider<ChatNotifier, ChatStates>((ref) => ChatNotifier());

final recordingNotifier =
    NotifierProvider<RecordingNotifer, RecordingState>(
        RecordingNotifer.new);

final waitingRoomNotifier =
    NotifierProvider<WaitingRoomNotifer, WaitlistedParticipantStates>(
        () => WaitingRoomNotifer());

final routerNotifier = NotifierProvider<RouterNotifier, RouterStates>(
  () => RouterNotifier(),
);

final newPollEventNotifier = NotifierProvider<NewPollNotifer, PollStates>(
  () => NewPollNotifer(),
);

final pollsListNotifier =
    NotifierProvider<PollListNotifier, List<Poll>>(
        PollListNotifier.new);
