// blocs/rsvp/rsvp_state.dart

abstract class RsvpState {}

class RsvpInitial extends RsvpState {}

class RsvpLoading extends RsvpState {}

class RsvpSuccess extends RsvpState {}

class RsvpError extends RsvpState {
  final String message;

  RsvpError(this.message);
}
