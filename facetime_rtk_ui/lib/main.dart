import 'package:realtimekit_ui/realtimekit_ui.dart';
import 'package:flutter/material.dart';

// TODO: Add your auth token here.
const participantAuthToken = "";
final meetingInfo = RtkMeetingInfo(authToken: participantAuthToken);

final RealtimekitClient _client = RealtimekitClient();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FacetimeUIApp(meetingInfo));
}

class FacetimeUIApp extends StatefulWidget {
  const FacetimeUIApp(this.meetingInfo, {super.key});
  final RtkMeetingInfo meetingInfo;

  @override
  State<FacetimeUIApp> createState() => _FacetimeUIAppState();
}

class _FacetimeUIAppState extends State<FacetimeUIApp>
    implements RtkMeetingRoomEventListener {
  @override
  Widget build(BuildContext context) {
    return RtkProvider(
      meeting: _client,
      uiKitInfo: RealtimeKitUIInfo(meetingInfo),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: InitMeetingRoom(widget.meetingInfo),
      ),
    );
  }

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitCompleted() {}

  @override
  void onMeetingInitFailed(MeetingError error) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomJoinCompleted() {}

  @override
  void onMeetingRoomJoinFailed(MeetingError error) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveCompleted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onSocketConnectionUpdate(SocketConnectionState connectionState) {}
}

class InitMeetingRoom extends StatefulWidget {
  const InitMeetingRoom(this.meetingInfo, {super.key});

  final RtkMeetingInfo meetingInfo;

  @override
  State<InitMeetingRoom> createState() => _InitMeetingRoomState();
}

class _InitMeetingRoomState extends State<InitMeetingRoom>
    implements RtkMeetingRoomEventListener {
  @override
  void onMeetingInitCompleted() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JoinMeetingRoom()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        child: const Text("Start the facetime app"),
        onPressed: () {
          _client.init(widget.meetingInfo);
          _client.addMeetingRoomEventListener(this);
        },
      ),
    );
  }

  @override
  void dispose() {
    _client.removeMeetingRoomEventListener(this);
    super.dispose();
  }

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitFailed(MeetingError error) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomJoinCompleted() {}

  @override
  void onMeetingRoomJoinFailed(MeetingError error) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveCompleted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onSocketConnectionUpdate(SocketConnectionState connectionState) {}
}

class JoinMeetingRoom extends StatefulWidget {
  const JoinMeetingRoom({super.key});

  @override
  State<JoinMeetingRoom> createState() => _JoinMeetingRoomState();
}

class _JoinMeetingRoomState extends State<JoinMeetingRoom>
    implements RtkMeetingRoomEventListener {
  @override
  void onMeetingRoomJoinCompleted() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FacetimeMeetingRoom()),
    );
  }

  @override
  void initState() {
    _client.addMeetingRoomEventListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RtkJoinButton(meeting: _client, height: 50, width: 200),
    );
  }

  @override
  void dispose() {
    _client.removeMeetingRoomEventListener(this);
    super.dispose();
  }

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitCompleted() {}

  @override
  void onMeetingInitFailed(MeetingError error) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomJoinFailed(MeetingError error) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveCompleted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onSocketConnectionUpdate(SocketConnectionState connectionState) {}
}

class FacetimeMeetingRoom extends StatefulWidget {
  const FacetimeMeetingRoom({super.key});

  @override
  State<FacetimeMeetingRoom> createState() => _FacetimeMeetingRoomState();
}

