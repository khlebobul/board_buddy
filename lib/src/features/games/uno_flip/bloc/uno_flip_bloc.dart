import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'uno_flip_event.dart';
part 'uno_flip_state.dart';

class UnoFlipBloc extends Bloc<UnoFlipEvent, UnoFlipState> {
  UnoFlipBloc() : super(UnoFlipInitial()) {
    on<UnoFlipEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
