import 'package:realtimekit_core/realtimekit_core.dart';
class LocalUserSettingsRepository {
  final RealtimekitClient rtkMobileClient;
  LocalUserSettingsRepository(this.rtkMobileClient);

  bool isAudioEnabled = false;

  bool isVideoEnabled = false;

  bool toggleAudio() {
    if (isAudioEnabled) {
      rtkMobileClient.localUser.disableAudio();
    } else {
      rtkMobileClient.localUser.enableAudio();
    }
    return isAudioEnabled = !isAudioEnabled;
  }

  bool toggleVideo() {
    if (isVideoEnabled) {
      rtkMobileClient.localUser.disableVideo();
    } else {
      rtkMobileClient.localUser.enableVideo();
    }
    return isVideoEnabled = !isVideoEnabled;
  }
}
