import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PluginNotifer extends Notifier<List<RtkPlugin>>
    implements RtkPluginsEventListener {
  @override
  List<RtkPlugin> build() {
    return [];
  }

  @override
  void onPluginActivated(RtkPlugin plugin) {
    state = [...state, plugin];
  }

  @override
  void onPluginDeactivated(RtkPlugin plugin) {
    state = state.where((element) => element.id != plugin.id).toList();
  }

  @override
  void onPluginFileRequest(RtkPlugin plugin) {}

  @override
  void onPluginMessage(RtkPlugin plugin, String eventName, String data) {}
}
