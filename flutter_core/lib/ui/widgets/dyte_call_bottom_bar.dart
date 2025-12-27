import 'package:flutter_core/di/di.dart';
import 'package:flutter_core/di/providers.dart';
import 'package:flutter_core/notifiers/states/local_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DyteCallBottomBar extends ConsumerStatefulWidget {
  const DyteCallBottomBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DyteCallBottomBarState();
}

class _DyteCallBottomBarState extends ConsumerState<DyteCallBottomBar> {
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
    final localUser = realtimekitClient.localUser;
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.shade800.withOpacity(.9)),
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
            onPressed: realtimekitClient.leaveRoom,
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
