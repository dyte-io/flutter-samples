import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/di/di.dart';
import 'package:realtimekit_demo/notifiers/states/poll_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPollNotifer extends Notifier<PollStates>
    implements RtkPollsEventListener {
  @override
  void onNewPoll(Poll poll) {
    state = OnNewPoll(poll);
  }

  @override
  PollStates build() {
    return InitialPollState();
  }

  @override
  void onPollUpdates(List<Poll> polls) {}
}

class PollListNotifier extends Notifier<List<Poll>>
    implements RtkPollsEventListener {
  @override
  List<Poll> build() {
    return dyteMobileClient.polls.items;
  }

  @override
  void onPollUpdates(List<Poll> polls) {
    state = polls;
  }

  @override
  void onNewPoll(Poll poll) {}
}
