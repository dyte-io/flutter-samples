import 'package:realtimekit_demo/di/di.dart';
import 'package:realtimekit_demo/di/providers.dart';
import 'package:realtimekit_demo/notifiers/states/local_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealtimeKitCallBottomBar extends ConsumerStatefulWidget {
  const RealtimeKitCallBottomBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RealtimeKitCallBottomBarState();
}

class _RealtimeKitCallBottomBarState extends ConsumerState<RealtimeKitCallBottomBar> {
  @override
  Widget build(BuildContext context) {
    // final hostPermissions = ref.watch(dyteClient).permissions;
    ref.listen<LocalUserState>(localUserSettingsProvider, (previous, next) {
      next.maybeWhen(
        onUpdate: (_) {
          setState(() {});
        },
        orElse: () {},
      );
    });
    final localUser = dyteMobileClient.localUser;
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.shade800.withAlpha(220)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // if (hostPermissions.mediaPermissions.canPublishAudio)
          IconButton(
            onPressed: () {
              localUser.audioEnabled
                  ? localUser.disableAudio()
                  : localUser.enableAudio();
            },
            icon: Icon(
              localUser.audioEnabled ? Icons.mic : Icons.mic_off,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              localUser.videoEnabled
                  ? localUser.disableVideo()
                  : localUser.enableVideo();
            },
            icon: Icon(
              localUser.videoEnabled ? Icons.videocam : Icons.videocam_off,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: dyteMobileClient.leaveRoom,
            icon: const Icon(
              Icons.call_end,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
