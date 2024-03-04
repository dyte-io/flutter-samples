import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:flutter/material.dart';

// TODO: Add your auth token here.
const participantAuthToken = 'paste-auth-token-here';
final meetingInfo = DyteMeetingInfoV2(authToken: participantAuthToken);

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
    with DyteMeetingRoomEventsListener {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: InitMeetingRoom(widget.meetingInfo),
      ),
    );
  }
}

class InitMeetingRoom extends StatefulWidget {
  const InitMeetingRoom(this.meetingInfo, {super.key});

  final DyteMeetingInfo meetingInfo;

  @override
  State<InitMeetingRoom> createState() => _InitMeetingRoomState();
}

class _InitMeetingRoomState extends State<InitMeetingRoom>
    with DyteMeetingRoomEventsListener {
  late final DyteUiKit uikit;

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
          uikit = DyteUIKitBuilder.build(
            uiKitInfo: DyteUIKitInfo(widget.meetingInfo),
            context: context,
          );
          dyteMobileClient.init(widget.meetingInfo);
          dyteMobileClient.addMeetingRoomEventsListener(this);
        },
      ),
    );
  }

  @override
  void dispose() {
    dyteMobileClient.removeMeetingRoomEventsListener(this);
    super.dispose();
  }
}

class JoinMeetingRoom extends StatefulWidget {
  const JoinMeetingRoom({super.key});

  @override
  State<JoinMeetingRoom> createState() => _JoinMeetingRoomState();
}

class _JoinMeetingRoomState extends State<JoinMeetingRoom>
    with DyteMeetingRoomEventsListener {
  @override
  void onMeetingRoomJoinCompleted() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FacetimeMeetingRoom()));
  }

  @override
  void initState() {
    dyteMobileClient.addMeetingRoomEventsListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DyteJoinButton(
        // TODO: dyteMobileClient is a global variable. uikit object should have it as a property IMO
        dyteMobileClient: dyteMobileClient,
      ),
    );
  }

  @override
  void dispose() {
    dyteMobileClient.removeMeetingRoomEventsListener(this);
    super.dispose();
  }
}

class FacetimeMeetingRoom extends StatefulWidget {
  const FacetimeMeetingRoom({super.key});

  @override
  State<FacetimeMeetingRoom> createState() => _FacetimeMeetingRoomState();
}

class _FacetimeMeetingRoomState extends State<FacetimeMeetingRoom>
    with DyteMeetingRoomEventsListener {
  @override
  void onMeetingRoomLeaveCompleted() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => InitMeetingRoom(meetingInfo)));
  }

  @override
  void initState() {
    dyteMobileClient.addMeetingRoomEventsListener(this);
    super.initState();
  }

  DyteMeetingParticipant? _getFirstRemoteUser(
      List<DyteMeetingParticipant> actives) {
    for (final participant in actives) {
      if (participant.id != dyteMobileClient.localUser.id) {
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
              stream: dyteMobileClient.activeStream,
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
              width: 196,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DyteSelfAudioToggleButton(dyteMobileClient: dyteMobileClient),
                  DyteSelfVideoToggleButton(dyteMobileClient: dyteMobileClient),
                  DyteLeaveButton(dyteMobileClient: dyteMobileClient),
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
                dyteMobileClient.localUser,
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
    dyteMobileClient.removeMeetingRoomEventsListener(this);
    super.dispose();
  }
}
