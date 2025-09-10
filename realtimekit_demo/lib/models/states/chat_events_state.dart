import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

part 'chat_events_state.freezed.dart';

@freezed
abstract class RealtimeKitChatStates with _$RealtimeKitChatStates {
  const factory RealtimeKitChatStates.initial() = _RealtimeKitChatStates;
  const factory RealtimeKitChatStates.onNewChatUpdate(ChatMessage message) =
      _RealtimeKitChatStatesNewChat;
  const factory RealtimeKitChatStates.onChatUpdates(List<ChatMessage> messages) =
      _RealtimeKitChatStatesChatUpdates;
}
