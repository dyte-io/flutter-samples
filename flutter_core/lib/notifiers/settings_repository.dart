import 'package:realtimekit_core/realtimekit_core.dart';

class LocalUserSettingsRepository {
  final RealtimekitClient realtimekitClient;
  LocalUserSettingsRepository(this.realtimekitClient);

  bool isAudioEnabled = false;

  bool isVideoEnabled = false;

  bool toggleAudio() {
    if (isAudioEnabled) {
      realtimekitClient.localUser.disableAudio();
    } else {
      realtimekitClient.localUser.enableAudio();
    }
    return isAudioEnabled = !isAudioEnabled;
  }

  bool toggleVideo() {
    if (isVideoEnabled) {
      realtimekitClient.localUser.disableVideo();
    } else {
      realtimekitClient.localUser.enableVideo();
    }
    return isVideoEnabled = !isVideoEnabled;
  }
}
