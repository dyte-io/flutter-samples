import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/di/di.dart';
import 'package:flutter_core/notifiers/states/poll_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPollNotifer extends Notifier<PollStates>
    implements RtkPollsEventListener {
  @override
  PollStates build() {
    return const PollStates.initial();
  }

  @override
  void onNewPoll(Poll poll) {
    state = PollStates.onNewPoll(poll);
  }

  @override
  void onPollUpdates(List<Poll> polls) {
    state = PollStates.onPollUpdates(polls);
  }

  @override
  void onPollUpdate(Poll poll) {}
}

class PollListNotifier extends Notifier<List<Poll>>
    implements RtkPollsEventListener {
  @override
  List<Poll> build() => realtimekitClient.polls.items;

  @override
  void onNewPoll(Poll poll) {
    state = [...state, poll];
  }

  @override
  void onPollUpdates(List<Poll> polls) {
    state = polls;
  }

  @override
  void onPollUpdate(Poll poll) {}
}
