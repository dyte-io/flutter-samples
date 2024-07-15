import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:dytehouse/pages/call_details_page.dart';
import 'package:dytehouse/pages/widgets/call_details.dart';
import 'package:dytehouse/pages/widgets/size/size_config.dart';
import 'package:dytehouse/pages/widgets/size/size_util.dart';
import 'package:dytehouse/provider_logger.dart';
import 'package:dytehouse/riverpod/riverpod.dart';
import 'package:dytehouse/riverpod/states/room_states.dart';
// import 'package:dytehouse/secrets.dart';
import 'package:dytehouse/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}

final DyteMobileClient mobileClient = DyteMobileClient();
final DyteUIKitInfo _dyteUIKitInfo = DyteUIKitInfo(
  DyteMeetingInfoV2(authToken: hiveAuthToken1),
  designToken: DyteDesignTokens(
    colorToken: DyteColorToken(
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
    DyteListenerManager.init(ref);
    DyteListenerManager.instance.registerListener();

    return DyteProvider(
      client: mobileClient,
      uiKitInfo: _dyteUIKitInfo,
      child: MaterialApp(
        title: 'DyteHouse',
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
    ref.listen(dyteRoomNotifier, (before, current) {
      if (current is DyteHouseInitFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Loading Failed: ${(current.error as DyteError).details}'),
          ),
        );
      } else if (current is DyteHouseInitCompleted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: context.height * .35, // Set maximum height here
                ),
                child: const CallDetailsModal(),
              ),
            );
          },
        );
      } else if (current is DyteHouseRoomJoinFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Joining Room Failed: ${current.error}'),
          ),
        );
      } else if (current is DyteHouseRoomJoinStarted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Joining Room 🦄'),
          ),
        );
      } else if (current is DyteHouseRoomJoinCompleted) {
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
      appBar: AppBar(
        title: const Text('DyteHouse'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            DyteListenerManager.instance.registerListener();
            mobileClient.init(DyteMeetingInfoV2(
                authToken: _dyteUIKitInfo.meetingInfo.authToken));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Loading DyteHouse 🦄'),
              ),
            );
          },
          child: const CallDetailsWidget(),
        ),
      ),
    );
  }
}
