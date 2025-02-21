import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'uno_event.dart';
part 'uno_state.dart';

class UnoBloc extends Bloc<UnoEvent, UnoState> {
  UnoBloc() : super(UnoInitial()) {
    on<UnoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
