# Sample app demonstrating usage of RealtimeKit's flutter core SDK

This project is a sample app that demonstrates how to use RealtimeKit's flutter core SDK to build a video conferencing application. It showcases the basic functionalities of the SDK, including joining a meeting, managing participants, and handling audio/video streams.

## Prerequisites

- Flutter SDK installed on your machine. (preferably 3.3X.X)
- An IDE such as Android Studio, IntelliJ IDEA, or Visual Studio Code with Flutter and
- RealtimeKit AuthToken to Join a Meeting.

## RealtimeKit AuthToken for authentication

- Create A Meeting:

```
curl --request POST \\
  --url <https://api.realtime.cloudflare.com/v2/meetings> \\
  --header 'Authorization: Basic <REST-API-Auth-Header>' \\
  --header 'Content-Type: application/json' \\
  --data '{
  "title": "Example",
  "record_on_start": false
}’

```

- Add Participants and Create Auth Token:

```
curl *--request* POST \\
  *--url* <https://api.realtime.cloudflare.com/v2/meetings/meeting_id/participants> \\
  *--header* 'Authorization: Basic <REST-API-Auth-Header>' \\
  *--header* 'Content-Type: application/json' \\
  *--data* '{
  "name": "Test User",
  "picture": "<https://i.imgur.com/test.jpg>",
  "preset_name": "string",
  "client_specific_id": "string"
}'

```

- Use the provided `token` in `authKey` variable in `lib/meeting_config.dart`