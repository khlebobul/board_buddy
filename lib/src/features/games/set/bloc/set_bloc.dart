import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_event.dart';
part 'set_state.dart';

class SetBloc extends Bloc<SetEvent, SetState> {
  SetBloc() : super(SetInitial()) {
    on<SetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
