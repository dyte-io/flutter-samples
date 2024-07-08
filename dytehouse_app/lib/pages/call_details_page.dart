import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:dytehouse/main.dart';
import 'package:dytehouse/pages/widgets/size/app_size.dart';
import 'package:dytehouse/pages/widgets/size/size_util.dart';
import 'package:dytehouse/pages/widgets/space/vh_space.dart';
import 'package:dytehouse/riverpod/riverpod.dart';
import 'package:dytehouse/riverpod/states/room_states.dart';
import 'package:dytehouse/utils/utils.dart';
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
    ref.listen(
      dyteRoomNotifier,
      (before, current) async {
        if (current is DyteHouseRoomLeaveCompleted) {
          final navigator = Navigator.of(context);

          await Utils().leave(context);
          navigator.pop();
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  vspace2,
                  SizedBox(
                    width: context.width,
                    height: context.height * .6,
                    child: StreamBuilder(
                        initialData: mobileClient.participants.active,
                        stream: mobileClient.activeStream.distinct(
                          (previous, next) =>
                              previous.length == next.length &&
                              previous.map((e) => e.id).toSet().containsAll(
                                    next.map((e) => e.id).toSet(),
                                  ),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            children: [
                              for (final participant in snapshot.data!)
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: DyteParticipantTile(
                                      participant,
                                      width: context.width * .375,
                                      height: context.height * .3,
                                    )),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                hspace1,
                Container(
                  height: context.height * .06,
                  width: context.height * .06,
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: DyteSelfAudioToggleButton(
                    dyteMobileClient: mobileClient,
                    iconColor: Colors.white,
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  minWidth: context.width * .8,
                  height: context.height * .06,
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DyteLeaveMeetingDialog(
                            designToken: DyteDesignTokens(
                              colorToken: DyteColorToken(
                                brandColor: const Color(0xffa5d6a7),
                                textOnBrand: const Color(0xfff4f4f4),
                                backgroundColor: const Color(0xff171917),
                                textOnBackground: const Color(0xfff4f4f4),
                              ),
                            ),
                            dyteMobileClient: mobileClient,
                          );
                        });
                  },
                  child: const Text('Leave Room'),
                ),
                hspace1,
              ],
            )
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
              DyteJoinButton(
                dyteMobileClient: mobileClient,
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
