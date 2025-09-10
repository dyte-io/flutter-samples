import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenshareNotifier extends Notifier<List<RtkMeetingParticipant>>
    implements RtkDataEventListener {
  @override
  void onScreenShareUpdate(List<RtkMeetingParticipant> screenShares) {
    state = screenShares;
  }

  @override
  List<RtkMeetingParticipant> build() {
    return dyteMobileClient.participants.screenshares;
  }

  @override
  void onLivestreamUpdate(RtkLivestreamData livestreamData) {}

  @override
  void onMetaUpdate(
      String roomName,
      String meetingTitle,
      String meetingStartedTimestamp,
      RtkMeetingType roomType,
      RtkDesignTokens designToken) {}

  @override
  void onPluginUpdate(List<RtkPlugin> plugin) {}

  @override
  void onSelfPermissionsUpdate(SelfPermissions permissions) {}
}
