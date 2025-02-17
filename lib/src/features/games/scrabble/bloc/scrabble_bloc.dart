import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scrabble_event.dart';
part 'scrabble_state.dart';

class ScrabbleBloc extends Bloc<ScrabbleEvent, ScrabbleState> {
  ScrabbleBloc() : super(ScrabbleInitial()) {
    on<ScrabbleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
