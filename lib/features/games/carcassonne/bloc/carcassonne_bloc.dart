import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'carcassonne_event.dart';
part 'carcassonne_state.dart';

class CarcassonneBloc extends Bloc<CarcassonneEvent, CarcassonneState> {
  CarcassonneBloc() : super(CarcassonneInitial()) {
    on<CarcassonneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
