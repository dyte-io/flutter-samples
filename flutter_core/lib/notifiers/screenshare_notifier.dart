import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenshareNotifier extends Notifier<List<RtkMeetingParticipant>>
    implements RtkDataEventListener {
  @override
  void onScreenShareUpdate(List<RtkRemoteParticipant> screenShares) {
    state = screenShares;
  }

  @override
  List<RtkMeetingParticipant> build() {
    return realtimekitClient.participants.screenshares;
  }

  @override
  void onLivestreamUpdate(RtkLivestreamData livestreamData) {}

  @override
  void onMetaUpdate(
      String meetingId,
      String meetingTitle,
      String meetingStartedTimestamp,
      RtkMeetingType meetingType,
      RtkDesignTokens designToken) {}

  @override
  void onPluginUpdate(List<RtkPlugin> plugin) {}

  @override
  void onSelfPermissionsUpdate(SelfPermissions permissions) {}
}
