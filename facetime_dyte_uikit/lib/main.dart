import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:flutter/material.dart';

// TODO: Add your auth token here.
const participantAuthToken = "";
final meetingInfo = DyteMeetingInfoV2(authToken: participantAuthToken);

final DyteMobileClient _client = DyteMobileClient();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FacetimeUIApp(meetingInfo));
}

class FacetimeUIApp extends StatefulWidget {
  const FacetimeUIApp(this.meetingInfo, {super.key});
  final DyteMeetingInfo meetingInfo;

  @override
  State<FacetimeUIApp> createState() => _FacetimeUIAppState();
}

class _FacetimeUIAppState extends State<FacetimeUIApp>
    implements DyteMeetingRoomEventsListener {
  @override
  Widget build(BuildContext context) {
    return DyteProvider(
      client: _client,
      uiKitInfo: DyteUIKitInfo(meetingInfo),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: InitMeetingRoom(widget.meetingInfo),
      ),
    );
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onConnectedToMeetingRoom() {}

  @override
  void onConnectingToMeetingRoom() {}

  @override
  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitCompleted() {}

  @override
  void onMeetingInitFailed(Exception exception) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomDisconnected() {}

  @override
  void onMeetingRoomJoinCompleted() {}

  @override
  void onMeetingRoomJoinFailed(Exception exception) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveCompleted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}
}

class InitMeetingRoom extends StatefulWidget {
  const InitMeetingRoom(this.meetingInfo, {super.key});

  final DyteMeetingInfo meetingInfo;

  @override
  State<InitMeetingRoom> createState() => _InitMeetingRoomState();
}

class _InitMeetingRoomState extends State<InitMeetingRoom>
    implements DyteMeetingRoomEventsListener {
  @override
  void onMeetingInitCompleted() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const JoinMeetingRoom()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        child: const Text("Start the facetime app"),
        onPressed: () {
          _client.init(widget.meetingInfo);
          _client.addMeetingRoomEventsListener(this);
        },
      ),
    );
  }

  @override
  void dispose() {
    _client.removeMeetingRoomEventsListener(this);
    super.dispose();
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onConnectedToMeetingRoom() {}

  @override
  void onConnectingToMeetingRoom() {}

  @override
  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitFailed(Exception exception) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomDisconnected() {}

  @override
  void onMeetingRoomJoinCompleted() {}

  @override
  void onMeetingRoomJoinFailed(Exception exception) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveCompleted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}
}

class JoinMeetingRoom extends StatefulWidget {
  const JoinMeetingRoom({super.key});

  @override
  State<JoinMeetingRoom> createState() => _JoinMeetingRoomState();
}

class _JoinMeetingRoomState extends State<JoinMeetingRoom>
    implements DyteMeetingRoomEventsListener {
  @override
  void onMeetingRoomJoinCompleted() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FacetimeMeetingRoom()));
  }

  @override
  void initState() {
    _client.addMeetingRoomEventsListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DyteJoinButton(
        dyteMobileClient: _client,
        height: 50,
        width: 200,
      ),
    );
  }

  @override
  void dispose() {
    _client.removeMeetingRoomEventsListener(this);
    super.dispose();
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onConnectedToMeetingRoom() {}

  @override
  void onConnectingToMeetingRoom() {}

  @override
  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitCompleted() {}

  @override
  void onMeetingInitFailed(Exception exception) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomDisconnected() {}

  @override
  void onMeetingRoomJoinFailed(Exception exception) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveCompleted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}
}

class FacetimeMeetingRoom extends StatefulWidget {
  const FacetimeMeetingRoom({super.key});

  @override
  State<FacetimeMeetingRoom> createState() => _FacetimeMeetingRoomState();
}

class _FacetimeMeetingRoomState extends State<FacetimeMeetingRoom>
    implements DyteMeetingRoomEventsListener {
  @override
  void onMeetingRoomLeaveCompleted() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => InitMeetingRoom(meetingInfo)));
  }

  @override
  void initState() {
    _client.addMeetingRoomEventsListener(this);
    super.initState();
  }

  DyteMeetingParticipant? _getFirstRemoteUser(
      List<DyteMeetingParticipant> actives) {
    for (final participant in actives) {
      if (participant.id != _client.localUser.id) {
        return participant;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: StreamBuilder(
              stream: _client.activeStream,
              builder: (context, snapshot) {
                final participants = snapshot.data;
                if (participants != null && participants.isNotEmpty) {
                  final firstRemoteUser = _getFirstRemoteUser(participants);
                  if (firstRemoteUser != null) {
                    return DyteParticipantTile(
                      firstRemoteUser,
                    );
                  }
                  return const Center(
                    child: Text(
                      "Waiting for the remote user to join...",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          Positioned(
            bottom: 36,
            left: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              height: 72,
              width: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DyteSelfAudioToggleButton(dyteMobileClient: _client),
                  DyteSelfVideoToggleButton(dyteMobileClient: _client),
                  const DyteChatIconWidget(),
                  const DyteParticipantsIconWidget(),
                  // const DytePluginIconWidget(),
                  // const DytePollsIconWidget(),
                  DyteLeaveButton(dyteMobileClient: _client),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            right: 8,
            child: SizedBox(
              height: 200,
              width: 150,
              child: DyteParticipantTile(
                _client.localUser,
                height: 200,
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _client.removeMeetingRoomEventsListener(this);
    super.dispose();
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onConnectedToMeetingRoom() {}

  @override
  void onConnectingToMeetingRoom() {}

  @override
  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingInitCompleted() {}

  @override
  void onMeetingInitFailed(Exception exception) {}

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomDisconnected() {}

  @override
  void onMeetingRoomJoinCompleted() {}

  @override
  void onMeetingRoomJoinFailed(Exception exception) {}

  @override
  void onMeetingRoomJoinStarted() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}
}
