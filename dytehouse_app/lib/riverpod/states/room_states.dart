class DyteHouseInitCompleted extends DyteHouseStates {}

class DyteHouseInitFailed extends DyteHouseStates {
  final Exception error;
  DyteHouseInitFailed(this.error);
}

class DyteHouseInitStarted extends DyteHouseStates {}

class DyteHouseRoomDisconnected extends DyteHouseStates {}

class DyteHouseRoomJoinCompleted extends DyteHouseStates {}

class DyteHouseRoomReconnecting extends DyteHouseStates {}

class DyteHouseRoomReconnected extends DyteHouseStates {}

class DyteHouseRoomReconnectionFailed extends DyteHouseStates {}

class DyteHouseRoomJoinFailed extends DyteHouseStates {
  final Exception error;
  DyteHouseRoomJoinFailed(this.error);
}

class DyteHouseRoomJoinStarted extends DyteHouseStates {}

class DyteHouseRoomLeaveCompleted extends DyteHouseStates {}

class DyteHouseRoomLeaveStarted extends DyteHouseStates {}

class DyteHouseFromMeeting extends DyteHouseStates {}

class DyteHouseInitial extends DyteHouseStates {}

abstract class DyteHouseStates {}
