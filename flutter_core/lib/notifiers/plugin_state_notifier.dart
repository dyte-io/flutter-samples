import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PluginNotifer extends Notifier<List<DytePlugin>>
    implements DyteDataEventsListener {
  @override
  void onPluginUpdate(List<DytePlugin> plugin) {
    state = plugin;
  }

  @override
  List<DytePlugin> build() {
    return [];
  }

  @override
  void onLivestreamUpdate(DyteLivestreamData livestreamData) {}

  @override
  void onMetaUpdate(
      String roomName,
      String meetingTitle,
      String meetingStartedTimestamp,
      DyteRoomType roomType,
      DyteDesignTokens designToken) {}

  @override
  void onScreenShareUpdate(List<DyteJoinedMeetingParticipant> screenShares) {}

  @override
  void onSelfPermissionsUpdate(DytePermissions permissions) {}
}
