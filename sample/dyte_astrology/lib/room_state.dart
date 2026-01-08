import 'package:dyte_core/dyte_core.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class RoomStateNotifier extends GetxController
    implements
        DyteMeetingRoomEventsListener,
        DyteParticipantEventsListener,
        DyteChatEventsListener {
  // DyteMobileClient is manager to interact with dyte server.
  final Rx<DyteMobileClient> dyteClient = DyteMobileClient().obs;
  // Remote peer will hold the remote peer information like name, video, audio so on.
  Rxn<DyteMeetingParticipant> remotePeer = Rxn<DyteMeetingParticipant>();
  // isAudioOn is used to get and set local user audio status
  Rx<bool> isAudioOn = false.obs;
  // isVideoOn is used to get and set local user video status
  Rx<bool> isVideoOn = true.obs;
  // Room Join status
  Rx<bool> roomJoin = false.obs;
  // Username is used to assign value in room.
  Rx<String> username = "".obs;
  // Dyte Room Id
  Rx<String> roomId = "".obs;
  // List of dyte Messages
  RxList<DyteChatMessage> dyteChatMessage = RxList();
  // show room Id
  Rx<bool> showRoomId = false.obs;
  // Active Speaker
  Rx<String> activeSpeakerId = "".obs;

  RoomStateNotifier(String name, String token, String meetingId, bool showId) {
    username.value = name;
    roomId.value = meetingId;
    showRoomId.value = showId;
    dyteClient.value.addMeetingRoomEventsListener(this);
    dyteClient.value.addParticipantEventsListener(this);
    dyteClient.value.addChatEventsListener(this);
    final meetingInfo = DyteMeetingInfoV2(
        authToken: token, enableAudio: false, enableVideo: true);
    dyteClient.value.init(meetingInfo);
  }

  sendTextMessage(String message) {
    dyteClient.value.chat.sendTextMessage(message);
  }

  sendImageMessage(String path, String message) {
    dyteClient.value.chat.sendImageMessage(path, message);
  }

  sendFileMessage(String path, String message) {
    dyteClient.value.chat.sendFileMessage(path, message);
  }

  toggleVideo() {
    if (isVideoOn.value) {
      dyteClient.value.localUser.disableVideo();
    } else {
      dyteClient.value.localUser.enableVideo();
    }
    isVideoOn.toggle();
  }

  toggleAudio() async {
    if (isAudioOn.value) {
      dyteClient.value.localUser.disableAudio();
    } else {
      dyteClient.value.localUser.enableAudio();
    }
    isAudioOn.toggle();
  }

  switchCamera() async {
    dyteClient.value.localUser.switchCamera();
  }

  leaveRoom() {
    dyteClient.value.leaveRoom();
  }

  @override
  void onMeetingInitCompleted() {
    if (dyteClient.value.permissions.miscellaneous.canEditDisplayName) {
      dyteClient.value.localUser.setDisplayName(username.value);
    }
    dyteClient.value.joinRoom();
  }

  @override
  void onMeetingRoomJoinCompleted() {
    roomJoin.value = true;
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    roomJoin.value = false;
    dyteClient.value.removeMeetingRoomEventsListener(this);
    dyteClient.value.removeParticipantEventsListener(this);
    dyteClient.value.removeChatEventsListener(this);
    Get.back();
    Get.delete<RoomStateNotifier>();
  }

  @override
  void onParticipantJoin(DyteJoinedMeetingParticipant participant) {
    // not a local user check
    if (participant.userId != dyteClient.value.localUser.userId) {
      remotePeer.value = participant;
    }
  }

  @override
  void onParticipantLeave(DyteJoinedMeetingParticipant participant) {
    if (participant.userId != dyteClient.value.localUser.userId &&
        remotePeer.value != null) {
      remotePeer.value = null;
    }
  }

  @override
  void onNewChatMessage(DyteChatMessage message) {
    dyteChatMessage.add(message);
  }

  @override
  void onVideoUpdate(
      bool videoEnabled, DyteJoinedMeetingParticipant participant) {
    if (participant.userId == remotePeer.value?.userId) {
      remotePeer.value = participant;
    }
  }

  @override
  void onActiveSpeakerChanged(DyteJoinedMeetingParticipant participant) {
    activeSpeakerId.value = participant.userId;
  }

  @override
  void onNoActiveSpeaker() {
    activeSpeakerId.value = "";
  }

  @override
  void onMeetingInitFailed(Exception exception) {
    print("onMeetingInitFailed $exception");
  }

  @override
  void onMeetingInitStarted() {
    // TODO: implement onMeetingInitStarted
  }

  @override
  void onMeetingRoomDisconnected() {
    // TODO: implement onMeetingRoomDisconnected
  }

  @override
  void onMeetingRoomJoinFailed(Exception exception) {
    print("onMeetingRoomJoinFailed $exception");
  }

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveStarted() {
    // TODO: implement onMeetingRoomLeaveCompleted
  }

  @override
  void onActiveParticipantsChanged(List<DyteJoinedMeetingParticipant> active) {
    // TODO: implement onActiveParticipantsChanged
  }

  @override
  void onAudioUpdate(
      bool audioEnabled, DyteJoinedMeetingParticipant participant) {
    // TODO: implement onAudioUpdate
  }

  @override
  void onParticipantPinned(DyteJoinedMeetingParticipant participant) {
    // TODO: implement onParticipantPinned
  }

  @override
  void onParticipantUnpinned(DyteJoinedMeetingParticipant participant) {
    // TODO: implement onParticipantUnpinned
  }

  @override
  void onScreenSharesUpdated() {
    // TODO: implement onScreenSharesUpdated
  }

  @override
  void onChatUpdates(List<DyteChatMessage> messages) {
    // TODO: implement onChatUpdates
  }

  @override
  void onDisconnectedFromMeetingRoom(String reason) {
    // TODO: implement onDisconnectedFromMeetingRoom
  }

  @override
  void onMeetingRoomConnectionError(String errorMessage) {
    // TODO: implement onMeetingRoomConnectionError
  }

  @override
  void onMeetingRoomReconnectionFailed() {
    // TODO: implement onMeetingRoomReconnectionFailed
  }

  @override
  void onReconnectedToMeetingRoom() {
    // TODO: implement onReconnectedToMeetingRoom
  }

  @override
  void onReconnectingToMeetingRoom() {
    // TODO: implement onReconnectingToMeetingRoom
  }

  @override
  void onConnectedToMeetingRoom() {
    // TODO: implement onConnectedToMeetingRoom
  }

  @override
  void onConnectingToMeetingRoom() {
    // TODO: implement onConnectingToMeetingRoom
  }

  @override
  void onScreenShareEnded(DyteJoinedMeetingParticipant participant) {
    // TODO: implement onScreenShareEnded
  }

  @override
  void onScreenShareStarted(DyteJoinedMeetingParticipant participant) {
    // TODO: implement onScreenShareStarted
  }

  @override
  void onUpdate(DyteParticipants participants) {
    // TODO: implement onUpdate
  }
}
