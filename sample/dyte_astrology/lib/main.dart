import 'dart:io';

import 'package:dyte_astrology/call_page.dart';
import 'package:dyte_astrology/room_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'service/http_request.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const JoinRoom(),
    );
  }
}

class JoinRoom extends StatefulWidget {
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "DYTE ASTRO",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abrilFatface(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontSize: 40)),
                  ),
                  GestureDetector(
                      onTap: () async {
                        if (await getPermissions()) {
                          // ignore: use_build_context_synchronously
                          await showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController nameController =
                                    TextEditingController();
                                TextEditingController roomIdController =
                                    TextEditingController();
                                return AlertDialog(
                                  title: const Text("Enter Details"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Name"),
                                      ),
                                      TextField(
                                        controller: roomIdController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Room Id"),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          if (nameController.text
                                                  .trim()
                                                  .isEmpty ||
                                              roomIdController.text
                                                  .trim()
                                                  .isEmpty) {
                                            Get.snackbar(
                                                "Enter Name and Room Id",
                                                "Please Enter name and room Id to join the Astro",
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor: Colors.black,
                                                colorText: Colors.white);
                                          } else {
                                            Get.back();
                                            setState(() {
                                              loading = true;
                                            });
                                            String? token = await HttpRequest
                                                .addParticipant(
                                                    nameController.text.trim(),
                                                    roomIdController.text
                                                        .trim());
                                            if (token != null) {
                                              setState(() {
                                                loading = false;
                                              });
                                              Get.put(RoomStateNotifier(
                                                  nameController.text.trim(),
                                                  token,
                                                  roomIdController.text.trim(),
                                                  false));
                                              Get.to(() => const HomePage());
                                            } else {
                                              Get.snackbar("Error",
                                                  "unable to get token");
                                            }
                                          }
                                        },
                                        child: const Text("JOIN"))
                                  ],
                                );
                              });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(
                          "JOIN AS USER",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.abrilFatface(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 3,
                                  fontSize: 30)),
                        ),
                      )),
                  GestureDetector(
                      onTap: () async {
                        if (await getPermissions()) {
                          // ignore: use_build_context_synchronously
                          await showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController controller =
                                    TextEditingController();
                                return AlertDialog(
                                  title: const Text("Enter Name"),
                                  content: TextField(
                                    controller: controller,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          if (controller.text.trim().isEmpty) {
                                            Get.snackbar("Enter Name",
                                                "Please Enter name",
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor: Colors.black,
                                                colorText: Colors.white);
                                          } else {
                                            Get.back();
                                            setState(() {
                                              loading = true;
                                            });
                                            String? token;
                                            // Room Creation
                                            String? roomId = await HttpRequest
                                                .createMeeting();
                                            if (roomId != null) {
                                              // Adding Participant
                                              token = await HttpRequest
                                                  .addParticipant(
                                                      controller.text.trim(),
                                                      roomId);
                                            }
                                            if (token != null) {
                                              setState(() {
                                                loading = false;
                                              });
                                              Get.put(RoomStateNotifier(
                                                  controller.text.trim(),
                                                  token,
                                                  roomId!,
                                                  true));
                                              Get.to(() => const HomePage());
                                            } else {
                                              Get.snackbar("Error",
                                                  "Unable to get token");
                                            }
                                          }
                                        },
                                        child: const Text("JOIN"))
                                  ],
                                );
                              });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(
                          "JOIN AS ASTRO",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.abrilFatface(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 3,
                                  fontSize: 30)),
                        ),
                      )),
                ],
              ),
      ),
    );
  }
}

Future<bool> getPermissions() async {
  if (Platform.isIOS) return true;
  await Permission.camera.request();
  await Permission.microphone.request();

  while ((await Permission.camera.isDenied)) {
    await Permission.camera.request();
  }
  while ((await Permission.microphone.isDenied)) {
    await Permission.microphone.request();
  }

  return true;
}
