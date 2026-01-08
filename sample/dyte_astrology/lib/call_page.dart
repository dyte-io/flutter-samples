import 'package:dyte_astrology/room_state.dart';
import 'package:dyte_astrology/service/download_manager.dart';
import 'package:dyte_core/dyte_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomStateNotifier roomStateNotifier = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DTYE ASTRO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: roomStateNotifier.showRoomId.value
            ? [
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: roomStateNotifier.roomId.value));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.mail),
                  ),
                )
              ]
            : null,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Obx(() {
            if (roomStateNotifier.remotePeer.value != null) {
              return Expanded(
                // Remote Peer
                child: VideoTile(
                  participant: roomStateNotifier.remotePeer.value,
                  isLocal: false,
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
          Obx(() {
            // Dyte Meeting Video View
            if (roomStateNotifier.roomJoin.value) {
              return const Expanded(
                // Local Peer
                child: VideoTile(
                  isLocal: true,
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
          Obx(
            () => roomStateNotifier.roomJoin.value
                ? SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              roomStateNotifier.toggleVideo();
                            },
                            child: Obx(() => Icon(
                                  Icons.camera_alt,
                                  color: roomStateNotifier.isVideoOn.value
                                      ? null
                                      : Colors.red,
                                ))),
                        InkWell(
                            onTap: () {
                              roomStateNotifier.toggleAudio();
                            },
                            child: Obx(() => Icon(
                                  roomStateNotifier.isAudioOn.value
                                      ? Icons.mic
                                      : Icons.mic_off,
                                  color: roomStateNotifier.isAudioOn.value
                                      ? null
                                      : Colors.red,
                                ))),
                        InkWell(
                            onTap: () {
                              roomStateNotifier.switchCamera();
                            },
                            child: const Icon(Icons.flip_camera_android)),
                        InkWell(
                          child: const Icon(Icons.chat_bubble),
                          onTap: () {
                            Get.bottomSheet(const ChatWidget());
                          },
                        ),
                        InkWell(
                          onTap: () {
                            roomStateNotifier.leaveRoom();
                          },
                          child: const Icon(
                            Icons.call_end,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          )
        ],
      )),
    );
  }
}

// Chat Screen
class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomStateNotifier roomStateNotifier = Get.find();
    final TextEditingController textController = TextEditingController();
    final ScrollController scrollController = ScrollController();
    XFile? attachment;
    void scrollDown() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }

    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(top: BorderSide(color: Colors.white)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 5,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: 50,
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                controller: scrollController,
                itemCount: roomStateNotifier.dyteChatMessage.length,
                itemBuilder: (context, index) {
                  DyteChatMessage message =
                      roomStateNotifier.dyteChatMessage[index];
                  return Row(
                    mainAxisAlignment: message.userId ==
                            roomStateNotifier.dyteClient.value.localUser.userId
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          margin:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: message.userId ==
                                      roomStateNotifier
                                          .dyteClient.value.localUser.userId
                                  ? Colors.blue
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Check if it is a text message or not
                              if ((message is DyteTextMessage))
                                Text(message.message)
                              // Check if it is a image message or not
                              else if (message is DyteImageMessage)
                                InkWell(
                                  // On Tap image download image
                                  onTap: () async {
                                    Get.snackbar(
                                      "Download Start",
                                      "",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.black87,
                                    );
                                    bool success =
                                        await DownloadManager.prepareSaveDir(
                                            message.link);
                                    if (success) {
                                      Get.snackbar(
                                        "Download Successfully",
                                        "",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.black87,
                                      );
                                    } else {
                                      Get.snackbar(
                                        "Download Failed",
                                        "",
                                        colorText: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.black87,
                                      );
                                    }
                                  },
                                  // render image in chat view
                                  child: Image.network(
                                    (message).link,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              // render message time
                              Text(
                                message.time,
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ))
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            ),
          ),
          StatefulBuilder(builder: (context, setState) {
            return Row(
              children: [
                InkWell(
                  onTap: () async {
                    // Pick image from galary
                    XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(
                      () {
                        attachment = image;
                      },
                    );
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.attachment)),
                ),
                // If image is picked then render image inplace of textfield
                if (attachment != null)
                  Expanded(
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(3),
                          child: FutureBuilder(
                              future: attachment!.readAsBytes(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Image.memory(
                                    snapshot.requireData,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                } else if (snapshot.hasError) {
                                  setState(
                                    () {
                                      attachment = null;
                                    },
                                  );
                                  return const SizedBox();
                                } else {
                                  return const SizedBox();
                                }
                              })))
                else
                  Expanded(
                      child: TextField(
                    controller: textController,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        // If image is picked then call `sendImageMessage` otherwise call `sendTextMessage`
                        if (attachment != null) {
                          roomStateNotifier.sendImageMessage(
                              attachment!.path, "file");
                        } else if (textController.text.trim().isNotEmpty) {
                          roomStateNotifier
                              .sendTextMessage(textController.text.trim());
                        }
                        setState(
                          () {
                            attachment = null;
                            textController.text = "";
                          },
                        );
                        scrollDown();
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: RotatedBox(
                              quarterTurns: attachment != null ? 3 : 0,
                              child: const Icon(Icons.send))),
                    ),
                    // Cancel attachment if exist
                    if (attachment != null)
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              attachment = null;
                            },
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 50,
                            )),
                      ),
                  ],
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}

// Video Render
class VideoTile extends StatelessWidget {
  final bool isLocal;
  final DyteMeetingParticipant? participant;
  const VideoTile({super.key, required this.isLocal, this.participant});

  @override
  Widget build(BuildContext context) {
    final RoomStateNotifier roomStateNotifier = Get.find();
    return Obx(
      () => Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          // If participant or localPeer is active speaker then turn border to blue
          border: (roomStateNotifier.activeSpeakerId.isNotEmpty
              ? ((roomStateNotifier.activeSpeakerId.value ==
                              participant?.userId &&
                          !isLocal) ||
                      (roomStateNotifier.activeSpeakerId.value !=
                              participant?.userId &&
                          isLocal))
                  ? Border.all(color: Colors.blue, width: 3)
                  : null
              : null),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            if ((participant != null && !participant!.videoEnabled) ||
                (isLocal && !roomStateNotifier.isVideoOn.value))
              const Center(
                child: Icon(Icons.person_outline_rounded, size: 32),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Dyte VideoView Widget
                child: VideoView(
                  meetingParticipant:
                      participant, // for render remote peer video
                  isSelfParticipant: isLocal, // true if local peer
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5)),
                // Render participant and local peer name
                child: Text(
                  isLocal
                      ? roomStateNotifier.username.value
                      : roomStateNotifier.remotePeer.value!.name,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
