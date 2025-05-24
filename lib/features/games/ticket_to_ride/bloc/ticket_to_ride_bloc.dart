import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ticket_to_ride_event.dart';
part 'ticket_to_ride_state.dart';

class TicketToRideBloc extends Bloc<TicketToRideEvent, TicketToRideState> {
  TicketToRideBloc() : super(TicketToRideInitial()) {
    on<TicketToRideEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
