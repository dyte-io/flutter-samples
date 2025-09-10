import 'package:realtimekit_core/realtimekit_core.dart';
abstract class RecordingStates {}

class InitialRecordingState extends RecordingStates {}

class OnRecordingStarted extends RecordingStates {
  final RecordingState state;

  OnRecordingStarted(this.state);
}

class OnRecordingEnded extends RecordingStates {
  final RecordingState state;

  OnRecordingEnded(this.state);
}

class OnRecordingStateUpdated extends RecordingStates {
  final RecordingState state;

  OnRecordingStateUpdated(this.state);
}

class OnRecordingStoppedError extends RecordingStates {}