class _FacetimeMeetingRoomState extends State<FacetimeMeetingRoom>
    implements RtkMeetingRoomEventListener, RtkParticipantsEventListener {
  @override
  void onMeetingRoomLeaveCompleted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => InitMeetingRoom(meetingInfo)),
    );
  }

  @override
  void initState() {
    _client.addMeetingRoomEventListener(this);
    _client.addParticipantsEventListener(this);
    super.initState();
  }

  RtkMeetingParticipant? _getFirstRemoteUser() {
    // Check active participants first
    final actives = _client.participants.active;
    for (final participant in actives) {
      if (participant.id != _client.localUser.id) {
        return participant;
      }
    }
    // Fallback to all joined participants
    final joined = _client.participants.joined;
    for (final participant in joined) {
      if (participant.id != _client.localUser.id) {
        return participant;
      }
    }
    return null;
  }

  void _refreshUI() {
    if (mounted) {
      setState(() {});
    }
  }

  // RtkParticipantsEventListener methods
  @override
  void onParticipantJoin(RtkRemoteParticipant participant) {
    _refreshUI();
  }

  @override
  void onParticipantLeave(RtkRemoteParticipant participant) {
    // Small delay to ensure participant list is updated
    Future.delayed(const Duration(milliseconds: 100), _refreshUI);
  }

  @override
  void onActiveParticipantsChanged(List<RtkRemoteParticipant> active) {
    _refreshUI();
  }

  @override
  void onAudioUpdate(RtkRemoteParticipant participant, bool audioEnabled) {
    _refreshUI();
  }

  @override
  void onVideoUpdate(RtkRemoteParticipant participant, bool videoEnabled) {
    _refreshUI();
  }

  @override
  void onActiveSpeakerChanged(RtkRemoteParticipant? participant) {}

  @override
  void onParticipantPinned(RtkRemoteParticipant participant) {}

  @override
  void onParticipantUnpinned(RtkRemoteParticipant participant) {}

  @override
  void onScreenShareUpdate(RtkRemoteParticipant participant, bool isEnabled) {}

  @override
  void onUpdate(RtkParticipants participants) {
    _refreshUI();
  }

  @override
  void onNewBroadcastMessage(String type, Map<String, dynamic> payload) {}

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Remote participant (full screen)
          Builder(
            builder: (context) {
              final firstRemoteUser = _getFirstRemoteUser();
              if (firstRemoteUser != null) {
                return RtkParticipantTile(firstRemoteUser);
              }
              return Container(
                color: Colors.black,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 80,
                        color: Colors.white38,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Waiting for others to join...",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Local participant (picture-in-picture style)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: GestureDetector(
              onPanUpdate: (details) {
                // Could add drag functionality here
              },
              child: Container(
                height: 180,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: RtkParticipantTile(
                    _client.localUser,
                    height: 180,
                    width: 120,
                  ),
                ),
              ),
            ),
          ),

          // Bottom control bar (FaceTime style)
          Positioned(
            bottom: bottomPadding + 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildControlButton(
                      icon: _client.localUser.audioEnabled
                          ? Icons.mic
                          : Icons.mic_off,
                      isActive: _client.localUser.audioEnabled,
                      onTap: () {
                        if (_client.localUser.audioEnabled) {
                          _client.localUser.disableAudio();
                        } else {
                          _client.localUser.enableAudio();
                        }
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 24),
                    _buildControlButton(
                      icon: _client.localUser.videoEnabled
                          ? Icons.videocam
                          : Icons.videocam_off,
                      isActive: _client.localUser.videoEnabled,
                      onTap: () {
                        if (_client.localUser.videoEnabled) {
                          _client.localUser.disableVideo();
                        } else {
                          _client.localUser.enableVideo();
                        }
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 24),
                    _buildControlButton(
                      icon: Icons.cameraswitch,
                      isActive: true,
                      onTap: () {
                        // Switch camera
                      },
                    ),
                    const SizedBox(width: 24),
                    _buildEndCallButton(
                      onTap: () {
                        _client.leaveRoom();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? Colors.white.withOpacity(0.2)
              : Colors.white.withOpacity(0.3),
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }

  Widget _buildEndCallButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: const Icon(Icons.call_end, color: Colors.white, size: 26),
      ),
    );
  }

  @override
  void dispose() {
    _client.removeMeetingRoomEventListener(this);
    _client.removeParticipantsEventListener(this);
    super.dispose();
  }

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitCompleted() {}

  @override
  void onMeetingInitFailed(MeetingError error) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomJoinCompleted() {}

  @override
  void onMeetingRoomJoinFailed(MeetingError error) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onSocketConnectionUpdate(SocketConnectionState connectionState) {}
}
