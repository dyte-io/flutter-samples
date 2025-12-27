import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/models/states/participant_event_states.dart';
import 'package:flutter_core/models/states/room_event_states.dart';
import 'package:flutter_core/notifiers/chat_notifier.dart';
import 'package:flutter_core/notifiers/local_user_notifier.dart';
import 'package:flutter_core/notifiers/participant_state_notifier.dart';
import 'package:flutter_core/notifiers/pin_unpin_notifier.dart';
import 'package:flutter_core/notifiers/plugin_state_notifier.dart';
import 'package:flutter_core/notifiers/poll_notifier.dart';
import 'package:flutter_core/notifiers/recording_notifier.dart';
import 'package:flutter_core/notifiers/room_state_notifier.dart';
import 'package:flutter_core/notifiers/router_notifier.dart';
import 'package:flutter_core/notifiers/screenshare_notifier.dart';
import 'package:flutter_core/notifiers/states/chat_states.dart';
import 'package:flutter_core/notifiers/states/local_user_states.dart';
import 'package:flutter_core/notifiers/states/poll_states.dart';
import 'package:flutter_core/notifiers/states/router_states.dart';
import 'package:flutter_core/notifiers/states/waitlisted_participant_states.dart';
import 'package:flutter_core/notifiers/waitlisted_participant_notifier.dart';
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
    NotifierProvider<PinNotifier, RtkMeetingParticipant?>(PinNotifier.new);

final screenshareProvider =
    NotifierProvider<ScreenshareNotifier, List<RtkMeetingParticipant>>(
        ScreenshareNotifier.new);

final pluginProvider =
    NotifierProvider<PluginNotifer, List<RtkPlugin>>(PluginNotifer.new);
final chatNotifier =
    StateNotifierProvider<ChatNotifier, ChatStates>((ref) => ChatNotifier());

final recordingNotifier =
    NotifierProvider<RecordingNotifer, RecordingState>(RecordingNotifer.new);

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
    NotifierProvider<PollListNotifier, List<Poll>>(PollListNotifier.new);
