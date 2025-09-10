import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

class PluginNotifer extends Notifier<List<RtkPlugin>>
    implements RtkDataEventListener {
  @override
  void onPluginUpdate(List<RtkPlugin> plugin) {
    state = plugin;
  }

  @override
  List<RtkPlugin> build() {
    return [];
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
  void onScreenShareUpdate(List<RtkRemoteParticipant> screenShares) {}

  @override
  void onSelfPermissionsUpdate(SelfPermissions permissions) {}
}
