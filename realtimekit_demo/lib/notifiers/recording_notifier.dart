import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordingNotifer extends Notifier<RecordingState>
    implements RtkRecordingEventListener {




  @override
  RecordingState build() {
    return dyteMobileClient.recording.recordingState;
  }



  @override
  void onRecordingStateChanged(RecordingState oldState, RecordingState newState) {
    // TODO: implement onRecordingStateChanged
  }
}
