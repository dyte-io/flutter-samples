import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/notifiers/states/chat_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<ChatStates>
    implements RtkChatEventListener {
  ChatNotifier() : super(const ChatStates.initial());

  @override
  void onChatUpdates(List<ChatMessage> messages) {
    state = ChatStates.onChatUpdates(messages);
  }

  @override
  void onNewChatMessage(ChatMessage message) {
    state = ChatStates.onNewChatMessage(message);
  }
}
