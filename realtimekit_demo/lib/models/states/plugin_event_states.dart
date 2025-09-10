import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

part 'plugin_event_states.freezed.dart';

@freezed
class PluginEventStates with _$PluginEventStates {
  const factory PluginEventStates.initial() = _PluginEventStatesInitial;
  const factory PluginEventStates.onPluginActivated(RtkPlugin plugin) =
      _PluginEventStatesOnPluginActivated;
  const factory PluginEventStates.onPluginFileRequest(RtkPlugin plugin) =
      _PluginEventStatesOnPluginFileRequest;
  const factory PluginEventStates.onPluginMessage(String message) =
      _PluginEventStatesOnPluginMessage;
  const factory PluginEventStates.onPluginDeactivated(RtkPlugin plugin) =
      _PluginEventStatesOnPluginDeactivated;
}
