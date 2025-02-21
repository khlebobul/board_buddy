import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dos_event.dart';
part 'dos_state.dart';

class DosBloc extends Bloc<DosEvent, DosState> {
  DosBloc() : super(DosInitial()) {
    on<DosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
