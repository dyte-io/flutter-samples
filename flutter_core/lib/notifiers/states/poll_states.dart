import 'package:realtimekit_core/realtimekit_core.dart';

abstract class PollStates {
  const PollStates();

  const factory PollStates.initial() = InitialPollState;
  const factory PollStates.onNewPoll(Poll poll) = OnNewPoll;
  const factory PollStates.onPollUpdates(List<Poll> polls) = OnPollUpdates;
}

class InitialPollState extends PollStates {
  const InitialPollState();
}

class OnNewPoll extends PollStates {
  final Poll poll;

  const OnNewPoll(this.poll);
}

class OnPollUpdates extends PollStates {
  final List<Poll> polls;

  const OnPollUpdates(this.polls);
}
