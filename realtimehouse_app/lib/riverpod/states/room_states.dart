class RtkHouseInitCompleted extends RtkHouseStates {}

class RtkHouseInitFailed extends RtkHouseStates {
  final Object error;
  RtkHouseInitFailed(this.error);
}

class RtkHouseInitStarted extends RtkHouseStates {}

class RtkHouseRoomDisconnected extends RtkHouseStates {}

class RtkHouseRoomJoinCompleted extends RtkHouseStates {}

class RtkHouseRoomReconnecting extends RtkHouseStates {}

class RtkHouseRoomReconnected extends RtkHouseStates {}

class RtkHouseRoomReconnectionFailed extends RtkHouseStates {}

class RtkHouseRoomJoinFailed extends RtkHouseStates {
  final Object error;
  RtkHouseRoomJoinFailed(this.error);
}

class RtkHouseRoomJoinStarted extends RtkHouseStates {}

class RtkHouseRoomLeaveCompleted extends RtkHouseStates {
  bool release;
  RtkHouseRoomLeaveCompleted({this.release = false});
}

class RtkHouseRoomLeaveStarted extends RtkHouseStates {}

class RtkHouseFromMeeting extends RtkHouseStates {}

class RtkHouseInitial extends RtkHouseStates {}

abstract class RtkHouseStates {}
