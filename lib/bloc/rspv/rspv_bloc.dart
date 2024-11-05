// blocs/rsvp/rsvp_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:flutter_web_app_task/bloc/rspv/rspv_event.dart';
import 'package:flutter_web_app_task/bloc/rspv/rspv_state.dart';
import 'package:flutter_web_app_task/services/api_services.dart';

class RsvpBloc extends Bloc<RsvpEvent, RsvpState> {
  RsvpBloc() : super(RsvpInitial()) {
    on<SubmitRsvpEvent>(_submitEvent);
  }

  Future<void> _submitEvent(SubmitRsvpEvent event, Emitter<RsvpState> emit) async {
    emit(RsvpLoading());
    try {
      await ApiService().rsvpEvent(event.name, event.email);
      emit(RsvpSuccess());
      RsvpSuccess();
    } catch (e) {
      emit(RsvpError(e.toString().replaceAll("Exception:", "")));
    }
  }
}
