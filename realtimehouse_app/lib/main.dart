import 'package:realtimekit_ui/realtimekit_ui.dart';
import 'package:realtimehouse_app/pages/call_details_page.dart';
import 'package:realtimehouse_app/pages/widgets/call_details.dart';
import 'package:realtimehouse_app/pages/widgets/size/size_config.dart';
import 'package:realtimehouse_app/pages/widgets/size/size_util.dart';
import 'package:realtimehouse_app/provider_logger.dart';
import 'package:realtimehouse_app/riverpod/riverpod.dart';
import 'package:realtimehouse_app/riverpod/states/room_states.dart';
import 'package:realtimehouse_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Add your auth token here
const hiveAuthToken1 = "";

void main() {
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

final RealtimekitClient mobileClient = RealtimekitClient();
final RealtimeKitUIInfo _rtkUIKitInfo = RealtimeKitUIInfo(
  RtkMeetingInfo(authToken: hiveAuthToken1),
  designToken: RtkDesignTokens(
    colorToken: RtkColorToken(
      brandColor: const Color(0xffa5d6a7),
      textOnBrand: const Color(0xff060806),
      backgroundColor: const Color(0xff171917),
      textOnBackground: const Color(0xfff4f4f4),
    ),
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    RtkListenerManager.init(ref);
    RtkListenerManager.instance.registerListener();

    return RtkProvider(
      meeting: mobileClient,
      uiKitInfo: _rtkUIKitInfo,
      child: MaterialApp(
        title: 'RealtimeHouse',
        theme: AppTheme.darkTheme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(rtkRoomNotifier, (before, current) {
      if (current is RtkHouseInitFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Loading Failed: ${(current.error as MeetingError).message}',
            ),
          ),
        );
      } else if (current is RtkHouseInitCompleted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: context.height * .35),
                child: const CallDetailsModal(),
              ),
            );
          },
        );
      } else if (current is RtkHouseRoomJoinFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Joining Room Failed: ${current.error}')),
        );
      } else if (current is RtkHouseRoomJoinStarted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Joining Room 🦄')));
      } else if (current is RtkHouseRoomJoinCompleted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const CallDetailsPage();
            },
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('RealtimeHouse')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            RtkListenerManager.instance.registerListener();
            mobileClient.init(
              RtkMeetingInfo(authToken: _rtkUIKitInfo.meetingInfo.authToken),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Loading RealtimeHouse 🦄')),
            );
          },
          child: const CallDetailsWidget(),
        ),
      ),
    );
  }
}
