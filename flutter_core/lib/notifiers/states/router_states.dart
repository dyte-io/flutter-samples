import 'package:realtimekit_core/realtimekit_core.dart';

abstract class RouterStates {}

class RouterInitial extends RouterStates {}

class OnRouterMeetingInitStarted extends RouterStates {}

class OnRouterMeetingInitCompleted extends RouterStates {}

class OnRouterMeetingInitFailed extends RouterStates {
  final Exception error;
  OnRouterMeetingInitFailed(this.error);
}

class OnRouterMeetingRoomJoinStarted extends RouterStates {}

class OnRouterMeetingRoomJoinCompleted extends RouterStates {}

class OnRouterMeetingRoomJoinFailed extends RouterStates {
  final Exception error;
  OnRouterMeetingRoomJoinFailed(this.error);
}

class OnRouterMeetingRoomLeaveStarted extends RouterStates {}

class OnRouterMeetingRoomLeaveCompleted extends RouterStates {}

class OnRouterMeetingRoomDisconnected extends RouterStates {}

class OnRouterSelfWaitingRoomStatusUpdate extends RouterStates {
  final WaitlistStatus waitListStatus;
  OnRouterSelfWaitingRoomStatusUpdate(this.waitListStatus);
}
