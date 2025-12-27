import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordingNotifer extends Notifier<RecordingState>
    implements RtkRecordingEventListener {
  @override
  void onRecordingStateChanged(
      RecordingState oldState, RecordingState newState) {
    state = newState;
  }

  @override
  RecordingState build() {
    return realtimekitClient.recording.recordingState;
  }
}
