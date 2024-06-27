import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenshareNotifier extends Notifier<List<DyteMeetingParticipant>>
    implements DyteDataEventsListener {
  @override
  void onScreenShareUpdate(List<DyteMeetingParticipant> screenShares) {
    state = screenShares;
  }

  @override
  List<DyteMeetingParticipant> build() {
    return dyteMobileClient.participants.screenshares;
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
  void onPluginUpdate(List<DytePlugin> plugin) {}

  @override
  void onSelfPermissionsUpdate(DytePermissions permissions) {}
}
