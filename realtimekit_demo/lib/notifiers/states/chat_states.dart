import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

part 'chat_states.freezed.dart';

@freezed
class ChatStates with _$ChatStates {
  const factory ChatStates.initial() = _ChatStates;

  const factory ChatStates.onChatUpdates(List<ChatMessage> messages) =
      _ChatStatesOnChatUpdates;

  const factory ChatStates.onNewChatMessage(ChatMessage message) =
      _ChatStatesOnNewChatMessage;
}
