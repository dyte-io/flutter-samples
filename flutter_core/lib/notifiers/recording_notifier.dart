import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordingNotifer extends Notifier<DyteRecordingState>
    implements DyteRecordingEventsListener {
  @override
  void onMeetingRecordingEnded() {
    state = dyteMobileClient.recording.recordingState;
  }

  @override
  void onMeetingRecordingStarted() {
    state = dyteMobileClient.recording.recordingState;
  }

  @override
  void onMeetingRecordingStateUpdated(DyteRecordingState recordingState) {
    state = dyteMobileClient.recording.recordingState;
  }

  @override
  void onMeetingRecordingStopError(String error) {
    state = dyteMobileClient.recording.recordingState;
  }

  @override
  DyteRecordingState build() {
    return dyteMobileClient.recording.recordingState;
  }

  @override
  void onMeetingRecordingPauseError(String error) {
    // TODO: implement onMeetingRecordingPauseError
  }

  @override
  void onMeetingRecordingResumeError(String error) {
    // TODO: implement onMeetingRecordingResumeError
  }
}
