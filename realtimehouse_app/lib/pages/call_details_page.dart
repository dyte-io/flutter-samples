import 'package:realtimekit_ui/realtimekit_ui.dart';
import 'package:realtimehouse_app/main.dart';
import 'package:realtimehouse_app/pages/widgets/size/app_size.dart';
import 'package:realtimehouse_app/pages/widgets/size/size_util.dart';
import 'package:realtimehouse_app/pages/widgets/space/vh_space.dart';
import 'package:realtimehouse_app/riverpod/riverpod.dart';
import 'package:realtimehouse_app/riverpod/states/room_states.dart';
import 'package:realtimehouse_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallDetailsModal extends StatelessWidget {
  const CallDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height * .8,
        padding: const EdgeInsets.all(AppSize.s4),
        child: const LiveEventDetailsWidget(),
      ),
    );
  }
}

class CallDetailsPage extends ConsumerWidget {
  const CallDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(rtkRoomNotifier, (before, current) async {
      if (current is RtkHouseRoomLeaveCompleted) {
        final navigator = Navigator.of(context);

        mobileClient.removeMeetingRoomEventListener(
          ref.read(rtkRoomNotifier.notifier),
        );

        await Utils().leave(context, release: current.release);
        navigator.pop();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xff171917),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const LiveTextSection(), vspace1, const TagRow()],
              ),
            ),

            // Participants grid (including local user)
            Expanded(
              child: StreamBuilder(
                initialData: mobileClient.participants.active,
                stream: mobileClient.activeStream,
                builder: (context, snapshot) {
                  final remoteParticipants = snapshot.data ?? [];
                  // Include local user at the beginning, just like rtk-flutter-ui does
                  final allParticipants = <RtkMeetingParticipant>[
                    mobileClient.localUser,
                    ...remoteParticipants.where(
                      (p) => p.id != mobileClient.localUser.id,
                    ),
                  ];

                  if (allParticipants.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 64,
                            color: Colors.white38,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No participants yet',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: allParticipants.length,
                      itemBuilder: (context, index) {
                        final participant = allParticipants[index];
                        final isLocalUser =
                            participant.id == mobileClient.localUser.id;
                        return _ParticipantAvatar(
                          participant: participant,
                          isLocalUser: isLocalUser,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            // Bottom controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  // Mic button
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: RtkSelfAudioToggleButton(
                      meeting: mobileClient,
                      iconColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Leave button
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return RtkLeaveMeetingDialog(
                                meeting: mobileClient,
                                designToken: RtkDesignTokens(
                                  colorToken: RtkColorToken(
                                    brandColor: const Color(0xffa5d6a7),
                                    textOnBrand: const Color(0xfff4f4f4),
                                    backgroundColor: const Color(0xff171917),
                                    textOnBackground: const Color(0xfff4f4f4),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Leave Room',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveEventDetailsWidget extends StatelessWidget {
  const LiveEventDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LiveTextSection(),
              vspace1,
              const TagRow(),
              vspace8,
              RtkJoinButton(
                meeting: mobileClient,
                width: context.width * .9,
                height: context.height * .06,
                onMeetingJoined: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LiveTextSection extends StatelessWidget {
  const LiveTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'LIVE',
              style: TextStyle(
                fontSize: context.adjust(16),
                fontFamily: 'Noto Sans JP',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: context.adjust(8)),
            Text(
              '•',
              style: TextStyle(
                fontSize: context.adjust(12),
                fontFamily: 'Noto Sans JP',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: context.adjust(8)),
            Text(
              '8 Listening',
              style: TextStyle(
                fontSize: context.adjust(16),
                fontFamily: 'Noto Sans JP',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: context.adjust(4)),
        SizedBox(
          width: context.adjust(358),
          child: Text(
            'Binance NFT Chat: Supercharge your spaces',
            style: TextStyle(
              fontSize: context.adjust(20),
              fontFamily: 'Noto Sans JP',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class TagRow extends StatelessWidget {
  const TagRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'NFT',
          style: TextStyle(
            fontSize: context.adjust(14),
            fontFamily: 'Noto Sans JP',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: context.adjust(8)),
        Text(
          '•',
          style: TextStyle(
            fontSize: context.adjust(12),
            fontFamily: 'Noto Sans JP',
            fontWeight: FontWeight.w500,
          ),
        ),
        hspace2,
        Text(
          'Cryptocurrencies',
          style: TextStyle(
            fontSize: context.adjust(14),
            fontFamily: 'Noto Sans JP',
            fontWeight: FontWeight.w400,
          ),
        ),
        hspace2,
        Text(
          '•',
          style: TextStyle(
            fontSize: context.adjust(12),
            fontFamily: 'Noto Sans JP',
            fontWeight: FontWeight.w500,
          ),
        ),
        hspace2,
        Text(
          'Digital creators',
          style: TextStyle(
            fontSize: context.adjust(14),
            fontFamily: 'Noto Sans JP',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _ParticipantAvatar extends StatelessWidget {
  final RtkMeetingParticipant participant;
  final bool isLocalUser;

  const _ParticipantAvatar({
    required this.participant,
    this.isLocalUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar with speaking indicator
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: participant.audioEnabled
                  ? const Color(0xffa5d6a7)
                  : Colors.transparent,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey.shade700,
            child: Text(
              participant.name.isNotEmpty
                  ? participant.name[0].toUpperCase()
                  : '?',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Name with mic indicator
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!participant.audioEnabled)
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(Icons.mic_off, size: 14, color: Colors.red),
              ),
            Flexible(
              child: Text(
                isLocalUser ? '${participant.name} (You)' : participant.name,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
