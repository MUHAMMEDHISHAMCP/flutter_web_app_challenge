// blocs/rsvp/rsvp_event.dart

abstract class RsvpEvent {}

class SubmitRsvpEvent extends RsvpEvent {
  final String name;
  final String email;

  SubmitRsvpEvent(this.name, this.email);
}
