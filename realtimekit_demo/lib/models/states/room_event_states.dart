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
  const factory RoomEventStates.onMeetingRoomJoinCompleted() =
      _RoomEventStatesOnMeetingRoomJoinCompleted;

  const factory RoomEventStates.onMeetingRoomDisconnected() =
      _RoomEventStatesonMeetingRoomDisconnected;

  const factory RoomEventStates.joinFailed(Exception exception) =
      _RoomEventStatesonMeetingjoinFailed;

  const factory RoomEventStates.onMeetingRoomJoinStarted() =
      _RoomEventStatesonMeetingRoomJoinStarted;

  const factory RoomEventStates.onMeetingRoomLeaveCompleted() =
      _RoomEventStatesonMeetingRoomLeaveCompleted;

  const factory RoomEventStates.onMeetingRoomLeaveStarted() =
      _RoomEventStatesonMeetingRoomLeaveStarted;
}
