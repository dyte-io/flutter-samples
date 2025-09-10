import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_event_states.freezed.dart';

@freezed
class RoomEventStates with _$RoomEventStates {
  const factory RoomEventStates.initial() = _RoomEventStatesInitial;
  const factory RoomEventStates.onMeetingInitStarted() =
      _RoomEventStatesOnInitStarted;
  const factory RoomEventStates.onMeetingInitCompleted() =
      _RoomEventStatesOnInitCompleted;
  const factory RoomEventStates.onMeetingInitFailed(Exception exception) =
      _RoomEventStatesOnInitFailed;
  const factory RoomEventStates.onMeetingRoomJoinStarted() =
      _RoomEventStatesOnJoinStarted;
  const factory RoomEventStates.onMeetingRoomJoinCompleted() =
      _RoomEventStatesOnJoinCompleted;
  const factory RoomEventStates.onMeetingRoomJoinFailed(Exception exception) =
      _RoomEventStatesOnJoinFailed;
  const factory RoomEventStates.onMeetingRoomLeaveStarted() =
      _RoomEventStatesOnLeaveStarted;
  const factory RoomEventStates.onMeetingRoomLeaveCompleted() =
      _RoomEventStatesOnLeaveCompleted;
  const factory RoomEventStates.onMeetingRoomDisconnected() =
      _RoomEventStatesOnDisconnected;
}
